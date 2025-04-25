import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleepguard_app/modules/home/models/environment_model.dart';

import 'dashboard_tile.dart';

class Dashboard extends StatelessWidget {
  final EnvironmentModel? environments;

  const Dashboard({super.key, required this.environments});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 160.h,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
      ),
      children: [
        DashboardTile(
          title: "Umidade",
          value: "${environments?.humidity.toString()} pg/mL" ?? "",
          icon: Icons.water,
          color: Color(0xFF0066FF),
          textColor: Colors.white,
        ),
        DashboardTile(
          title: "Movimento",
          value: (environments?.moviment ?? false) ? "Sim" : "Não",
          icon: Icons.directions_run,
          color: Color(0xFF242424),
          textColor: Colors.white,
        ),
        DashboardTile(
          title: "Temperatura",
          value: "${environments?.temperature.toString()} °C" ?? "",
          icon: Icons.thermostat,
          color: Color.fromARGB(255, 186, 53, 53),
          textColor: Colors.black,
        ),
        DashboardTile(
          title: "Posição",
          value:
              "${environments?.position.x}, ${environments?.position.y}, ${environments?.position.z}",
          icon: Icons.location_on,
          color: Color(0xFFD6E4FD),
          textColor: Colors.black,
        ),
      ],
    );
  }
}
class DashboardTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final Color textColor;

  const DashboardTile({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          Icon(icon, color: textColor, size: 30.w),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(color: textColor, fontSize: 16.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(color: textColor, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
