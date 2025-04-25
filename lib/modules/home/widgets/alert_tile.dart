import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sleepguard_app/core/ui/theme/theme/extensions/extensions.dart';
import 'package:sleepguard_app/core/ui/theme/theme/styles/text_styles.dart';

class AlertTile extends StatelessWidget {
  final String? dateTime;
  final String? message;

  const AlertTile({super.key, this.dateTime, this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8.r,
            height: 8.r,
            margin: EdgeInsets.only(top: 6.h),
            decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (dateTime != null)
                  Text(
                    dateTime!,
                    style: context.textStyles.semiBold.copyWith(fontSize: 12.sp),
                  ),
                Text(
                  message ?? "",
                  style: context.textStyles.regular.copyWith(fontSize: 14.sp),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AlertListPage extends StatefulWidget {
  const AlertListPage({super.key});

  @override
  _AlertListPageState createState() => _AlertListPageState();
}

class _AlertListPageState extends State<AlertListPage> {
  final List<Map<String, String>> alerts = List.generate(30, (index) {
    return {
      'dateTime': DateFormat('HH:mm').format(DateTime.now().subtract(Duration(minutes: index * 5))),
      'message': 'Alerta #$index',
    };
  });

  int page = 0;
  int pageSize = 10;

  @override
  Widget build(BuildContext context) {
    int startIndex = page * pageSize;
    int endIndex = (page + 1) * pageSize;
    if (endIndex > alerts.length) endIndex = alerts.length;

    return Scaffold(
      appBar: AppBar(title: const Text("Alertas")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: endIndex - startIndex,
                itemBuilder: (context, index) {
                  var alert = alerts[startIndex + index];
                  return AlertTile(
                    dateTime: alert['dateTime'],
                    message: alert['message'],
                  );
                },
              ),
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
                  onPressed: (page + 1) * pageSize < alerts.length
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
    );
  }
}
