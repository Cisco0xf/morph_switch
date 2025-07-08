# MorphSwitch

**Beautiful, animated, and highly customizable toggle switches and sliders for Flutter.**

## Instlation

Add to your `pubspec.yaml`:

```yaml
dependencies:  
  morph_switch: ^1.0.0 
```

Then, run:

```bash
flutter pub get
```

## Basic Usage

### 1- MorphSwith

```dart
import 'package:morphswitch/morphswitch.dart';  

MorphSwitch(  
  stateValue: _isActive,  
  onBgColor: Colors.green,  
  offBgColor: Colors.red,  
  thumbOnIcon: Icons.check,  
  thumbOffIcon: Icons.close,  
  onSwitch: (value) => setState(() => _isActive = value),  
),
```

### 2- MorphSlider

```dart
MorphSlider(  
  stateValue: _isDark,  
  onIcon: Icons.volume_up,  
  offIcon: Icons.volume_off,  
  onSwitch: (value) => setState(() => _isDark = value),  
),
```

## Customization

| Property                | Description                          | Example Values                          |
|-------------------------|--------------------------------------|-----------------------------------------|
| `thumbType`             | Thumb shape (`circle`, `square`)     | `ThumbType.circle`                      |
| `switcherRadius`        | Border radius (per-corner)           | `SwitcherRadius.all(radius: 20)`        |
| `glassProperties`       | Glass effect                         | `GlassProperties(sigma: 2.0)`           |
| `onBgImage`/`offBgImage`| Background images                    | `Paths.dayImg`                          |
| `onLabel`/`offLabel`    | Background Text labels               | `onLabel: "ON"`                         |
| `isVertical`            | Rotate the Switch 90° on x-axis      | `isVertical: true,`                     |
| `imageTransitionStyle`  | Image Transition Style (`fade`, `scale`, `none`)| `imageTransitionStyle: ImageTransitionStyle.fade,`|
| `iconTransitionStyle`   | Icon Transition Style (`fade`, `scale`, `none`)| `iconTransitionStyle: IconTransitionStyle.scale,`|
| `switchCurve`           | Animation curve for all the animated properties| `switchCurve: Curves.bounceOut,`|
| `size`                  | Preset size configuration            | `size: SwitcherSize.medium,`            |
| `textPadding`           | Gives the `onLabel`/`offlabel` extra width| `textPadding: 20,`                 |

## Features
* Smooth Animations: Rotation, scaling, sliding, and dynamic transitions.

* Fully Customizable: Colors, gradients, borders, icons, labels, and shadows.

* Multiple Thumb Types: Circle (ThumbType.circle), square (ThumbType.square), or icon-based.

* Glass Morphism: Frosted-glass effect (GlassProperties).

* Image/Gradient Backgrounds: Use assets or gradients for the switch background.

* Flexible Layouts: Vertical/horizontal orientation, responsive sizing.

* Predefined Sizes: From SwitcherSize.small to xxLarge.

> As a developer, you can modify everything in this package. The switching algorithm is intentionally designed to be simple and easy to adapt to your needs.

## Advanced example

```dart
MorphSwitch(
  stateValue: testSwitcher11,
  onBgImage: Paths.dayImg,      // Put your on image
  offBgImage: Paths.nightImg,   // Put your off image
  switcherRadius: const SwitcherRadius.all(radius: 40.0),
  width: _screenWidth * .45,    // Using custom Size
  height: _screenHeight * .09,
  thumbRadius: 28.0,
  // size: SwitcherSize.larg,
  borderColor: Colors.white,
  thumbOnBgColor: const Color(0xFF77B254), 
  thumbOffBgColor: const Color(0xFF0D47A1),
  thumbOnIcon: Icons.light_mode,
  thumbOffIcon: Icons.dark_mode,
  thumbIconColor: testSwitcher11 ? Colors.yellow : const Color(0xFF64B5F6),
  thumbBorderColor: Colors.white,
  borderWidth: 2.0,
  boxShadow: <BoxShadow>[
    BoxShadow(
      blurRadius: 10.0,
      spreadRadius: 4.0,
      color: testSwitcher11 ? Colors.green.shade500 : Colors.blue.shade500,
      offset: const Offset(4, 4),
    ),
  ],
  onSwitch: (newValue) {
    setState(() => testSwitcher11 = newValue);
  },
),
```

## Screenshots

