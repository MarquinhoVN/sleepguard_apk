import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepguard_app/modules/home/config_controller.dart';
import 'package:sleepguard_app/modules/home/widgets/config_input_field.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  void initState() {
    super.initState();
    context.read<ConfigController>().loadConfig();
  }

  @override
  void dispose() {
    context.read<ConfigController>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configurações")),
      body: Consumer<ConfigController>(
        builder: (context, controller, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: ListView(
                children: [
                  ConfigInputField(label: "Limite X", controller: controller.limiteXController),
                  ConfigInputField(label: "Limite Y", controller: controller.limiteYController),
                  ConfigInputField(label: "Limite Z", controller: controller.limiteZController),
                  ConfigInputField(label: "Temperatura Máxima", controller: controller.tempMaxController),
                  ConfigInputField(label: "Temperatura Mínima", controller: controller.tempMinController),
                  ConfigInputField(label: "Umidade Máxima", controller: controller.umidadeMaxController),
                  ConfigInputField(label: "Umidade Mínima", controller: controller.umidadeMinController),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () => controller.saveConfig(context),
                    child: const Text("Salvar"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
