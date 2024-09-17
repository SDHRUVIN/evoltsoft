import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

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
