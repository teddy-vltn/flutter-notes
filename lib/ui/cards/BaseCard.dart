

import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.elevation = 4,
    this.color = Colors.white,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double elevation;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Create a gradient from the provided color
    final List<Color> gradientColors = [
      color,
      _getVariantColor(color),
    ];

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: elevation,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              backgroundBlendMode: BlendMode.multiply,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Color _getVariantColor(Color baseColor) {
    // Adjust these values to change the gradient variation
    const double factor = 0.12;
    return Color.fromRGBO(
      (baseColor.red - (255 * factor)).clamp(0, 255).toInt(),
      (baseColor.green - (255 * factor)).clamp(0, 255).toInt(),
      (baseColor.blue - (255 * factor)).clamp(0, 255).toInt(),
      1,
    );
  }
}