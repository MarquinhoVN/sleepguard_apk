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

  void setEnvironment(EnvironmentModel? value) {
    _environment = value;
    notifyListeners();
  }

  Future<void> fetchData() async {
    final ref = context.read<FirebaseDatabaseProvider>().database.ref(
      "variaveisAmbiente",
    );

    ref.once().then((snapshot) {
      final data = snapshot.snapshot.value;

      final environment = EnvironmentModel.fromJson(data as Map);
      setEnvironment(environment);
    });

    notifyListeners();
  }
}
