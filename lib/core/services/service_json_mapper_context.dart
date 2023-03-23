import 'package:dart_json_mapper/dart_json_mapper.dart';
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
    }));
  }
}
