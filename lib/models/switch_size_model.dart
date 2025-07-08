class SizeProperties {
  final double height;
  final double width;
  final double thumbRadius;
  final double? sliderThikness;

  const SizeProperties({
    required this.height,
    required this.thumbRadius,
    required this.width,
    this.sliderThikness,
  });

  const SizeProperties.normal()
      : height = 70.0,
        width = 40.0,
        thumbRadius = 18.0,
        sliderThikness = null;
}
