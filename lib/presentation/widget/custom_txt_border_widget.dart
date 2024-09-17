import 'package:evoltsoft/core/index.dart';
import 'package:flutter/material.dart';

class CustomTxtBorderWidget extends StatelessWidget {
  String? label;
  Color? borderColor;
  bool? isSelected;
  Function()? onTap;

  CustomTxtBorderWidget({
    super.key,
    this.label = "",
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.relativeWidth(90.56),
      height: SizeConfig.relativeHeight(5.88),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected!
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: isSelected!
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(36)),
      ),
      child: label!.text(
        context,
        textStyle: Theme.of(context).textTheme.displayMedium,
      ),
    ).addGestureTap(onTap: onTap!);
  }
}
