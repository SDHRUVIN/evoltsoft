import 'package:evoltsoft/core/index.dart';
import 'package:flutter/material.dart';

class CustomBtnWidget extends StatelessWidget {
  double? btnHeight;
  double? btnWidth;
  Color? btnBackGround;
  String? label;
  Color? txtColor;
  Function()? onTap;

  CustomBtnWidget({
    super.key,
    this.btnBackGround,
    this.btnHeight = 7.38,
    this.btnWidth = 91.11,
    this.label = "Button!",
    this.txtColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.relativeHeight(btnHeight!),
      width: SizeConfig.relativeWidth(btnWidth!),
      // color: btnBackGround ?? Theme.of(context).primaryColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.relativeSize(8)),
        // color: btnBackGround ?? Theme.of(context).colorScheme.onSecondary,
        gradient: const LinearGradient(
          colors: [
            Color(0xFF01D6B4),
            Color(0xFF01D79A),
            Color(0xFF01D7A4),
            Color(0xFF06D697),
          ],
        ),
      ),
      alignment: Alignment.center,
      child: label!.subText(
        context,
        color: txtColor ?? Theme.of(context).scaffoldBackgroundColor,
      ),
    ).addGestureTap(onTap: onTap ?? () {});
  }
}
