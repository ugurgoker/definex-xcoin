import 'package:xcoin2/core/services/service_api.dart';
import '../../../core/enums/enum.dart';
import '../../../core/models/model_coin.dart';
import '../../base/base_view_model.dart';

class ViewModelFragmentCoinList extends ViewModelBase {
  final ServiceApi serviceApi;
  final CoinListType coinListType;

  List<ModelCoin> coinList = [];

  ViewModelFragmentCoinList(this.serviceApi, this.coinListType) {
    getCoinList();
  }

  Future<void> getCoinList() async {
    setActivityState(ActivityState.isLoading);
    await serviceApi.client.getMarketList(coinListType.value).then(
      (response) {
        coinList = response.marketList;
        setActivityState(ActivityState.isLoaded);
      },
      onError: (error) {
        handleApiError(error);
      },
    );
  }
}
