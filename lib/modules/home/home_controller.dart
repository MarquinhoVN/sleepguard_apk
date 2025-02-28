import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../app/context.dart';
import '../../core/firebase/database.dart';
import 'models/alert_model.dart';
import 'models/environment_model.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    fetchData();
  }

  EnvironmentModel? _environment;
  EnvironmentModel? get environment => _environment;
  List<AlertModel>? _alerts;
  List<AlertModel>? get alerts => _alerts;

  void setEnvironment(EnvironmentModel? value) {
    _environment = value;
    notifyListeners();
  }

  void setAlerts(List<AlertModel>? value) {
    _alerts = value;
    notifyListeners();
  }

  Future<void> fetchData() async {
    final environmentRef = context
        .read<FirebaseDatabaseProvider>()
        .database
        .ref("variaveisAmbiente");
    final alertsRef = context.read<FirebaseDatabaseProvider>().database.ref(
      "alertas",
    );

    environmentRef.once().then((snapshot) {
      final data = snapshot.snapshot.value;

      final environment = EnvironmentModel.fromJson(data as Map);
      setEnvironment(environment);
    });

    alertsRef.once().then((snapshot) {
      final data = snapshot.snapshot.value;

      Map<String, dynamic> alertsMap = Map<String, dynamic>.from(data as Map);

      setAlerts(alertsMap.values
          .map((alertJson) => AlertModel.fromJson(alertJson))
          .toList());
    });
  }
}
