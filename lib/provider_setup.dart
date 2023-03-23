import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/services/service_api.dart';
import 'core/services/service_app.dart';
import 'core/services/service_device_info.dart';
import 'core/services/service_route.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => ServiceApp()),
  ChangeNotifierProvider(create: (context) => ServiceRoute()),
  ChangeNotifierProvider(create: (context) => ServiceApi()),
  ChangeNotifierProvider(create: (context) => ServiceDeviceInfo()),
];
