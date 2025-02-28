import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dashboard_tile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 140.h,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
      ),
      itemBuilder: (context, index) {
        return DashboardTile(
          title: "Titulo",
          value: "Valor",
          icon: "Icone",
          color: "Cor",
          textColor: "Cor",
        );
      },
    );
  }
}
