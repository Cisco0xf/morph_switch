import 'package:flutter/material.dart';

class GlassProperties {
  final double sigma;
  final Color? color;
  final bool applyGlassLayer;

  const GlassProperties({
    required this.sigma,
    this.applyGlassLayer = false,
    this.color,
  });

  const GlassProperties.init()
      : sigma = 0.0,
        color = const Color(0x1F000000),
        applyGlassLayer = false;
}
