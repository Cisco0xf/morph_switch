class SwitcherRadius {
  final double topLeft;
  final double bottomLeft;
  final double topRight;
  final double bottomRight;

  const SwitcherRadius({
    this.bottomLeft = 0.0,
    this.bottomRight = 0.0,
    this.topLeft = 0.0,
    this.topRight = 0.0,
  });

  const SwitcherRadius.all({required double radius})
      : bottomLeft = radius,
        bottomRight = radius,
        topLeft = radius,
        topRight = radius;
}
