import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      statusbarBrightness: router(context)
          .uiBrightnessStyle
          .dark(systemNavigationBarColor: R.color.white),
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
    return SafeArea(
      child: Column(
        children: [
          Spacer(),
          _getLogo(context, viewModel),
          Spacer(),
          _getBottomText(context, viewModel),
        ],
      ),
    );
  }

  Widget _getLogo(BuildContext context, ViewModelSplash viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(R.drawable.svg.xIcon),
        const SizedBox(width: 4),
        TextBasic(
          text: R.string.logoText,
          fontFamily: R.fonts.robotoBold,
          fontWeight: FontWeight.w700,
          color: R.color.logoTextColor,
          fontSize: 36,
        ),
      ],
    );
  }

  Widget _getBottomText(BuildContext context, ViewModelSplash viewModel) {
    return TextBasic(
      text: R.string.splashBottomText,
      fontFamily: R.fonts.robotoItalic,
      fontWeight: FontWeight.w100,
      color: R.color.logoTextColor,
      fontSize: 12,
    );
  }
}
