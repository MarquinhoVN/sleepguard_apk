import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/firebase/database.dart';
import 'home_controller.dart';
import 'models/environment_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sleepguard')),
      body: Consumer<HomeController>(
        builder: (context, controller, child) {
          final environment = controller.environment;
          final alerts = controller.alerts;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Movimento: ${environment?.moviment}"),
                Text("Temperatura: ${environment?.temperature}"),
                Text("Umidade: ${environment?.humidity}"),
                Text("Posicao: ${environment?.position.x}, ${environment?.position.y}, ${environment?.position.z}"),
                SizedBox(height: 20),
                  for (final alert in alerts ?? [])
                    Text(
                      "Horario: ${alert.hour}, Mensagem: ${alert.message}",
                    ),
              ],
            ),
          );
        }
      ),
    );
  }
}
