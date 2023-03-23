import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:xcoin2/core/models/model_coin.dart';
import 'package:xcoin2/core/models/model_status.dart';
import 'package:xcoin2/core/models/response_market_list.dart';
import '../models/model_base_dropdown.dart';
import '../models/model_dropdown.dart';
import '/core/models/model_alert_dialog.dart';

class ServiceJsonMapperContext {

  ServiceJsonMapperContext() {
    JsonMapper().useAdapter(JsonMapperAdapter(valueDecorators: {

      typeOf<List<ModelAlertDialog>>(): (value) => value.cast<ModelAlertDialog>(),
      typeOf<Set<ModelAlertDialog>>(): (value) => value.cast<ModelAlertDialog>(),

      typeOf<List<BaseDropdown>>(): (value) => value.cast<BaseDropdown>(),
      typeOf<Set<BaseDropdown>>(): (value) => value.cast<BaseDropdown>(),

      typeOf<List<ModelDropdown>>(): (value) => value.cast<ModelDropdown>(),
      typeOf<Set<ModelDropdown>>(): (value) => value.cast<ModelDropdown>(),

      typeOf<List<ModelCoin>>(): (value) => value.cast<ModelCoin>(),
      typeOf<Set<ModelCoin>>(): (value) => value.cast<ModelCoin>(),

      typeOf<List<ResponseTrendingCoin>>(): (value) => value.cast<ResponseTrendingCoin>(),
      typeOf<Set<ResponseTrendingCoin>>(): (value) => value.cast<ResponseTrendingCoin>(),

      typeOf<List<ModelStatus>>(): (value) => value.cast<ModelStatus>(),
      typeOf<Set<ModelStatus>>(): (value) => value.cast<ModelStatus>(),

      typeOf<List<ResponseMarketList>>(): (value) => value.cast<ResponseMarketList>(),
      typeOf<Set<ResponseMarketList>>(): (value) => value.cast<ResponseMarketList>(),
    }));
  }
}
