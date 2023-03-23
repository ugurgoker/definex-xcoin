import 'package:flutter/material.dart';
import '../../../core/resources/_r.dart';
import '../../../core/services/service_device_info.dart';
import '../../base/base_view.dart';
import '../../widgets/widgets_text.dart';
import 'vm_splash.dart';

class ViewSplash extends StatelessWidget with BaseView {
  const ViewSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    di<ServiceDeviceInfo>(context);
    return WidgetBase<ViewModelSplash>(
      statusbarBrightness: router(context).uiBrightnessStyle.dark(systemNavigationBarColor: R.color.white),
      model: ViewModelSplash(),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.white,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelSplash viewModel) {
    return const Center(
      child: TextBasic(text: 'splash'),
    );
  }
}
