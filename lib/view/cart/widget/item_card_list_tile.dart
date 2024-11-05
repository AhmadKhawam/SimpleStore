import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCardListTile extends StatelessWidget {
  const ItemCardListTile({super.key, required this.name, required this.price});
  final String name;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text("\$$price"),
        leading: Image.asset(
          'assets/images/Iconh.png',
          width: 30.w,
          height: 30.h,
        ),
      ),
    );
  }
}
