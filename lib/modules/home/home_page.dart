import 'package:flutter/material.dart';
import 'package:sleepguard_app/core/ui/theme/extensions/extensions.dart';
import 'package:sleepguard_app/modules/home/widgets/alert_tile.dart';
import 'package:sleepguard_app/modules/home/widgets/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:sleepguard_app/modules/home/widgets/title.dart';

import '../../core/firebase/database.dart';
import 'home_controller.dart';
import 'models/environment_model.dart';
import 'pages/config_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  int pageSize = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleepguard'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConfigPage()),
              );
            },
          ),
        ],
      ),
      body: Consumer<HomeController>(
        builder: (context, controller, child) {
          final environment = controller.environment;
          final alerts = controller.alerts;

          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final alertList = alerts ?? [];
          final totalAlerts = alertList.length;

          int startIndex = page * pageSize;
          int endIndex = (page + 1) * pageSize;

          if (endIndex > totalAlerts) {
            endIndex = totalAlerts;
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.fetchData();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleComponent(
                      iconColor: Colors.blueAccent,
                      title: "Painel de monitoramento",
                      icon: Icons.dashboard,
                    ),
                    SizedBox(height: 16.h),
                    Dashboard(environments: environment),
                    SizedBox(height: 16.h),
                    TitleComponent(
                      iconColor: Colors.red,
                      title: "Alertas",
                      icon: Icons.warning,
                    ),
                    SizedBox(height: 8.h),
                    Column(
                      children: List.generate(endIndex - startIndex, (index) {
                        var alert = alertList[startIndex + index];
                        return AlertTile(
                          dateTime: alert?.hour?.toString() ?? '',
                          message: alert?.message ?? '',
                        );
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: page > 0
                              ? () {
                                  setState(() {
                                    page--;
                                  });
                                }
                              : null,
                          child: const Text("Anterior"),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: (page + 1) * pageSize < totalAlerts
                              ? () {
                                  setState(() {
                                    page++;
                                  });
                                }
                              : null,
                          child: const Text("Próximo"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
