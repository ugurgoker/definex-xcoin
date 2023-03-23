import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelStatus {
  final String marketStatus;
  final num ratio;

  ModelStatus({
    required this.marketStatus,
    required this.ratio,
  });
}