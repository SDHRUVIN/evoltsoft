import 'package:evoltsoft/core/index.dart';
import 'package:flutter/material.dart';

class CustomIconNavigation extends StatelessWidget {
  IconData? icon;
  String? label;
  Function()? onTab;

  CustomIconNavigation({
    super.key,
    this.icon,
    this.label,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.only(
          left: SizeConfig.relativeWidth(3),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .secondary, // Set the background color to black
          borderRadius: BorderRadius.circular(10), // Set the radius
        ),
        child: Row(
          children: [
            if (null != icon)
              Icon(
                icon,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            if (null != icon) SizeConfig.horizontalSpacer(2),
            (label ?? "UnKnown").text(
              context,
              textStyle: Theme.of(context).textTheme.displaySmall,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                //
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
