import 'package:flutter/material.dart';

class Clicker extends StatelessWidget {
  const Clicker({
    super.key,
    this.onClick,
    this.onTap,
    this.hasHover = true,
    this.child,
    this.innerPadding = 10.0,
    this.outterPadding = 0.0,
    this.isCircular = false,
    this.onSwipe,
    this.borderRadius,
  });

  final double innerPadding;
  final double outterPadding;

  final void Function()? onClick;
  final void Function()? onTap;

  final bool hasHover;
  final void Function(DragUpdateDetails)? onSwipe;

  final bool isCircular;

  final BorderRadius? borderRadius;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(outterPadding),
      child: GestureDetector(
        onHorizontalDragUpdate: onSwipe,
        onTap: hasHover ? null : onTap,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: isCircular ? const CircleBorder() : null,
            borderRadius: isCircular ? null : borderRadius,
            onTap: hasHover ? onClick : null,
            child: Padding(
              padding: EdgeInsets.all(innerPadding),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
