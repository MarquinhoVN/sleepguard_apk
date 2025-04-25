import 'package:intl/intl.dart';

class AlertModel {
  final String hour;
  final String message;

  const AlertModel({required this.hour, required this.message});

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    final timeParts = (json['horario'] as String).split(':'); 

    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    final second = int.parse(timeParts[2]);

    final fullDateTime = DateTime(
      2025,
      1,
      1,
      hour,
      minute,
      second
    );
    final formattedTime = DateFormat('HH:mm').format(fullDateTime);
    return AlertModel(
      message: json['mensagem'],
      hour: formattedTime,
    );
  }
}
