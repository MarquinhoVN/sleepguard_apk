import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ConfigController with ChangeNotifier {
  final limiteXController = TextEditingController();
  final limiteYController = TextEditingController();
  final limiteZController = TextEditingController();
  final tempMaxController = TextEditingController();
  final tempMinController = TextEditingController();
  final umidadeMaxController = TextEditingController();
  final umidadeMinController = TextEditingController();

  Future<void> loadConfig() async {
    final ref = FirebaseDatabase.instance.ref('config');
    final snapshot = await ref.get();

    if (snapshot.exists) {
      final data = Map<String, dynamic>.from(snapshot.value as Map);

      limiteXController.text = data['limite_x'].toString();
      limiteYController.text = data['limite_y'].toString();
      limiteZController.text = data['limite_z'].toString();
      tempMaxController.text = data['temp_max'].toString();
      tempMinController.text = data['temp_min'].toString();
      umidadeMaxController.text = data['umidade_max'].toString();
      umidadeMinController.text = data['umidade_min'].toString();

      notifyListeners();
    }
  }

  Future<void> saveConfig(BuildContext context) async {
    final ref = FirebaseDatabase.instance.ref('config');

    await ref.set({
      'limite_x': int.parse(limiteXController.text),
      'limite_y': int.parse(limiteYController.text),
      'limite_z': int.parse(limiteZController.text),
      'temp_max': int.parse(tempMaxController.text),
      'temp_min': int.parse(tempMinController.text),
      'umidade_max': int.parse(umidadeMaxController.text),
      'umidade_min': int.parse(umidadeMinController.text),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Configurações salvas com sucesso!')),
    );
  }

  @override
  void dispose() {
    limiteXController.dispose();
    limiteYController.dispose();
    limiteZController.dispose();
    tempMaxController.dispose();
    tempMinController.dispose();
    umidadeMaxController.dispose();
    umidadeMinController.dispose();

    super.dispose();  
  }
}
