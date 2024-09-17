import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
    this.activeColor = Colors.white,
    this.inActiveColor = const Color(0xFF868686),
  }) : super(key: key);

  final bool isActive;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 4),
      height: isActive ? 5 : 3,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(70)),
      ),
    );
  }
}
