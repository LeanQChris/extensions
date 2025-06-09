import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  /// Wrap widget with padding
  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(16)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  /// Center widget
  Widget get center => Center(child: this);

  /// Expand widget
  Widget get expanded => Expanded(child: this);

  /// Flexible widget
  Widget flexible({int flex = 1}) => Flexible(flex: flex, child: this);

  /// Add gesture detector
  Widget onTap(VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: this,
    );
  }

  /// Align widget
  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  /// Wrap widget with SizedBox
  Widget size({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  /// Add opacity to widget
  Widget opacity(double opacity) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

  /// Clip widget with circular border radius
  Widget circular([double radius = 8.0]) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }

  /// Add card elevation
  Widget elevated([double elevation = 4.0]) {
    return Material(
      elevation: elevation,
      child: this,
    );
  }
}
