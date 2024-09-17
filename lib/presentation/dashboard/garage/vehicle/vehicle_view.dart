import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:evoltsoft/presentation/dashboard/garage/vehicle/vehicle_tab.dart';
import 'package:evoltsoft/presentation/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'vehicle_view_model.dart';

class VehicleView extends StatefulWidget {
  const VehicleView({super.key});

  @override
  State<VehicleView> createState() => _VehicleViewState();
}

class _VehicleViewState extends State<VehicleView> with BaseCommonWidget {
  int tabBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VehicleViewModel>.reactive(
      viewModelBuilder: () => VehicleViewModel(),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            appBar: customAppBar(
              context,
              S.of(context).my_account,
              () {
                //
              },
              automaticallyImplyLeading: true,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            body: CentralLoader(
              baseChild: _baseChild(context, viewModel),
              centralViewState: viewModel.viewState,
            ),
          ),
        );
      },
      onViewModelReady: (viewModel) => viewModel.onInit(),
    );
  }

  Widget _baseChild(BuildContext context, VehicleViewModel viewModel) {
    //
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! * 0.9,
      child: ContainedTabBarView(
        initialIndex: tabBarIndex,
        tabs: [
          S.of(context).timeline.text(
                context,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
          S.of(context).reports.text(
                context,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
          S.of(context).distance.text(
                context,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
          S.of(context).maintenance.text(
                context,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
        ],
        views: [
          underDev(context),
          const VehicleTab(),
          underDev(context),
          underDev(context),
        ],
        tabBarViewProperties: const TabBarViewProperties(
          physics: NeverScrollableScrollPhysics(),
        ),
        tabBarProperties: TabBarProperties(
          indicatorColor: Theme.of(context).colorScheme.onSecondary,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          labelColor: Theme.of(context).colorScheme.onSecondary,
          unselectedLabelColor: Theme.of(context).hintColor,
          unselectedLabelStyle: TextStyle(
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}
