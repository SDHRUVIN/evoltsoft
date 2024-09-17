import 'package:evoltsoft/core/constants/enums.dart';
import 'package:evoltsoft/core/extentions/widget_ext.dart';
import 'package:evoltsoft/core/widgets/base/loader.dart';
import 'package:flutter/material.dart';

class CentralLoader extends StatelessWidget {
  final Widget baseChild;
  final CentralViewState? centralViewState;

  const CentralLoader({
    super.key,
    required this.baseChild,
    this.centralViewState,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        baseChild,
        Loader(
          centralViewState: centralViewState,
        ),
      ],
    ).addGestureTap(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
