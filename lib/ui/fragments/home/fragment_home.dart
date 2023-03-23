import 'package:flutter/material.dart';
import 'package:xcoin2/ui/widgets/widget_list_item.dart';
import 'package:xcoin2/ui/widgets/widget_scroll.dart';

import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';
import '../../widgets/widgets_text.dart';
import 'vm_fragment_home.dart';

class FragmentHome extends StatefulWidget {
  const FragmentHome({Key? key}) : super(key: key);

  @override
  State<FragmentHome> createState() => _FragmentHomeState();
}

class _FragmentHomeState extends State<FragmentHome> with AutomaticKeepAliveClientMixin<FragmentHome>, BaseView {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentHome>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentHome(apiService(context)),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.viewBg,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentHome viewModel) {
    return SafeArea(
      child: ScrollWithNoGlowWidget(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getTitle(context, viewModel),
            const SizedBox(height: 12.0),
            _getCoinList(context, viewModel),
          ],
        ),
      ),
    );
  }

  Widget _getTitle(BuildContext context, ViewModelFragmentHome viewModel) {
    return TextBasic(
      text: R.string.trendingCoins,
      color: R.color.titleColor,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _getCoinList(BuildContext context, ViewModelFragmentHome viewModel) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemCount: viewModel.trendingCoins.length,
      itemBuilder: (context, index) {
        var item = viewModel.trendingCoins[index];
        return CoinItem(item: item);
      },
    );
  }
}
