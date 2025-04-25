import 'package:provider/provider.dart';
import 'package:sleepguard_app/core/core.dart';
import 'package:sleepguard_app/modules/home/config_controller.dart'; 


class Providers {

  static get global => [
    Provider(
      create: (_) => FirebaseDatabaseProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ConfigController(),
    ),
  ];
}