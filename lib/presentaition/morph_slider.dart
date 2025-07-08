import 'dart:math';

import 'package:flutter/material.dart';
import 'package:morph_switch/commons/clicker.dart';
import 'package:morph_switch/constants/enums.dart';
import 'package:morph_switch/constants/sizes.dart';
import 'package:morph_switch/constants/texts.dart';
import 'package:morph_switch/models/switch_size_model.dart';

class MorphSlider extends StatefulWidget {
  const MorphSlider({
    super.key,
    required this.stateValue,
    this.thumbType = ThumbType.circle,
    this.isVertical = false,
    this.margin = EdgeInsets.zero,
    this.onSwitch,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.offOpacity = 1.0,
    this.applyThumbRotationAnimation = true,
    this.height,
    this.width,
    this.offIcon,
    this.onIcon,
    this.offSliderColor = const Color(0xFF9E9E9E),
    this.onSliderColor = const Color(0xFF2196F3),
    this.offThumbColor = const Color(0xFF02383C),
    this.onThumbColor = const Color(0xFF02383C),
    this.sliderBorderColor = const Color(0x00000000),
    this.thumbBorderColor = const Color(0x00000000),
    this.sliderBorderWidth = 0.0,
    this.sliderRadius = 5.0,
    this.sliderThikness = 10.0,
    this.thumbBorderWidth = 0.0,
    this.thumbRadius = 22.0,
    this.size = SwitcherSize.medium,
    this.iconTransitionStyle = IconTransitionStyle.scale,
    this.durationInMs = 1000,
    this.direction = TextDirection.ltr,
    this.disabled = false,
    this.thumbIconColor,
    this.switchCurve = Curves.bounceOut,
  })  : assert(
          height != null && width != null || height == null && width == null,
          DIMENSIONS_ERROR,
        ),
        assert(durationInMs > 0),
        assert(sliderThikness > 0.0),
        assert(thumbRadius > 0.0, THUMB_RADIUS),
        assert(offOpacity >= 0.0 || offOpacity <= 1.0);

  /// Callback when the switch state changes (tapped).
  final void Function(bool)? onSwitch;

  /// Callback when the user swipes left on the slider.
  final void Function(bool)? onSwipeLeft;

  /// Callback when the user swipes right on the slider.
  final void Function(bool)? onSwipeRight;

  /// The current state of the switch (on/off).
  final bool stateValue;

  /// The shape of the thumb (circle or square).
  final ThumbType thumbType;

  /// If true, the slider is displayed vertically.
  final bool isVertical;

  /// Outer margin for the slider widget.
  final EdgeInsetsGeometry margin;

  /// Opacity of the slider when in the 'off' state.
  final double offOpacity;

  /// Border radius of the slider track.
  final double sliderRadius;

  /// Predefined size of the switch (small, medium, large).
  final SwitcherSize size;

  /// Color of the slider when in the 'on' state.
  final Color onSliderColor;

  /// Color of the slider when in the 'off' state.
  final Color offSliderColor;

  /// Color of the thumb when in the 'on' state.
  final Color onThumbColor;

  /// Color of the thumb when in the 'off' state.
  final Color offThumbColor;

  /// Border color of the thumb.
  final Color thumbBorderColor;

  /// Border width of the thumb.
  final double thumbBorderWidth;

  /// Border color of the slider track.
  final Color sliderBorderColor;

  /// Border width of the slider track.
  final double sliderBorderWidth;

  /// Icon to display when the switch is in the 'on' state.
  final IconData? onIcon;

  /// Icon to display when the switch is in the 'off' state.
  final IconData? offIcon;

  /// Custom width for the slider (overrides [size] if set).
  final double? width;

  /// Custom height for the slider (overrides [size] if set).
  final double? height;

  /// Radius of the thumb.
  final double thumbRadius;

  /// Thickness of the slider track.
  final double sliderThikness;

  /// Animation style for icon transitions.
  final IconTransitionStyle iconTransitionStyle;

  /// Whether to apply rotation animation to the thumb.
  final bool applyThumbRotationAnimation;

  /// Duration of the animation in milliseconds.
  final int durationInMs;

  /// Text direction for the slider (LTR or RTL).
  final TextDirection direction;

  /// If true, disables all interactions and dims the slider.
  final bool disabled;

  /// Override the color of the icon on the thumb
  final Color? thumbIconColor;

  /// Global Curve that will use in all the animations
  final Curve switchCurve;

  @override
  State<MorphSlider> createState() => _MorphSliderState();
}

class _MorphSliderState extends State<MorphSlider> {
  /// Returns the current switch state (on/off).
  bool get _stateValue => widget.stateValue;

  /// Handle the auto-size
  /// Determines the final size properties for the slider,
  /// either from custom width/height or from the predefined size
  SizeProperties get _finalSize {
    return widget.width != null
        ? SizeProperties(
            height: widget.height!,
            thumbRadius: widget.thumbRadius,
            width: widget.width!,
            sliderThikness: widget.sliderThikness,
          )
        : morphSliderSizes[widget.size]!;
  }

  /// Handles tap events to toggle the switch state.
  void _handleTap() {
    if (widget.onSwitch == null || widget.disabled) {
      return;
    }
    final bool newState = !widget.stateValue;

    widget.onSwitch?.call(newState);
  }

  /// Handles swipe left gesture.
  void _handleSwipeLeft() {
    if (widget.onSwipeLeft == null || widget.disabled) {
      return;
    }

    const bool newState = false;

    widget.onSwipeLeft!.call(newState);
  }

  /// Handles swipe right gesture.
  void _handleSwipeRight() {
    if (widget.onSwipeRight == null || widget.disabled) {
      return;
    }
    const bool newState = true;

    widget.onSwipeRight!.call(newState);
  }

  /// Calculates the icon size based on the thumb radius.
  double get _iconSize => _finalSize.thumbRadius * 0.7;

  /// Builds the icon widget with animation based on the switch state and transition style.
  Widget get _buildIcon {
    final bool hasOnIcon = widget.onIcon != null;
    final bool hasOffIcon = widget.offIcon != null;

    return Transform.rotate(
      angle: -_rotationAngle,
      child: AnimatedSwitcher(
        duration: _globalDuration,
        transitionBuilder: (child, animation) {
          switch (widget.iconTransitionStyle) {
            case IconTransitionStyle.fade:
              {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }
            case IconTransitionStyle.scale:
              {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              }
            case IconTransitionStyle.none:
              {
                return _stateValue
                    ? hasOnIcon
                        ? Icon(
                            widget.onIcon,
                            size: _iconSize,
                            color: widget.thumbIconColor,
                            key: const ValueKey(ON_ICON_ANIMATION_KEY),
                          )
                        : Container(
                            key: const ValueKey(EMPTY_ICONS_KEY),
                          )
                    : hasOffIcon
                        ? Icon(
                            widget.offIcon,
                            size: _iconSize,
                            color: widget.thumbIconColor,
                            key: const ValueKey(OFF_ICON_ANIMATION_KEY),
                          )
                        : Container(
                            key: const ValueKey(EMPTY_ICONS_KEY),
                          );
              }
          }
        },
        child: _stateValue
            ? hasOnIcon
                ? Icon(
                    widget.onIcon,
                    size: _iconSize,
                    color: widget.thumbIconColor,
                    key: const ValueKey(ON_ICON_ANIMATION_KEY),
                  )
                : Container(
                    key: const ValueKey(EMPTY_ICONS_KEY),
                  )
            : hasOffIcon
                ? Icon(
                    widget.offIcon,
                    size: _iconSize,
                    color: widget.thumbIconColor,
                    key: const ValueKey(OFF_ICON_ANIMATION_KEY),
                  )
                : Container(
                    key: const ValueKey(EMPTY_ICONS_KEY),
                  ),
      ),
    );
  }

  /// Returns the dimension for the square thumb.
  double get _thumbDemesion => _finalSize.thumbRadius + 10;

  /// Returns the thumb color based on the switch state.
  Color get _thumbColor =>
      _stateValue ? widget.onThumbColor : widget.offThumbColor;

  /// The duration for all animations in the slider.
  Duration get _globalDuration => Duration(milliseconds: widget.durationInMs);

  /// Globale curve that will use in the animation

  Curve get _globaleCurve => widget.switchCurve;

  /// Builds the thumb widget (circle or square) with animation and icon.
  Widget get _buildThumd {
    switch (widget.thumbType) {
      case ThumbType.circle:
        {
          return SizedBox.square(
            dimension: _finalSize.thumbRadius,
            child: AnimatedContainer(
              duration: _globalDuration,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _thumbColor,
                border: Border.all(
                  color: widget.thumbBorderColor,
                  width: widget.thumbBorderWidth,
                ),
              ),
              child: _buildIcon,
            ),
          );
        }
      case ThumbType.square:
        {
          return SizedBox.square(
            dimension: _thumbDemesion,
            child: AnimatedContainer(
              duration: _globalDuration,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _thumbColor,
                border: Border.all(
                  color: widget.thumbBorderColor,
                  width: widget.thumbBorderWidth,
                ),
              ),
              child: _buildIcon,
            ),
          );
        }
    }
  }

  // Get Travel Distance
  /// Calculates the distance the thumb should travel along the slider.
  double get _thumbPositionDistance {
    final double radius = _finalSize.thumbRadius;

    double position = _finalSize.width - widget.thumbRadius;

    if (radius >= 20 && radius <= 40) {
      position -= 20.0;
    } else if (radius >= 40 && radius <= 60) {
      position -= 25.0;
    } else if (radius >= 60 && radius <= 80) {
      position -= 35.0;
    }

    return position;
  }

  /// Returns the slider color based on the switch state.
  Color get _color =>
      _stateValue ? widget.onSliderColor : widget.offSliderColor;

  /// Rotate the [MorphSlider] 90° on x-axis

  double get _rotationAngle => widget.isVertical ? pi / 2 : 0.0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.direction,
      child: Opacity(
        opacity: widget.disabled ? 0.4 : 1.0,
        child: AnimatedOpacity(
          duration: _globalDuration,
          opacity: _stateValue ? 1.0 : widget.offOpacity,
          child: Padding(
            padding: widget.margin,
            child: Transform.rotate(
              angle: _rotationAngle,
              child: SizedBox(
                height: _finalSize.height,
                width: _finalSize.width,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: _globalDuration,
                          height: _finalSize.sliderThikness,
                          width: _thumbPositionDistance,
                          decoration: BoxDecoration(
                            color: _color,
                            borderRadius: BorderRadius.circular(
                              widget.sliderRadius,
                            ),
                            border: Border.all(
                              color: widget.sliderBorderColor,
                              width: widget.sliderBorderWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: _globalDuration,
                      curve: _globaleCurve,
                      top: 0.0,
                      bottom: 0.0,
                      right: _stateValue ? 0.0 : _thumbPositionDistance,
                      left: _stateValue ? _thumbPositionDistance : 0.0,
                      child: Align(
                        child: AnimatedRotation(
                          duration: _globalDuration,
                          turns:
                              _stateValue && widget.applyThumbRotationAnimation
                                  ? 1.0
                                  : 0.0,
                          child: _buildThumd,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Clicker(
                        hasHover: false,
                        onTap: _handleTap,
                        onSwipe: (detials) {
                          final double deltaX = detials.delta.dx;

                          final bool leftAction = deltaX.isNegative;

                          if (leftAction) {
                            _handleSwipeLeft();
                            return;
                          }

                          _handleSwipeRight();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
