import 'package:flutter/material.dart';
import 'package:xcoin2/ui/base/base_view_model.dart';
import 'package:xcoin2/ui/fragments/market/fragment_market.dart';
import 'package:xcoin2/ui/fragments/portfolio/fragment_portfolio.dart';

import '../../fragments/home/fragment_home.dart';
import '../../fragments/profile/fragment_profile.dart';
import '../../fragments/rewards/fragment_rewards.dart';

class ViewModelHome extends ViewModelBase {
  final PageController pageController = PageController(keepPage: true);
  
  
  int selectedBottomNavigationBarIndex = 0;

  List<Widget> fragments = [
    const FragmentHome(),
    const FragmentPortfolio(),
    const FragmentRewards(),
    const FragmentMarket(),
    const FragmentProfile(),
  ];



  void setSelectedBottomNavigationBarIndex(int index) {
    selectedBottomNavigationBarIndex = index;
    pageController.jumpToPage(selectedBottomNavigationBarIndex);
    notifyListeners();
  }
}
