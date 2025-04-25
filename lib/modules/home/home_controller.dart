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

  bool isLoading = false;
  EnvironmentModel? _environment;
  EnvironmentModel? get environment => _environment;
  List<AlertModel>? _alerts;
  List<AlertModel>? get alerts => _alerts;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setEnvironment(EnvironmentModel? value) {
    _environment = value;
    notifyListeners();
  }

  void setAlerts(List<AlertModel>? value) {
    _alerts = value;
    notifyListeners();
  }

  Future<void> fetchData() async {
  setLoading(true);
  try {
    final environmentRef = context
        .read<FirebaseDatabaseProvider>()
        .database
        .ref("variaveisAmbiente");
    final alertsRef = context
        .read<FirebaseDatabaseProvider>()
        .database
        .ref("alertas");

    final environmentSnapshot = await environmentRef.get();
    final environmentData = environmentSnapshot.value;
    if (environmentData != null && environmentData is Map) {
      final environment = EnvironmentModel.fromJson(
        Map<String, dynamic>.from(environmentData),
      );
      setEnvironment(environment);
    }

    final alertsSnapshot = await alertsRef.get();
    final alertsData = alertsSnapshot.value;
    if (alertsData != null && alertsData is Map) {
      final alertsMap = Map<String, dynamic>.from(alertsData);
      final alertsList = alertsMap.values.map((alertJson) {
        return AlertModel.fromJson(Map<String, dynamic>.from(alertJson));
      }).toList();

      setAlerts(alertsList);
    } else {
      setAlerts([]);
    }
  } catch (e) {
    print('Erro ao buscar dados: $e');
  } finally {
    setLoading(false);
  }
}
}
