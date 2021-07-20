import 'package:chinchin_merchant/common/widgets/keyboard_custom.dart';
import 'package:chinchin_merchant/common/widgets/text_field_container.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatefulWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.controller,
        keyboardType: TestKeyboard.inputType,
        onChanged: widget.onChanged,
        cursorColor: primaryLightColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusColor: primaryLightColor,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
