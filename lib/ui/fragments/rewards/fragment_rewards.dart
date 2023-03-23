import 'package:flutter/material.dart';
import 'package:xcoin2/ui/widgets/widget_scroll.dart';

import '../../../core/resources/_r.dart';
import '../../../core/utils/utilities.dart';
import '../../base/base_view.dart';
import '../../widgets/widget_banner.dart';
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
    return SafeArea(
      child: ScrollWithNoGlowWidget(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          children: [
            BannerBasic(
              title: 'Refer and Earn',
              subtitle: 'Refer you Friend\nand Win Cryptocoins',
              buttonTitle: 'Refer Now',
              iconPath: R.drawable.svg.iconRefer,
              color: R.color.refer,
              iconBottomPadding: 12.0,
              onPressedButton: () => Utilities.alerts.showToast(R.string.comingSoon),
            ),
            const SizedBox(height: 8.0),
            BannerBasic(
              title: 'Rewards',
              subtitle: 'Like, Share\n& get free coupons',
              buttonTitle: 'Share Now',
              iconPath: R.drawable.svg.iconShare,
              color: R.color.reward,
              iconBottomPadding: 16.0,
              iconRightPadding: 20.0,
              onPressedButton: () => Utilities.alerts.showToast(R.string.comingSoon),
            ),
          ],
        ),
      ),
    );
  }
}
