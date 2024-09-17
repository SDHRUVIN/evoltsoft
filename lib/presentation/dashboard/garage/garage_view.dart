import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/domain/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:evoltsoft/presentation/dashboard/garage/garage_view_model.dart';
import 'package:evoltsoft/presentation/widget/custom_app_bar.dart';
import 'package:evoltsoft/presentation/widget/custom_icon_navigation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class GarageView extends StatefulWidget {
  const GarageView({super.key});

  @override
  State<GarageView> createState() => _GarageViewState();
}

class _GarageViewState extends State<GarageView> with BaseCommonWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GarageViewModel>.reactive(
      viewModelBuilder: () => GarageViewModel(),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            appBar: customAppBar(
              context,
              S.of(context).vehicle_list,
              () {
                //
              },
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

  Widget _baseChild(BuildContext context, GarageViewModel viewModel) {
    //
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.relativeWidth(4),
        right: SizeConfig.relativeWidth(4),
        top: SizeConfig.relativeWidth(4),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CustomIconNavigation(
            label: viewModel.carList[index].model,
            onTab: () {
              //
              viewModel.navigateTo(RouteNames.vehicleViewRoute);
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizeConfig.verticalSpacer(1);
        },
        itemCount: viewModel.carList.length,
      ),
    );
  }

  Widget vehicleWidget(BuildContext context, CarResponseEntity model) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.relativeHeight(2)),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .secondary, // Set the background color to black
        borderRadius: BorderRadius.circular(20), // Set the radius
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          model.model!.text(
            context,
            textStyle: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
