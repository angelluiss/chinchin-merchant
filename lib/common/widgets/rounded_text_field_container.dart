import 'package:chinchin_merchant/common/widgets/keyboard_custom.dart';
import 'package:chinchin_merchant/common/widgets/text_field_container.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TestKeyboard.inputType,
        onChanged: onChanged,
        cursorColor: primaryLightColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusColor: primaryLightColor,
          hintText: hintText,
        ),
      ),
    );
  }
}
