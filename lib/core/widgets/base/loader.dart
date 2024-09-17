import 'package:evoltsoft/core/constants/enums.dart';
import 'package:evoltsoft/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final CentralViewState? centralViewState;

  const Loader({Key? key, this.centralViewState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (centralViewState) {
      case CentralViewState.busy:
        return Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: Colors.white.withOpacity(0.1),
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
