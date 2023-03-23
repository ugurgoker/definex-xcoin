import 'package:xcoin2/core/enums/enum.dart';
import 'package:xcoin2/core/models/model_coin.dart';
import 'package:xcoin2/core/services/service_api.dart';
import 'package:xcoin2/ui/base/base_view_model.dart';

class ViewModelFragmentHome extends ViewModelBase {
  final ServiceApi serviceApi;

  List<ModelCoin> trendingCoins = [];

  ViewModelFragmentHome(this.serviceApi) {
    getTrendingCoins();
  }

  Future<void> getTrendingCoins() async {
    setActivityState(ActivityState.isLoading);
    await serviceApi.client.getTrendingCoins().then(
      (response) {
        trendingCoins = response.trendingList;
        setActivityState(ActivityState.isLoaded);
      },
      onError: (error) {
        handleApiError(error);
      },
    );
  }
}
