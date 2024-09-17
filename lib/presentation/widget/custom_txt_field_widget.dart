import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  TextEditingController? textEditingController;
  FocusNode? focusNode;
  InputDecoration? inputDecoration;
  bool? enabled;

  ValueChanged<String>? onChanged;

  CustomTextFieldWidget({
    super.key,
    this.textEditingController,
    this.focusNode,
    this.inputDecoration,
    this.enabled = true,
    this.onChanged,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTetFieldWidgetState();
}

class _CustomTetFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      decoration: widget.inputDecoration,
      enabled: widget.enabled ?? true,
    );
  }
}
