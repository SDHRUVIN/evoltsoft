import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:flutter/material.dart';

class VehicleTab extends StatelessWidget {
  const VehicleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.relativeWidth(4),
        right: SizeConfig.relativeWidth(4),
        top: SizeConfig.relativeWidth(4),
      ),
      child: Column(
        children: [
          distanceWidget(context),
          SizeConfig.verticalSpacer(3),
          fuelConsumptionWidget(context),
        ],
      ),
    );
  }

  Widget distanceWidget(BuildContext context) {
    //
    return Container(
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.all(SizeConfig.relativeHeight(2)),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .secondary, // Set the background color to black
        borderRadius: BorderRadius.circular(20), // Set the radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Jul 2023".text(
            context,
            textStyle: Theme.of(context).textTheme.displayMedium,
          ),
          commonTile(context, S.of(context).distance_mi,
              S.of(context).daily_average, "400", "100", "+134.50%"),
          Divider(
            color: Theme.of(context).hintColor,
          ),
          commonTile(context, S.of(context).expenses, S.of(context).usd_mi,
              "\$105.93", "\$0.26", "42.41%"),
        ],
      ),
    );
  }

  Widget fuelConsumptionWidget(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.all(SizeConfig.relativeHeight(2)),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .secondary, // Set the background color to black
        borderRadius: BorderRadius.circular(20), // Set the radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          S.of(context).fuel_consumption.text(
                context,
                textStyle: Theme.of(context).textTheme.displayMedium,
              ),
          commonTile(context, S.of(context).electric, S.of(context).kwh_100_mi,
              "94.45", "13.00", "+42.41%"),
          Divider(
            color: Theme.of(context).hintColor,
          ),
          commonTile(context, S.of(context).electric, S.of(context).kwh_100_mi,
              "\$11.48", "\$7.00", "75.02%"),
        ],
      ),
    );
  }

  Widget commonTile(BuildContext context, String? title, String? subTitle,
      String? totalValue, String? avgValue, String? avg,
      {IconData icon = Icons.access_time_rounded}) {
    //
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.relativeHeight(1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(
              SizeConfig.relativeWidth(1),
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green, // optional: set a background color
            ),
            child: Icon(
              icon,
            ),
          ),
          SizeConfig.horizontalSpacer(3),
          carDetails(
            context,
            title!,
            subTitle!,
          ),
          const Spacer(),
          carDetails(
            context,
            totalValue!,
            "$avgValue",
            crossAlignment: CrossAxisAlignment.end,
          ),
        ],
      ),
    );
  }

  Widget carDetails(
    BuildContext context,
    String label,
    String value, {
    CrossAxisAlignment crossAlignment = CrossAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: crossAlignment,
      children: [
        label.text(
          context,
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        value.text(
          context,
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
