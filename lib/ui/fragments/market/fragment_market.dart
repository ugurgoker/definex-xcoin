import 'package:flutter/material.dart';
import 'package:xcoin2/ui/base/base_view.dart';
import '../../../core/resources/_r.dart';
import '../../widgets/widgets_text.dart';
import 'vm_fragment_market.dart';

class FragmentMarket extends StatefulWidget {
  const FragmentMarket({Key? key}) : super(key: key);

  @override
  State<FragmentMarket> createState() => _FragmentMarketState();
}

class _FragmentMarketState extends State<FragmentMarket> with AutomaticKeepAliveClientMixin<FragmentMarket>, BaseView {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentMarket>(
      isActiveLoadingIndicator: true,
      statusbarBrightness: router(context).uiBrightnessStyle.dark(systemNavigationBarColor: R.color.white),
      model: ViewModelFragmentMarket(apiService(context)),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.viewBg,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentMarket viewModel) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DefaultTabController(
          length: viewModel.fragments.length,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              _getHeader(context, viewModel),
              const SizedBox(height: 32.0),
              _getCoinTitle(context, viewModel),
              const SizedBox(height: 24.0),
              _getTabbar(context, viewModel),
              _getFragment(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeader(BuildContext context, ViewModelFragmentMarket viewModel) {
    return viewModel.status == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextBasic(
                    text: 'Market is down',
                    color: R.color.titleColor,
                    fontFamily: R.fonts.robotoRegular,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextBasic(
                      text: '- ${viewModel.status!.ratio.toStringAsFixed(2)}%',
                      color: R.color.radicalRed,
                      fontFamily: R.fonts.robotoBold,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              TextBasic(
                text: 'In the past 24 hours',
                color: R.color.grayDark.withOpacity(0.5),
                fontFamily: R.fonts.robotoItalic,
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
              ),
            ],
          );
  }

  Widget _getCoinTitle(BuildContext context, ViewModelFragmentMarket viewModel) {
    return Row(
      children: [
        Expanded(
          child: TextBasic(
            text: 'Coins',
            fontFamily: R.fonts.robotoBold,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: R.color.grayLight),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              TextBasic(
                text: 'Market- INR',
                color: R.color.grayLight,
                fontFamily: R.fonts.robotoItalic,
                fontSize: 12.0,
                fontWeight: FontWeight.w100,
              ),
              const SizedBox(width: 4.0),
              Icon(Icons.arrow_drop_down_rounded, color: R.color.grayLight, size: 16.0),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getTabbar(BuildContext context, ViewModelFragmentMarket viewModel) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: R.color.borderColor, width: 1.5),
            ),
          ),
        ),
        TabBar(
          labelColor: R.color.primary,
          unselectedLabelColor: R.color.grayDark,
          labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: false,
          indicatorColor: R.color.primary,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Gainer'),
            Tab(text: 'Loser'),
            Tab(text: 'Favourites'),
          ],
        ),
      ],
    );
  }

  Widget _getFragment(BuildContext context, ViewModelFragmentMarket viewModel) {
    return Expanded(child: TabBarView(children: viewModel.fragments));
  }
}
