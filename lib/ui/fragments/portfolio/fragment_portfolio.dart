import 'package:flutter/material.dart';

import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';
import '../../widgets/widgets_text.dart';
import 'vm_fragment_portfolio.dart';

class FragmentPortfolio extends StatefulWidget {
  const FragmentPortfolio({Key? key}) : super(key: key);

  @override
  State<FragmentPortfolio> createState() => _FragmentPortfolioState();
}

class _FragmentPortfolioState extends State<FragmentPortfolio> with AutomaticKeepAliveClientMixin<FragmentPortfolio>, BaseView {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentPortfolio>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentPortfolio(apiService(context)),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.white,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentPortfolio viewModel) {
    return GestureDetector(
      onTap: () => viewModel.logout(),
      child: Center(child: TextBasic(text: 'portfolio')),
    );
  }
}
