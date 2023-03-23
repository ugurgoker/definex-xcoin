import 'package:flutter/material.dart';
import 'package:xcoin2/ui/fragments/coin_list/view_model_fragment_coin_list.dart';
import 'package:xcoin2/ui/fragments/market/vm_fragment_market.dart';
import '../../../core/enums/enum.dart';
import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';
import '../../widgets/widget_list_item.dart';

class FragmentCoinList extends StatefulWidget {
  final CoinListType coinListType;
  const FragmentCoinList({Key? key, required this.coinListType}) : super(key: key);

  @override
  State<FragmentCoinList> createState() => _FragmentCoinListState();
}

class _FragmentCoinListState extends State<FragmentCoinList> with AutomaticKeepAliveClientMixin<FragmentCoinList>, BaseView {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentCoinList>(
      isActiveLoadingIndicator: true,
      statusbarBrightness: router(context).uiBrightnessStyle.dark(systemNavigationBarColor: R.color.white),
      model: ViewModelFragmentCoinList(apiService(context), widget.coinListType),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.viewBg,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentCoinList viewModel) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      itemCount: viewModel.coinList.length,
      itemBuilder: (context, index) {
        return CoinItem(item: viewModel.coinList[index]);
      },
    );
  }
}
