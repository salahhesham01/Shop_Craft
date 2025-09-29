import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.obscureText,
    this.suffixIcon,
    this.validator,
  });
  TextEditingController textEditingController;
  final String hintText;
  bool? obscureText;
  Widget? suffixIcon;
  final validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
        ),
        obscureText: widget.obscureText ?? false,
        validator: widget.validator,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff9D9FA0)),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
