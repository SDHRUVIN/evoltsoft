import 'package:evoltsoft/core/index.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
  BuildContext context,
  String? title,
  Function()? onTap, {
  bool? automaticallyImplyLeading = false,
}) {
  return AppBar(
    title: (title ?? "").text(
      context,
      textStyle: Theme.of(context).textTheme.titleLarge,
    ),
    automaticallyImplyLeading: automaticallyImplyLeading!,
    actions: [
      IconButton(
        onPressed: () {
          //
        },
        icon: const Icon(
          Icons.settings,
        ),
      )
    ],
    backgroundColor: Theme.of(context).primaryColor,
  );
}
