import 'dart:io';

import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin BaseCommonWidget {
  BoxDecoration blackShadow() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.3),
          offset: const Offset(
            2.0,
            2.0,
          ),
          blurRadius: 10.0,
          spreadRadius: 5.0,
        )
      ],
    );
  }

  BoxDecoration blackShadowTournament() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          offset: const Offset(
            1,
            1,
          ),
          blurRadius: 40.0,
          spreadRadius: 0.1,
        )
      ],
      border: Border.all(
        color: Colors.black,
        width: 0.1,
      ),
    );
  }

  void showToast(
      {ToastStats state = ToastStats.info,
      String? message,
      Toast toastLength = Toast.LENGTH_SHORT,
      gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: toastColor(state),
      textColor: AppColors.white,
      fontSize: 12.0,
    );
  }

  Color toastColor(ToastStats state) {
    return switch (state) {
      ToastStats.info => AppColors.info,
      ToastStats.error => AppColors.error,
      ToastStats.success => AppColors.success,
      ToastStats.warning => AppColors.warning,
    };
  }

  Future<bool> exitApplication(BuildContext buildContext) async {
    return (await showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        alignment: Alignment.centerLeft,
        backgroundColor: Theme.of(context).cardColor,
        title: S.of(context).exit_app_title.text(
              context,
              textAlign: TextAlign.left,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              textStyle: Theme.of(context).textTheme.displayMedium,
            ),
        content: S.of(context).exit_app_sub_title.text(
              context,
              textAlign: TextAlign.left,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: S.of(context).no.text(
                    context,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    textStyle: Theme.of(context).textTheme.displayMedium,
                  )),
          TextButton(
            onPressed: () => exit(0),
            child: S.of(context).yes.text(
                  context,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  textStyle: Theme.of(context).textTheme.displayMedium,
                ),
          ),
        ],
      ),
    ));
  }

  Widget commonBottomContainer(BuildContext context) {
    return Container(
      width: SizeConfig.relativeWidth(78.67),
      height: SizeConfig.relativeHeight(0.49),
      decoration: ShapeDecoration(
        color: Theme.of(context).cardColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget underDev(BuildContext context) {
    return Center(
      child: S.of(context).under_development.text(
            context,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
    );
  }
}
