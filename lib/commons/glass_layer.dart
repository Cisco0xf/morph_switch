import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:morph_switch/models/glass_layer_model.dart';

// Glass Layer that will be shown over the image || the background

class GlassLayer extends StatelessWidget {
  const GlassLayer({
    super.key,
    required this.borderRadius,
    required this.prop,
  });

  final BorderRadius borderRadius;
  final GlassProperties prop;

  double get sigma => prop.sigma;

  Color? get color => prop.color;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: sigma,
              sigmaY: sigma,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
