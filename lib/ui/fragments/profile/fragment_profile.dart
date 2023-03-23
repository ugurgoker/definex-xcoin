import 'package:flutter/material.dart';

import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';
import '../../widgets/widgets_text.dart';
import 'vm_fragment_profile.dart';

class FragmentProfile extends StatefulWidget {
  const FragmentProfile({Key? key}) : super(key: key);

  @override
  State<FragmentProfile> createState() => _FragmentProfileState();
}

class _FragmentProfileState extends State<FragmentProfile> with AutomaticKeepAliveClientMixin<FragmentProfile>, BaseView {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentProfile>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentProfile(apiService(context)),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.white,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentProfile viewModel) {
    return GestureDetector(
      onTap: () => viewModel.logout(),
      child: Center(child: TextBasic(text: 'profile')),
    );
  }
}
