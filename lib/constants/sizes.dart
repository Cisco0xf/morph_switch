import 'package:morph_switch/constants/enums.dart';
import 'package:morph_switch/models/switch_size_model.dart';

// Sizes for the MorphSwitch according to the selected size
const Map<SwitcherSize, SizeProperties> morphSwitchSizes = {
  SwitcherSize.xSmall: SizeProperties(
    thumbRadius: 18.0,
    height: 40.0,
    width: 70.0,
  ),
  SwitcherSize.small: SizeProperties(
    thumbRadius: 20.0,
    height: 45.0,
    width: 80.0,
  ),
  SwitcherSize.medium: SizeProperties(
    thumbRadius: 20.0,
    height: 50.0,
    width: 90.0,
  ),
  SwitcherSize.large: SizeProperties(
    thumbRadius: 26.0,
    height: 60.0,
    width: 110.0,
  ),
  SwitcherSize.xLarge: SizeProperties(
    thumbRadius: 26.0,
    height: 65.0,
    width: 115.0,
  ),
  SwitcherSize.xxLarge: SizeProperties(
    thumbRadius: 28.0,
    width: 120.0,
    height: 65.0,
  ),
};

// Sizes for the MorphSider according to the selected size
const Map<SwitcherSize, SizeProperties> morphSliderSizes = {
  SwitcherSize.xSmall: SizeProperties(
    thumbRadius: 20.0,
    width: 60.0,
    height: 42.0,
    sliderThikness: 8.0,
  ),
  SwitcherSize.small: SizeProperties(
    thumbRadius: 25.0,
    width: 70.0,
    height: 42.0,
    sliderThikness: 10.0,
  ),
  SwitcherSize.medium: SizeProperties(
    thumbRadius: 30.0,
    width: 90.0,
    height: 46.0,
    sliderThikness: 12.0,
  ),
  SwitcherSize.large: SizeProperties(
    thumbRadius: 35.0,
    width: 110.0,
    height: 50.0,
    sliderThikness: 14.0,
  ),
  SwitcherSize.xLarge: SizeProperties(
    thumbRadius: 45.0,
    width: 120.0,
    height: 54.0,
    sliderThikness: 16.0,
  ),
  SwitcherSize.xxLarge: SizeProperties(
    thumbRadius: 50.0,
    width: 130.0,
    height: 58.0,
    sliderThikness: 16.0,
  ),
};
