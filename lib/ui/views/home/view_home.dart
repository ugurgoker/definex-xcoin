import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';
import 'vm_home.dart';

class ViewHome extends StatelessWidget with BaseView {
  const ViewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetBase<ViewModelHome>(
      statusbarBrightness: router(context).uiBrightnessStyle.dark(systemNavigationBarColor: R.color.white),
      model: ViewModelHome(),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.white,
          body: _getBody(context, viewModel),
          bottomNavigationBar: _getBottomNavigationBar(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelHome viewModel) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: viewModel.pageController,
      children: viewModel.fragments,
    );
  }

  Widget _getBottomNavigationBar(BuildContext context, ViewModelHome viewModel) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(color: R.color.primary, fontSize: 10.0, fontFamily: R.fonts.robotoItalic, fontWeight: FontWeight.w100),
      unselectedLabelStyle: TextStyle(color: R.color.gray, fontSize: 10.0, fontFamily: R.fonts.robotoItalic, fontWeight: FontWeight.w100),
      type: BottomNavigationBarType.fixed,
      backgroundColor: R.color.white,
      onTap: viewModel.setSelectedBottomNavigationBarIndex,
      currentIndex: viewModel.selectedBottomNavigationBarIndex,
      items: [
        _getBottomNavigationBarItem(R.string.home, R.drawable.svg.iconHome),
        _getBottomNavigationBarItem(R.string.porfolio, R.drawable.svg.iconPortfolio),
        _getBottomNavigationBarItem(R.string.rewards, R.drawable.svg.iconRewards),
        _getBottomNavigationBarItem(R.string.market, R.drawable.svg.iconMarket),
        _getBottomNavigationBarItem(R.string.profile, R.drawable.svg.iconProfile),
      ],
    );
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(String label, String iconPath) {
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(iconPath, colorFilter: ColorFilter.mode(R.color.gray, BlendMode.srcIn)),
      activeIcon: SvgPicture.asset(iconPath, colorFilter: ColorFilter.mode(R.color.primary, BlendMode.srcIn)),
    );
  }
}
