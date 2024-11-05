import 'package:flutter/material.dart';
import 'package:task6/core/const_data/app_image.dart';

class BuildPageImages extends StatelessWidget {
  final int currentPage;

  const BuildPageImages({required this.currentPage, super.key});

  @override
  Widget build(BuildContext context) {
    switch (currentPage) {
      case 0:
        return Stack(
          children: [
            Positioned(
              left: 16,
              top: 100,
              child: Image.asset(
                AppImage.three_line,
                width: 50,
                height: 50,
              ),
            ),
            Positioned(
              right: 50,
              top: 200,
              child: Image.asset(
                AppImage.smial,
                width: 50,
                height: 50,
              ),
            ),
            Positioned(
              right: 50,
              bottom: 200,
              child: Image.asset(
                AppImage.right,
                width: 70,
                height: 70,
              ),
            ),
            Positioned(
              left: 50,
              bottom: 100,
              child: Image.asset(
                AppImage.up,
                width: 70,
                height: 70,
              ),
            ),
          ],
        );

      case 1:
        return Stack(
          children: [
            Positioned(
              left: 30,
              top: 130,
              child: Image.asset(
                AppImage.right,
                width: 80,
                height: 80,
              ),
            ),
            Positioned(
              right: 30,
              top: 150,
              child: Image.asset(
                AppImage.smial,
                width: 60,
                height: 60,
              ),
            ),
          ],
        );

      case 2:
        return Positioned(
          top: 100,
          left: 0,
          right: 150,
          child: Image.asset(
            AppImage.smial,
            width: 100,
            height: 100,
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
