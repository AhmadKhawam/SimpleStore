import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToFav extends StatelessWidget {
  const AddToFav({super.key, required this.onFavoriteToggle, required this.isFavorite});
  final bool isFavorite ;
  final VoidCallback onFavoriteToggle;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 52.h,
        width: 52.w,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xffD9D9D9),
            //  border: Border.all(),
            borderRadius: BorderRadius.circular(30.r)),
        child: IconButton(
          onPressed: onFavoriteToggle,
          icon: isFavorite
              ? Image.asset(
                  'assets/images/Vector (6).png',
                  height: 24.h,
                  width: 24.w,
                )
              : Image.asset('assets/images/Vector (4).png'),
        ));
  }
}
