import 'package:flutter/material.dart';
import 'package:task6/core/const_data/app_colors.dart';
import '../profile_controller.dart';

class ProfileSaveButton extends StatelessWidget {
  final ProfileController profileController;
  final GlobalKey<FormState> formKey;

  const ProfileSaveButton({
    Key? key,
    required this.profileController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            profileController.updateProfile();
          }
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColor.green,
          side: const BorderSide(color: Colors.green),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: const Text(
          'Save Now',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
