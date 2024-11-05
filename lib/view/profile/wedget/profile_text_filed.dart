// profile_text_field.dart
import 'package:flutter/material.dart';
import 'package:task6/core/const_data/app_colors.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const ProfileTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 15.0),
          child: Text(
            labelText,
            style: const TextStyle(
              color: AppColor.black,
              fontSize: 16,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            filled: true,
            fillColor: AppColor.lightSilver,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
