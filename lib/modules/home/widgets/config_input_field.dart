import 'package:flutter/material.dart';

class ConfigInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;

  const ConfigInputField({
    super.key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(labelText: label),
        validator: (value) =>
            value == null || value.isEmpty ? 'Campo obrigatório' : null,
      ),
    );
  }
}
