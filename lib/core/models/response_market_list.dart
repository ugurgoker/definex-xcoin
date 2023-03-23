import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;
import 'model_coin.dart';

@jsonSerializable
class ResponseMarketList {
  final List<ModelCoin> marketList;

  ResponseMarketList({
    required this.marketList,
  });
}
