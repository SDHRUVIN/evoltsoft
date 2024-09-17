import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:flutter/material.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: S.of(context).under_development.text(
            context,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
    );
  }
}
