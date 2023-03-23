import 'package:flutter/material.dart';

import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';
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
      model: ViewModelFragmentMarket(apiService(context)),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.white,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentMarket viewModel) {
    return GestureDetector(
      onTap: () => viewModel.logout(),
      child: Center(child: TextBasic(text: 'market')),
    );
  }
}
