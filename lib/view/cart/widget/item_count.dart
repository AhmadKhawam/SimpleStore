import 'package:flutter/material.dart';
import 'package:task6/view/widget/custom_text.dart';


class ItemCount extends StatelessWidget {
  const ItemCount({super.key, required this.totalItem});
  final int totalItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 25,
      ),
      child: CustomText(
        text:
             "$totalItem ${totalItem == 1 ? 'Item' : 'Items'}",
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        alignment: Alignment.bottomLeft,
        height: 0.01,
      ),
    );
  }
}
