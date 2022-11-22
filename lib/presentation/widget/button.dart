import 'package:flutter/material.dart';

// if (!_formKey.currentState!.validate()) {}
class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.width = 300,
      this.height = 40,
      required this.onPress,
      required this.text});
  final double width;
  final double height;
  final VoidCallback onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(text),
      ),
    );
  }
}
