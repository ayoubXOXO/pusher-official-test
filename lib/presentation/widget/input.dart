// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

typedef ValidatorCallBack = String? Function(String? value)?;

class WiggliInput extends StatefulWidget {
  WiggliInput(
      {super.key,
      this.hint,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.isPasswordInput = false,
      this.autofillHints,
      this.initialValue,
      this.keyboardType});
  final String? hint;
  final ValidatorCallBack validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final bool isPasswordInput;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;

  bool? obscureText;

  @override
  State<WiggliInput> createState() => _WiggliInputState();
}

class _WiggliInputState extends State<WiggliInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      obscureText: widget.obscureText!,
      keyboardType: widget.keyboardType,
      autofillHints: widget.autofillHints,
      onSaved: widget.validator,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPasswordInput
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText!;
                  });
                },
                icon: widget.suffixIcon ??
                    Icon(widget.obscureText!
                        ? Icons.visibility
                        : Icons.visibility_off),
              )
            : widget.suffixIcon,
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(
            color: Theme.of(context).hintColor, fontWeight: FontWeight.normal),
      ),
      validator: widget.validator,
    );
  }
}
