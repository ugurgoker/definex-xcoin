import 'package:flutter/material.dart';
import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';
import '../../widgets/widgets_text.dart';
import 'vm_home.dart';

class ViewHome extends StatelessWidget with BaseView {
  const ViewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetBase<ViewModelHome>(
      statusbarBrightness: router(context).uiBrightnessStyle.light(systemNavigationBarColor: R.color.primary.shade600),
      model: ViewModelHome(),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.white,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelHome viewModel) {
    return const Center(child: TextBasic(text: 'home'),);
  }
}
