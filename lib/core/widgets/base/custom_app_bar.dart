import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double? leadingWidth;
  final Widget? title;
  final Widget? leading;
  final Function()? onTapLeading;
  final List<Widget> actions;
  final bool isBack;

  const CustomAppBar({
    Key? key,
    required this.height,
    this.title,
    this.leadingWidth,
    this.actions = const <Widget>[],
    this.leading,
    this.onTapLeading,
    this.isBack = false,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      color: Theme.of(context).colorScheme.surfaceContainer,
    );
  }
}
