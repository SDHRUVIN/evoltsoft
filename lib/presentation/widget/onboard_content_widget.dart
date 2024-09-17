import 'package:evoltsoft/core/index.dart';
import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  OnboardContent({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeConfig.verticalSpacer(8.75),
        title.text(
          context,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.start,
        ),
        SizeConfig.verticalSpacer(2),
        subTitle.text(
          context,
          textStyle: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.start,
        ),
        SizeConfig.verticalSpacer(3.75),
      ],
    );
  }
}
