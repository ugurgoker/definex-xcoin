import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;

@jsonSerializable
class ResponseTrendingCoin {
  final List<ModelCoin> trendingList;

  ResponseTrendingCoin({
    required this.trendingList,
  });
}


@jsonSerializable
class ModelCoin {
  final String longName;
  final String shortName;
  final num currentPrice;
  final num changeRatio;
  final String currency;
  final String imageUrl;

  ModelCoin({
    required this.longName,
    required this.shortName,
    required this.currentPrice,
    required this.changeRatio,
    required this.currency,
    required this.imageUrl,
  });
}
