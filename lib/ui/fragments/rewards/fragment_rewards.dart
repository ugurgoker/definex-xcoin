import 'package:flutter/material.dart';

import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';
import '../../widgets/widgets_text.dart';
import 'vm_fragment_rewards.dart';

class FragmentRewards extends StatefulWidget {
  const FragmentRewards({Key? key}) : super(key: key);

  @override
  State<FragmentRewards> createState() => _FragmentRewardsState();
}

class _FragmentRewardsState extends State<FragmentRewards> with AutomaticKeepAliveClientMixin<FragmentRewards>, BaseView {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentRewards>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentRewards(apiService(context)),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.white,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentRewards viewModel) {
    return GestureDetector(
      onTap: () => viewModel.logout(),
      child: Center(child: TextBasic(text: 'rewards')),
    );
  }
}
