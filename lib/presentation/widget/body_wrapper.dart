import 'package:flutter/material.dart';

class BodyWrapper extends StatelessWidget {
  const BodyWrapper(
      {super.key,
      required this.child,
      this.bodyWidthFactor,
      this.alignment = Alignment.center})
      : assert(bodyWidthFactor == null || bodyWidthFactor <= 1.0),
        assert(bodyWidthFactor == null || bodyWidthFactor >= 0.0);
  final Widget child;
  final double? bodyWidthFactor;
  final Alignment alignment;

  final double _widthParent = 1;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: _widthParent,
      child: FractionallySizedBox(
        alignment: alignment,
        widthFactor: bodyWidthFactor ?? .9,
        child: child,
      ),
    );
  }
}
