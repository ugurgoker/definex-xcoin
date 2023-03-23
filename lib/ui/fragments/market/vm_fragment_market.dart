import 'package:flutter/material.dart';
import 'package:xcoin2/core/models/model_dropdown.dart';
import 'package:xcoin2/core/services/service_api.dart';
import 'package:xcoin2/ui/base/base_view_model.dart';

import '../../../core/enums/enum.dart';
import '../../../core/models/model_status.dart';
import '../coin_list/fragment_coin_list.dart';

class ViewModelFragmentMarket extends ViewModelBase {
  final ServiceApi serviceApi;
  ModelStatus? status;

  ModelDropdown? selectedFilter;

  List<Widget> fragments = [
    const FragmentCoinList(coinListType: CoinListType.all),
    const FragmentCoinList(coinListType: CoinListType.gainers),
    const FragmentCoinList(coinListType: CoinListType.losers),
    const FragmentCoinList(coinListType: CoinListType.favourites),
  ];

  ViewModelFragmentMarket(this.serviceApi) {
    getStatus();
  }

  Future<void> getStatus() async {
    setActivityState(ActivityState.isLoading);
    await serviceApi.client.getMarketStatus().then(
      (response) {
        status = response;
        setActivityState(ActivityState.isLoaded);
      },
      onError: (error) {
        handleApiError(error);
      },
    );
    setActivityState(ActivityState.isLoaded);
  }

  void setSelectedFilter(ModelDropdown? filter) {
    selectedFilter = filter;
    notifyListeners();
  }
}
