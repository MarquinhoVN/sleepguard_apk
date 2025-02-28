import 'package:flutter/material.dart';
import 'package:sleepguard_app/modules/home/widgets/dashboard.dart';
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
      body: const Column(children: [Expanded(child: Dashboard(),),],),
    );
  }
}
