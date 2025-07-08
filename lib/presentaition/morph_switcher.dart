import 'dart:developer' as show;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:morph_switch/commons/clicker.dart';
import 'package:morph_switch/commons/glass_layer.dart';
import 'package:morph_switch/constants/enums.dart';
import 'package:morph_switch/constants/sizes.dart';
import 'package:morph_switch/constants/texts.dart';
import 'package:morph_switch/models/glass_layer_model.dart';
import 'package:morph_switch/models/switch_custom_radius.dart';
import 'package:morph_switch/models/switch_size_model.dart';

class MorphSwitch extends StatefulWidget {
  MorphSwitch({
    super.key,
    required this.stateValue,
    this.onSwitch,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.switcherRadius = const SwitcherRadius.all(radius: 5.0),
    this.borderWidth = 1.3,
    this.hasHover = true,
    this.offBgImage,
    this.offLabel = "",
    this.onLabel = "",
    this.onLabelStyle,
    this.offLabelStyle,
    this.onBgImage,
    this.thumbOnIcon,
    this.thumbOffIcon,
    this.borderColor = const Color(0xFF4B2B30),
    this.onBgColor,
    this.offBgColor,
    this.thumbBorderColor = const Color(0x00000000),
    this.thumbOnBgColor = const Color(0xFF2196F3),
    this.thumbOffBgColor = const Color(0xFF9E9E9E),
    this.thumbType = ThumbType.circle,
    this.imageTransitionStyle = ImageTransitionAnimationStyle.fade,
    this.iconTransitionStyle = IconTransitionStyle.scale,
    this.thumbRadius = 18.0,
    this.isVertical = false,
    this.switchCurve = Curves.bounceOut,
    this.onBgIcon,
    this.offBgIcon,
    this.width,
    this.height,
    this.applyThumbRotationAnimation = true,
    this.margin = EdgeInsets.zero,
    this.squareThumbRadius = 7.0,
    this.thumbBorderWidth = 1.0,
    this.thumbIconColor,
    this.durationInMs = 1000,
    this.offOpacity = 1.0,
    this.size = SwitcherSize.xSmall,
    this.boxShadow,
    this.glassProperties = const GlassProperties.init(),
    this.direction = TextDirection.ltr,
    this.disabled = false,
    this.onGradient,
    this.offGradient,
    this.textPadding = 12.0,
  })  : assert(durationInMs > 0),
        assert(thumbRadius > 0.0, THUMB_RADIUS),
        assert(offOpacity >= 0.0 || offOpacity <= 1.0),
        assert(
          width == null && height == null || width != null && height != null,
          DIMENSIONS_ERROR,
        ),
        assert(
          (onBgImage == null ||
                  !onBgImage.endsWith(".svg") ||
                  !onBgImage.endsWith(".avif")) &&
              (offBgImage == null ||
                  !offBgImage.endsWith(".svg") ||
                  !offBgImage.endsWith(".avif")),
          SVG_ASSERTION,
        ),
        assert(
          !switcherRadius.bottomLeft.isNegative ||
              !switcherRadius.bottomRight.isNegative ||
              !switcherRadius.topLeft.isNegative ||
              !switcherRadius.topRight.isNegative,
          SWTICHER_NEGATIVE_RADIUS,
        );

  /// Current state of the switch (true = on, false = off)
  final bool stateValue;

  /// Text label displayed when switch is ON
  final String onLabel;

  /// Text label displayed when switch is OFF
  final String offLabel;

  /// Text style for the ON label
  final TextStyle? onLabelStyle;

  /// Icon displayed on the thumb when switch is ON
  final TextStyle? offLabelStyle;

  /// Icon displayed on the thumb when switch is ON
  final IconData? thumbOnIcon;

  /// Icon displayed on the thumb when switch is OFF
  final IconData? thumbOffIcon;

  /// Radius of the thumb (affects size)
  /// If [width] || [height] is not given [MorphSwitch] will skip the value
  /// To modify [thumbRadius] [width] && [height] must be given
  /// To give the [thumbRadius] other value with the same [width] && [height]
  /// - Navigate to [morphSwitchSizes]
  /// - Select the target size from the Map
  /// - Ovrride the [height] && [width] in the ui
  /// - Give the [thumbRadius] new value
  final double thumbRadius;

  /// Background image path when switch is ON
  final String? onBgImage;

  /// Background image path when switch is OFF
  final String? offBgImage;

  /// Border radius configuration for the switch [SwitcherRadius]
  final SwitcherRadius switcherRadius;

  /// Border color of the switch
  final Color borderColor;

  /// Border width of the switch
  final double borderWidth;

  /// Shape of the thumb (circle or square)
  final ThumbType thumbType;

  /// Animation style for background image transitions
  final ImageTransitionAnimationStyle imageTransitionStyle;

  /// Animation style for icon transitions
  final IconTransitionStyle iconTransitionStyle;

  /// Background color when switch is ON
  final Color? onBgColor;

  /// Background color when switch is OFF
  final Color? offBgColor;

  /// Animation curve for thumb movement
  final Curve switchCurve;

  /// Whether to show hover effects
  final bool hasHover;

  /// Whether to display switch vertically
  final bool isVertical;

  /// Background icon when switch is ON
  final IconData? onBgIcon;

  /// Background icon when switch is OFF
  final IconData? offBgIcon;

  /// Color of the Icons on the Thumb
  final Color? thumbIconColor;

  /// Callback when switch is tapped/clicked
  final void Function(bool)? onSwitch;

  /// Callback when switch is swiped left
  /// Just in case another action with swiping left needed
  /// By defualt it set the [MorphSwitch] to false by default (offState)
  final void Function(bool)? onSwipeLeft;

  /// Callback when switch is swiped right
  final void Function(bool)? onSwipeRight;

  /// Custom width (if null, uses size preset from [morphSwitchSizes])
  final double? width;

  /// Custom height (if null, uses size preset from [morphSwitchSizes])
  final double? height;

  /// Whether to apply rotation animation to thumb
  final bool applyThumbRotationAnimation;

  /// External margin around the switch
  final EdgeInsetsGeometry margin;

  /// Border radius for square thumb shape
  final double squareThumbRadius;

  /// Border width of the thumb
  final double thumbBorderWidth;

  /// Border color of the thumb
  final Color thumbBorderColor;

  /// Animation duration in milliseconds
  final int durationInMs;

  /// Opacity when switch is OFF (0.0 to 1.0)
  final double offOpacity;

  /// Preset size configuration
  /// According to the value passed to [MorphSwitch]
  /// It will catch the size from [morphSwitchSizes]
  /// CANNOT be, if custom size([width] || [height] || [thumbRadius])
  /// Modify the needed and the size prperty will be ignored
  final SwitcherSize size;

  /// Glass layer effect configuration
  final GlassProperties glassProperties;

  /// Box shadow effects on the outer part of the switch
  final List<BoxShadow>? boxShadow;

  /// Thumb background color when ON
  final Color thumbOnBgColor;

  /// Thumb background color when OFF
  final Color thumbOffBgColor;

  /// TextDirection of the switch
  /// Setting the value to [TextDirection.rtl] need to make some modifcation
  final TextDirection direction;

  /// Disable the button
  /// This property also decrease the value of the [opacity] to 0.4
  final bool disabled;

  /// Gradient background of the [MorphSwitch] on state
  final LinearGradient? onGradient;

  /// Gradient background of the [MorphSwitch] off state
  final LinearGradient? offGradient;

  /// Text || Icon in the background padding
  /// This value gives the [onLabel] and [offLabel] moer padding
  /// To expand the text in the [MorphSwitch]
  /// When to change it ?   => When [fontSize] needes to be increased
  final double textPadding;

  @override
  State<MorphSwitch> createState() => _MorphSwitchState();
}

class _MorphSwitchState extends State<MorphSwitch> {
  // ---------------------------------------------------------------------------
  // State Management
  // ---------------------------------------------------------------------------

  /// Returns the current switch state value.
  /// Prioritizes [widget.stateValue] to ensure single source of truth.

  bool get _switchValue => widget.stateValue;

  // ---------------------------------------------------------------------------
  // Size Calculations
  // ---------------------------------------------------------------------------

  /// Determines the final size properties based on either:
  /// - Explicit [width]/[height] if provided, or
  /// - Predefined sizes from morphSwitchSizes map type of => [SizeProperties]

  SizeProperties get _finalSize {
    return widget.width != null
        ? SizeProperties(
            height: widget.height!,
            thumbRadius: widget.thumbRadius,
            width: widget.width!,
          )
        : morphSwitchSizes[widget.size]!;
  }

  /// Convenience getters for cleaned-up size access
  double get _switcherHeight => _finalSize.height;
  double get _switcherWidth => _finalSize.width;
  double get _thumbRadius => _finalSize.thumbRadius;

  // ---------------------------------------------------------------------------
  // User Interaction Handlers
  // ---------------------------------------------------------------------------

  /// Handles tap events on the switch.
  /// Toggles state and triggers onSwitch callback if provided.
  void _handleOnTap() {
    if (widget.onSwitch == null || widget.disabled) {
      return;
    }
    final bool newState = !widget.stateValue;

    widget.onSwitch?.call(newState);
  }

  /// Handles left swipe gestures.
  /// Forces switch to false state and triggers onSwipeLeft callback.
  void _handleSwipeLeft() {
    if (widget.onSwipeLeft == null || widget.disabled) {
      return;
    }

    const bool newState = false;

    widget.onSwipeLeft?.call(newState);
  }

  /// Handles right swipe gestures.
  /// Forces switch to true state and triggers onSwipeRight callback.
  void _handleSwipeRight() {
    if (widget.onSwipeRight == null || widget.disabled) {
      return;
    }
    const bool newState = true;

    widget.onSwipeRight?.call(newState);
  }

  // ---------------------------------------------------------------------------
  // Thumb Configuration
  // ---------------------------------------------------------------------------

  /// Calculates total thumb dimension when [ThumbType] is [ThumbType.square]
  /// So that the square takes needed sapce to get the target ratio
  /// Used to prevent the shrinking of the thumb and take perfect square
  double get _thumbDimension {
    return _thumbRadius + 10;
  }

  /// Determines thumb color based on current switch state
  Color get _thumbColor =>
      _switchValue ? widget.thumbOnBgColor : widget.thumbOffBgColor;

  // The icon size according to the valu of the thumb radius
  double get _iconSizeRatio => _thumbRadius * .8;

  /// Builds the animated thumb icon with configurable transitions according to [IconTransitionStyle]
  /// If it is none it will ignore the [AnimatedSwitcher] child and take the returned target
  Widget get _buildThumbIcon {
    final bool hasOnIcons = widget.thumbOnIcon != null;
    final bool hasOffIcon = widget.thumbOffIcon != null;

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
                return _switchValue
                    ? hasOnIcons
                        ? Icon(
                            widget.thumbOnIcon,
                            size: _iconSizeRatio,
                            color: widget.thumbIconColor,
                            key: const ValueKey(ON_ICON_SWITCHER_KEY),
                          )
                        : Container(
                            key: const ValueKey(EMPTY_ICON_SWITCHER_KEY),
                          )
                    : hasOffIcon
                        ? Icon(
                            widget.thumbOffIcon,
                            size: _iconSizeRatio,
                            color: widget.thumbIconColor,
                            key: const ValueKey(OFF_ICON_SWITCHER_KEY),
                          )
                        : Container(
                            key: const ValueKey(EMPTY_ICON_SWITCHER_KEY),
                          );
              }
          }
        },
        child: _switchValue
            ? hasOnIcons
                ? Icon(
                    widget.thumbOnIcon,
                    size: _iconSizeRatio,
                    color: widget.thumbIconColor,
                    key: const ValueKey(ON_ICON_SWITCHER_KEY),
                  )
                : Container(
                    key: const ValueKey(EMPTY_ICON_SWITCHER_KEY),
                  )
            : hasOffIcon
                ? Icon(
                    widget.thumbOffIcon,
                    color: widget.thumbIconColor,
                    size: _iconSizeRatio,
                    key: const ValueKey(OFF_ICON_SWITCHER_KEY),
                  )
                : Container(
                    key: const ValueKey(EMPTY_ICON_SWITCHER_KEY),
                  ),
      ),
    );
  }

  /// Building the thumb according to the [ThumbType]
  Widget get _buildThumb {
    switch (widget.thumbType) {
      case ThumbType.circle:
        {
          return SizedBox.square(
            dimension: _thumbRadius,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _thumbColor,
                border: Border.all(
                  color: widget.thumbBorderColor,
                  width: widget.thumbBorderWidth,
                ),
              ),
              alignment: Alignment.center,
              child: _buildThumbIcon,
            ),
          );
        }
      case ThumbType.square:
        {
          return Align(
            alignment: Alignment.center,
            child: SizedBox.square(
              
              dimension: _thumbDimension,
              child: Container(
                decoration: BoxDecoration(
                  color: _thumbColor,
                  borderRadius: BorderRadius.circular(widget.squareThumbRadius),
                  border: Border.all(
                    color: widget.thumbBorderColor,
                    width: widget.thumbBorderWidth,
                  ),
                ),
                child: _buildThumbIcon,
              ),
            ),
          );
        }
    }
  }

  // ---------------------------------------------------------------------------
  // Background Image Configuration
  // ---------------------------------------------------------------------------

  /// Builds the appropriate background image based on current state
  /// Could be given an image in only one state or bothe states (Every thing is handled)
  /// Given a [ValueKey] to control the [AnimatedSwitcher] transitions
  /// Please DO NOT use a image with size over 50 KB to take the beast performance
  ///
  /// If network image needed modify just modify the constructor
  ///
  /* 
  Widget _imageWrapper({required String image}) {
    return Image.network(
      image,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      key: ValueKey(image),
    );
    
  */

  Widget _imageWrapper({required String image}) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      key: ValueKey(image),
    );
  }

  Widget get _buildImage {
    final bool hasOnImage = widget.onBgImage != null;
    final bool hasOffBgImage = widget.offBgImage != null;

    if (hasOnImage && hasOffBgImage) {
      final String targetImage =
          _switchValue ? widget.onBgImage! : widget.offBgImage!;
      return _imageWrapper(image: targetImage);
    }

    if (hasOnImage && !hasOffBgImage) {
      return _switchValue
          ? _imageWrapper(image: widget.onBgImage!)
          : Container(key: const ValueKey(EMPTY_ANIMATION_KEY_2));
    }

    if (!hasOnImage && hasOffBgImage) {
      return !_switchValue
          ? _imageWrapper(image: widget.offBgImage!)
          : Container(key: const ValueKey(EMPTY_ANIMATION_KEY_1));
    }

    return Container(key: const ValueKey(EMPTY_ANIMATION_KEY_0));
  }

  /// Returns background color based on current switch state
  Color? get _bgColor => _switchValue ? widget.onBgColor : widget.offBgColor;

  /// Builds background icon if configured
  /// Also could be given one icon or both
  Widget? get _buildBgIcon {
    final bool hasOnBgIcon = widget.onBgIcon != null;
    final bool hasOffBgIcon = widget.offBgIcon != null;

    if (hasOnBgIcon && hasOffBgIcon) {
      return _switchValue
          ? Icon(
              widget.onBgIcon,
              size: _iconSizeRatio,
            )
          : Icon(
              widget.offBgIcon,
              size: _iconSizeRatio,
            );
    }

    if (hasOnBgIcon && !hasOffBgIcon) {
      return _switchValue
          ? Icon(
              widget.onBgIcon,
              size: _iconSizeRatio,
            )
          : null;
    }
    if (!hasOnBgIcon && hasOffBgIcon) {
      return _switchValue
          ? null
          : Icon(
              widget.offBgIcon,
              size: _iconSizeRatio,
            );
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // Layout Calculations
  // ---------------------------------------------------------------------------

  /// Calculates thumb travel distance based on current configuration
  /// If you want to edit it, please follow the ratio of the width and height in [morphSwitchSizes]
  double get _thumbVerticalDistance {
    final double thumbD = _switcherWidth - (_thumbRadius * 2.0);

    if (_thumbRadius > 30 && _thumbRadius < 50) {
      return _thumbRadius + 40.0;
    }
    if (_thumbRadius > 50 && _thumbRadius < 70) {
      return _thumbRadius + 60.0;
    }

    return thumbD;
  }

  /// Rotate the [MorphSwitch] 90° on x-axis

  double get _rotationAngle => widget.isVertical ? pi / 2 : 0.0;

  /// Calculates main switch border radius to control the radius of each side
  BorderRadius get _switcherBorderRadius {
    final SwitcherRadius switcherRadius = widget.switcherRadius;

    final BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(switcherRadius.topLeft),
      topRight: Radius.circular(switcherRadius.topRight),
      bottomLeft: Radius.circular(switcherRadius.bottomLeft),
      bottomRight: Radius.circular(switcherRadius.bottomRight),
    );

    return borderRadius;
  }

  /// Calculates image border radius accounting for border width
  /// To avoid the fucken small gap in the corners of the button
  BorderRadius get _imageBorderRadius {
    final SwitcherRadius switcherRadius = widget.switcherRadius;

    final topLeft = switcherRadius.topLeft - widget.borderWidth;
    final topRight = switcherRadius.topRight - widget.borderWidth;
    final bottomLeft = switcherRadius.bottomLeft - widget.borderWidth;
    final bottomRight = switcherRadius.bottomRight - widget.borderWidth;

    final BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(topLeft.isNegative ? 0.0 : topLeft),
      topRight: Radius.circular(topRight.isNegative ? 0.0 : topRight),
      bottomLeft: Radius.circular(bottomLeft.isNegative ? 0.0 : bottomLeft),
      bottomRight: Radius.circular(bottomLeft.isNegative ? 0.0 : bottomRight),
    );

    return borderRadius;
  }

  /// Global animation duration derived from widget property
  Duration get _globalDuration => Duration(milliseconds: widget.durationInMs);

  /// Check if the glass layer is shown derived from widget property

  bool get _applyGlass => widget.glassProperties.applyGlassLayer;

  /// --------------------------------------------------------------------------
  /// [Performance Optimization for Multiple Switches]
  ///
  /// If using multiple MorphSwitches in the same screen (e.g., in a list),
  /// uncomment this block to reuse animation controllers across all instances.
  /// This reduces GPU workload by ~40% in dense layouts.
  ///
  /// Usage:
  /// 1. Uncomment the code below
  /// 2. Replace all AnimatedPositioned widgets with:
  ///    ```
  ///    Positioned(
  ///      right: _rightTween,
  ///      left: _leftTween,
  ///      child: _buildThumb,
  ///    )
  ///    ```
  /// --------------------------------------------------------------------------

/*
  late final AnimationController _sharedController;
  late final Animation<double> _sharedAnimation;


  @override
  void initState() {
    _switcherController = AnimationController(
      vsync: this,
      duration: _globalDuration,
    );
    _positionAnimation = CurvedAnimation(
      parent: _switcherController,
      curve: widget.thumbCurve,
    );
    super.initState();
  }

  double get _rightTween => _switchValue
      ? Tween<double>(begin: _thumbVerticalDistance, end: 7.0)
          .animate(_positionAnimation)
          .value
      : 7.0;

  double get _leftTween => _switchValue
      ? 7.0
      : Tween<double>(begin: 7.0, end: _thumbVerticalDistance)
          .animate(_positionAnimation)
          .value;


  @override
  void initState() {
    _sharedController = AnimationController(
      duration: _globalDuration,
      vsync: this, // Ensure mixin is added: `with TickerProviderStateMixin`
    );
    _sharedAnimation = CurvedAnimation(
      parent: _sharedController,
      curve: widget.switchCurve,
    );
    super.initState();
  }

  // Optional: Add this getter for disabled state
  double get _effectiveOpacity => widget.disabled 
      ? 0.38 
      : (_switchValue ? 1.0 : widget.offOpacity);
*/

  LinearGradient? get _catchedGradient =>
      _switchValue ? widget.onGradient : widget.offGradient;

  /// Handle Text Fit in the Button
  Widget? get _lableText {
    final bool hasOnLable = widget.onLabel.isNotEmpty;
    final bool hasOffLable = widget.offLabel.isNotEmpty;

    if (hasOffLable && hasOffLable) {
      return FittedBox(
        child: Text(
          _switchValue ? widget.onLabel : widget.offLabel,
          style: _switchValue ? widget.onLabelStyle : widget.offLabelStyle,
        ),
      );
    }

    if (hasOnLable && !hasOffLable) {
      return FittedBox(
        child: Text(
          widget.onLabel,
          style: widget.onLabelStyle,
        ),
      );
    }

    if (!hasOnLable && hasOffLable) {
      return FittedBox(
        child: Text(
          widget.offLabel,
          style: widget.offLabelStyle,
        ),
      );
    }
    return null;
  }

  // ---------------------------------------------------------------------------
  // Main Build Method
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.direction,
      child: Opacity(
        opacity: widget.disabled ? 0.38 : 1.0,
        child: AnimatedOpacity(
          duration: _globalDuration,
          opacity: _switchValue ? 1.0 : widget.offOpacity,
          child: Padding(
            padding: widget.margin,
            child: Transform.rotate(
              angle: _rotationAngle,
              child: SizedBox(
                width: _switcherWidth,
                height: _switcherHeight,
                child: AnimatedContainer(
                  duration: _globalDuration,
                  decoration: BoxDecoration(
                    borderRadius: _switcherBorderRadius,
                    color: _bgColor,
                    boxShadow: widget.boxShadow,
                    gradient: _catchedGradient,
                    border: Border.all(
                      color: widget.borderColor,
                      width: widget.borderWidth,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: _imageBorderRadius,
                          child: AnimatedSwitcher(
                            duration: _globalDuration,
                            transitionBuilder: (
                              Widget targetImage,
                              Animation<double> animation,
                            ) {
                              switch (widget.imageTransitionStyle) {
                                case ImageTransitionAnimationStyle.fade:
                                  {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: targetImage,
                                    );
                                  }
                                case ImageTransitionAnimationStyle.scale:
                                  {
                                    return ScaleTransition(
                                      scale: animation,
                                      child: targetImage,
                                    );
                                  }
                                case ImageTransitionAnimationStyle.none:
                                  {
                                    return _buildImage;
                                  }
                              }
                            },
                            child: _buildImage,
                          ),
                        ),
                      ),
                      if (_applyGlass) ...{
                        GlassLayer(
                          borderRadius: _switcherBorderRadius,
                          prop: widget.glassProperties,
                        ),
                      },
                      AnimatedPositioned(
                        top: 0.0,
                        bottom: 0.0,
                        right: _switchValue
                            ? _thumbVerticalDistance - widget.textPadding
                            : 6.0,
                        left: _switchValue
                            ? 6.0
                            : _thumbVerticalDistance - widget.textPadding,
                        duration: _globalDuration,
                        curve: widget.switchCurve,
                        child: Center(
                          child: _lableText,
                        ),
                      ),

                      /// if (_buildBgIcon != null) <== Removed to animated from Icon to null
                      AnimatedPositioned(
                        duration: _globalDuration,
                        top: 0.0,
                        bottom: 0.0,
                        curve: widget.switchCurve,
                        right: _switchValue ? _thumbVerticalDistance : 6.0,
                        left: _switchValue ? 6.0 : _thumbVerticalDistance,
                        child: Center(
                          child: _buildBgIcon,
                        ),
                      ),
                      AnimatedPositioned(
                        top: 0.0,
                        bottom: 0.0,
                        curve: widget.switchCurve,
                        right: _switchValue ? 7.0 : _thumbVerticalDistance,
                        left: _switchValue ? _thumbVerticalDistance : 7.0,
                        duration: _globalDuration,
                        child: AnimatedRotation(
                          turns:
                              _switchValue && widget.applyThumbRotationAnimation
                                  ? 1.0
                                  : 0.0,
                          duration: _globalDuration,
                          child: _buildThumb,
                        ),
                      ),
                      Positioned.fill(
                        child: Clicker(
                          borderRadius: _switcherBorderRadius,
                          hasHover: widget.hasHover,
                          onClick: _handleOnTap,
                          onTap: _handleOnTap,
                          onSwipe: (details) {
                            final double deltaX = details.delta.dx;

                            show.log("Current DeltaY Value : $deltaX");

                            final bool leftDestination = deltaX.isNegative;

                            if (leftDestination) {
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
      ),
    );
  }
}
