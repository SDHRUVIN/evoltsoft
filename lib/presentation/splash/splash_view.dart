import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          body: Center(
            child: S.of(context).evoltsoft.text(
                  context,
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                ),
          ),
        );
      },
      onViewModelReady: (viewModel) => viewModel.onInit(),
    );
  }
}
