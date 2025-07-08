import 'package:example/commons.dart';
import 'package:flutter/material.dart';
import 'package:morph_switch/morph_switch.dart';
import 'package:morph_switch/presentaition/morph_slider.dart';

class EampleScreen extends StatefulWidget {
  const EampleScreen({super.key});

  @override
  State<EampleScreen> createState() => _EampleScreenState();
}

class _EampleScreenState extends State<EampleScreen> {
  SizedBox get _gapH => const SizedBox(height: 30);

  double get _screenWidth => MediaQuery.sizeOf(context).width;
  double get _screenHeight => MediaQuery.sizeOf(context).height;

  Widget get _verticalDivider =>
      SizedBox(height: _screenHeight * .12, child: const VerticalDivider());

  // Test Values

  bool testSwitcher1 = false;
  bool testSwitcher2 = false;
  bool testSwitcher3 = false;
  bool testSwitcher4 = false;
  bool testSwitcher5 = false;
  bool testSwitcher6 = false;
  bool testSwitcher7 = false;
  bool testSwitcher8 = false;
  bool testSwitcher9 = false;
  bool testSwitcher10 = false;
  bool testSwitcher11 = false;
  bool testSwitcher12 = false;
  bool testSwitcher13 = false;
  bool testSwitcher14 = false;
  bool testSwitcher15 = false;
  bool testSwitcher16 = false;
  bool testSwitcher17 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MorphSwitch"),
        centerTitle: true,
        backgroundColor: const Color(0xFF4E9F3D),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _gapH,
              // First Button iN the Top of the screen
              MorphSwitch(
                stateValue: testSwitcher1,
                switcherRadius: const SwitcherRadius.all(radius: 20.0),
                onBgColor: const Color(0xFFB6F500),
                offBgColor: const Color(0xFFFFFADC),
                thumbOnBgColor: const Color(0xFFFF2A6D),
                thumbOffBgColor: const Color(0xFF00FF9D),
                onSwitch: (newValue) {
                  setState(() => testSwitcher1 = newValue);
                },
              ),
              _gapH,
              // First Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MorphSwitch(
                    stateValue: testSwitcher2,
                    onBgImage: Paths.onState1,
                    offBgImage: Paths.offState1,
                    size: SwitcherSize.medium,
                    borderWidth: 2.0,
                    thumbOffBgColor: Colors.yellow,
                    thumbOnIcon: Icons.dark_mode,
                    thumbOffIcon: Icons.light_mode,
                    thumbOnBgColor: const Color(0xFF638C6D),
                    borderColor: Colors.grey,
                    switcherRadius: const SwitcherRadius.all(radius: 30.0),
                    onSwitch: (newState) {
                      setState(() => testSwitcher2 = newState);
                    },
                  ),
                  _verticalDivider,
                  MorphSwitch(
                    stateValue: testSwitcher3,
                    onBgImage: Paths.onState2,
                    offBgImage: Paths.offState2,
                    thumbOffBgColor: const Color(0xFF3E7B27),
                    thumbOnBgColor: const Color(0xFFFF9D23),
                    thumbType: ThumbType.square,
                    size: SwitcherSize.medium,
                    borderColor: const Color(0xFFA5B68D),
                    borderWidth: 2.0,
                    thumbOnIcon: Icons.cloud_rounded,
                    thumbOffIcon: Icons.cloud_queue,
                    switcherRadius: const SwitcherRadius.all(radius: 15.0),
                    onSwitch: (newState) {
                      setState(() => testSwitcher3 = newState);
                    },
                  ),
                ],
              ),
              const Divider(),
              _gapH,
              // Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MorphSwitch(
                    stateValue: testSwitcher5,
                    onBgImage: Paths.onState2,
                    offBgImage: Paths.offState2,
                    thumbOffBgColor: const Color(0xFF73EC8B),
                    thumbOnBgColor: const Color(0xFFFEFF9F),
                    thumbType: ThumbType.square,
                    size: SwitcherSize.xLarge,
                    glassProperties: const GlassProperties(
                      sigma: 1.0,
                      applyGlassLayer: true,
                    ),
                    borderColor: const Color(0xFFA5B68D),
                    borderWidth: 2.0,
                    thumbOnIcon: Icons.rocket_launch,
                    thumbOffIcon: Icons.energy_savings_leaf,
                    applyThumbRotationAnimation: false,
                    switchCurve: Curves.bounceIn,
                    switcherRadius: const SwitcherRadius.all(radius: 15.0),
                    onSwitch: (newState) {
                      setState(() => testSwitcher5 = newState);
                    },
                  ),
                  _verticalDivider,
                  MorphSwitch(
                    stateValue: testSwitcher4,
                    onBgImage: Paths.onState1,
                    offBgImage: Paths.offState1,
                    size: SwitcherSize.xLarge,
                    borderWidth: 2.0,
                    thumbOffBgColor: const Color(0xFFE0FBE2),
                    thumbOnBgColor: const Color(0xFFACE1AF),
                    thumbBorderColor: Colors.white,
                    thumbBorderWidth: 1.5,
                    thumbOnIcon: Icons.dark_mode,
                    thumbOffIcon: Icons.light_mode,
                    borderColor: Colors.grey,
                    thumbType: ThumbType.circle,
                    applyThumbRotationAnimation: true,
                    iconTransitionStyle: IconTransitionStyle.scale,
                    imageTransitionStyle: ImageTransitionAnimationStyle.scale,
                    switcherRadius: const SwitcherRadius.all(radius: 40.0),
                    onSwitch: (newState) {
                      setState(() => testSwitcher4 = newState);
                    },
                  ),
                ],
              ),

              // Third Row

              const Divider(),
              _gapH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MorphSwitch(
                    stateValue: testSwitcher7,
                    size: SwitcherSize.large,
                    switcherRadius: const SwitcherRadius(
                      topLeft: 30.0,
                      bottomLeft: 30.0,
                      topRight: 15.0,
                      bottomRight: 15.0,
                    ),
                    applyThumbRotationAnimation: false,
                    switchCurve: Curves.easeOutQuart,
                    durationInMs: 2000,
                    thumbType:
                        testSwitcher7 ? ThumbType.square : ThumbType.circle,
                    onLabel: "ON",
                    onLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    offLabel: "OFF",
                    offLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    thumbOnBgColor: Colors.green,
                    thumbOffBgColor: Colors.red,
                    onBgColor: const Color(0xFFb7cc92),
                    offBgColor: const Color(0xFFf19c79),
                    thumbOnIcon: Icons.volume_up_rounded,
                    thumbOffIcon: Icons.volume_down_rounded,
                    onSwitch: (newState) {
                      setState(() => testSwitcher7 = newState);
                    },
                  ),
                  _verticalDivider,
                  MorphSwitch(
                    stateValue: testSwitcher8,
                    size: SwitcherSize.large,
                    thumbOnBgColor: const Color(0xFF3eff8b),
                    thumbOffBgColor: const Color(0xFFb5838d),
                    thumbOnIcon: Icons.favorite,
                    thumbOffIcon: Icons.favorite_border,
                    onGradient: const LinearGradient(
                      colors: [
                        Color(0xFF3eff8b),
                        Color(0xFF31d843),
                        Color(0xFF38a700),
                        Color(0xFF386c0b),
                        Color(0xFFeaebf0),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    durationInMs: 500,
                    offGradient: const LinearGradient(
                      colors: [
                        Color(0xFFb5838d),
                        Color(0xFFb5838d),
                        Color(0xFFe5989b),
                        Color(0xFFffb4a2),
                        Color(0xFFffcdb2),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    thumbBorderWidth: 1.2,
                    thumbBorderColor: const Color(0xFF040303),
                    borderColor: const Color(0xFF040303),
                    switcherRadius: const SwitcherRadius(
                      topLeft: 30.0,
                      bottomLeft: 10.0,
                      topRight: 10.0,
                      bottomRight: 30.0,
                    ),
                    onSwitch: (newState) {
                      setState(() => testSwitcher8 = newState);
                    },
                  ),
                ],
              ),

              const Divider(),
              _gapH,

              MorphSwitch(
                stateValue: testSwitcher9,
                width: _screenWidth * .9,
                height: _screenHeight * .07,
                thumbRadius: 25.0,
                switcherRadius: const SwitcherRadius.all(radius: 40.0),
                onBgColor: Colors.green,
                offBgColor: Colors.red,
                thumbOnBgColor: const Color(0xFF3eff8b),
                thumbOffBgColor: Colors.grey,
                thumbOnIcon: Icons.mood,
                thumbOffIcon: Icons.mood_bad,
                thumbIconColor: Colors.indigo,
                onBgIcon: Icons.credit_card,
                offBgIcon: Icons.credit_card_off,
                onSwitch: (newState) {
                  setState(() => testSwitcher9 = newState);
                },
              ),
              _gapH,

              MorphSwitch(
                stateValue: testSwitcher9,
                width: _screenWidth * .7,
                height: _screenHeight * .07,
                thumbRadius: 25.0,
                switcherRadius: const SwitcherRadius.all(radius: 40.0),
                onBgColor: Colors.green,
                offBgColor: Colors.red,
                thumbOnBgColor: const Color(0xFF3eff8b),
                thumbOffBgColor: Colors.grey,
                thumbOnIcon: Icons.mood,
                thumbOffIcon: Icons.mood_bad,
                thumbIconColor: Colors.indigo,
                onLabel: "HAPPY",
                offLabel: "SAD",
                onLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                offLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                /* onBgIcon: Icons.credit_card,
                offBgIcon: Icons.credit_card_off, */
                onSwitch: (newState) {
                  setState(() => testSwitcher9 = newState);
                },
              ),

              _gapH,

              MorphSwitch(
                stateValue: testSwitcher9,
                width: _screenWidth * .5,
                height: _screenHeight * .07,
                thumbRadius: 25.0,
                switcherRadius: const SwitcherRadius.all(radius: 40.0),
                onBgColor: Colors.green,
                offBgColor: Colors.red,
                thumbOnBgColor: const Color(0xFF3eff8b),
                thumbOffBgColor: Colors.grey,
                thumbOnIcon: Icons.mood,
                thumbOffIcon: Icons.mood_bad,
                thumbIconColor: Colors.indigo,
                onBgIcon: Icons.notifications_active,
                offBgIcon: Icons.notifications_off,
                onSwitch: (newState) {
                  setState(() => testSwitcher9 = newState);
                },
              ),

              const Divider(),

              _gapH,

              MorphSwitch(
                stateValue: testSwitcher10,
                switcherRadius: const SwitcherRadius.all(radius: 30.0),
                margin: const EdgeInsets.symmetric(vertical: 30),

                /*  height: context.screenHeight * .05,
                width: context.screenWidth * .3,
                thumpRadius: 10, */
                switchCurve: Curves.easeInExpo,
                onBgColor: const Color(0xFF57A6A1),
                offBgColor: const Color(0xFFA0153E),
                thumbOnIcon: Icons.all_inclusive_sharp,
                thumbOffIcon: Icons.account_balance_sharp,
                durationInMs: 700,
                onLabel: "Up",
                offLabel: "Down",
                onLabelStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                offLabelStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textPadding: 25,
                width: _screenWidth * .35,
                height: _screenHeight * .07,
                thumbRadius: 25.0,
                isVertical: true,
                onSwitch: (newState) {
                  setState(() => testSwitcher10 = newState);
                },
              ),

              _gapH,

              const Divider(),

              _gapH,

              MorphSwitch(
                stateValue: testSwitcher11,
                onBgImage: Paths.dayImg,
                offBgImage: Paths.nightImg,
                switcherRadius: const SwitcherRadius.all(radius: 40.0),
                width: _screenWidth * .45,
                height: _screenHeight * .09,
                thumbRadius: 28.0,
                borderColor: Colors.white,
                thumbOnBgColor: const Color(0xFF77B254), //7B4019
                thumbOffBgColor: const Color(0xFF0D47A1),
                thumbOnIcon: Icons.light_mode,
                thumbOffIcon: Icons.dark_mode,
                thumbIconColor:
                    testSwitcher11 ? Colors.yellow : const Color(0xFF64B5F6),
                thumbBorderColor: Colors.white,
                borderWidth: 2.0,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 10.0,
                    spreadRadius: 4.0,
                    color: testSwitcher11
                        ? Colors.green.shade500
                        : Colors.blue.shade500,
                    offset: const Offset(4, 4),
                  ),
                ],
                onSwitch: (newValue) {
                  setState(() => testSwitcher11 = newValue);
                },
              ),
              _gapH,
              _gapH,
              MorphSwitch(
                stateValue: testSwitcher11,
                onBgImage: Paths.dayImg,
                offBgImage: Paths.nightImg,
                switcherRadius: const SwitcherRadius.all(radius: 40.0),
                size: SwitcherSize.small,
                borderColor: Colors.white,
                thumbOnBgColor: const Color(0xFF77B254), //7B4019
                thumbOffBgColor: const Color(0xFF0D47A1),
                thumbOnIcon: Icons.light_mode,
                thumbOffIcon: Icons.dark_mode,
                thumbIconColor:
                    testSwitcher11 ? Colors.yellow : const Color(0xFF64B5F6),
                thumbBorderColor: Colors.white,

                borderWidth: 2.0,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    color: Colors.grey.shade500,
                    offset: const Offset(4, 4),
                  ),
                ],
                onSwitch: (newValue) {
                  setState(() => testSwitcher11 = newValue);
                },
              ),

              _gapH,

              const Divider(),

              _gapH,

              SizedBox(
                height: _screenHeight * .2,
                width: _screenWidth * .8,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          Paths.testGlass,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      child: MorphSwitch(
                        stateValue: testSwitcher12,
                        width: _screenWidth * .45,
                        height: _screenHeight * .09,
                        thumbRadius: 23.0,
                        thumbOffBgColor: const Color(0xFFcb9292),
                        thumbOnBgColor: const Color(0xFF780C28),
                        switcherRadius: const SwitcherRadius.all(radius: 50.0),
                        glassProperties: const GlassProperties(
                          sigma: 1.0,
                          applyGlassLayer: true,
                          color: Colors.black12,
                        ),
                        borderColor: const Color(0xFFE4EFE7),
                        onSwitch: (newValue) {
                          setState(() => testSwitcher12 = newValue);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              _gapH,

              const Divider(),

              _gapH,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MorphSlider(
                    stateValue: testSwitcher13,
                    offIcon: Icons.back_hand_outlined,
                    onIcon: Icons.back_hand_rounded,
                    thumbIconColor: Colors.white,
                    offSliderColor: const Color(0xFFEFEFEF),
                    onSliderColor: const Color(0xFF99BC85),
                    sliderBorderColor: Colors.grey,
                    sliderBorderWidth: 1.4,
                    size: SwitcherSize.large,
                    offThumbColor: const Color(0xFFA7D477),
                    thumbBorderColor: Colors.green,
                    sliderRadius: 20.0,
                    thumbBorderWidth: 1.6,
                    switchCurve: Curves.easeInBack,
                    durationInMs: 500,
                    onSwitch: (newValue) {
                      setState(() => testSwitcher13 = newValue);
                    },
                  ),
                  _verticalDivider,
                  MorphSlider(
                    stateValue: testSwitcher14,
                    size: SwitcherSize.large,
                    thumbType: ThumbType.square,
                    onIcon: Icons.document_scanner,
                    offIcon: Icons.document_scanner_outlined,
                    onThumbColor: const Color(0xFF780C28),
                    offThumbColor: const Color(0xFFcb9292),
                    offSliderColor: const Color(0xFFFBF6E9),
                    onSliderColor: const Color(0xFFF9C0AB),
                    sliderBorderColor: const Color(0xFFDF6D2D),
                    thumbIconColor: testSwitcher14 ? Colors.white : null,
                    thumbBorderColor: const Color(0xFFDF6D2D),
                    iconTransitionStyle: IconTransitionStyle.scale,
                    sliderRadius: 20.0,
                    applyThumbRotationAnimation: false,
                    onSwitch: (newValue) {
                      setState(() => testSwitcher14 = newValue);
                    },
                  ),
                ],
              ),

              _gapH,
              const Divider(),
              _gapH,

              MorphSlider(
                stateValue: testSwitcher15,
                margin: const EdgeInsets.symmetric(vertical: 30),
                isVertical: true,
                switchCurve:
                    !testSwitcher15 ? Curves.easeInOut : Curves.bounceOut,
                size: SwitcherSize.xxLarge,
                sliderRadius: 25.0,
                onIcon: Icons.cloud_upload,
                offIcon: Icons.cloud_download_rounded,
                sliderBorderWidth: 2.0,
                thumbBorderColor: const Color(0xFF4C4B16),
                thumbBorderWidth: 2.0,
                sliderBorderColor: const Color(0xFF4C4B16),
                onSliderColor: const Color(0xFFE6C767),
                offSliderColor: const Color(0xFFFFEEAD),
                onThumbColor: const Color(0xFFA66E38),
                offThumbColor: const Color(0xFFF2EED7),
                onSwitch: (newValue) {
                  setState(() => testSwitcher15 = newValue);
                },
              ),

              /* MorphSwitch(
                stateValue: testSwitcher1,
                borderColor: Colors.lightBlue,
                borderWidth: 2.0,
                thumbOnIcon: Icons.dark_mode,
                thumbOffIcon: Icons.light_mode,
                onBgColor: Colors.green,
                offBgColor: Colors.grey,
                thumbOffBgColor: Colors.blueGrey,
                disabled: false,
                iconTransitionStyle: IconTransitionStyle.fade,
                applyThumbRotationAnimation: false,
                switchCurve: Curves.easeInCubic,
                switcherRadius: const SwitcherRadius(
                  topLeft: 50.0,
                  topRight: 10.0,
                  bottomLeft: 50.0,
                  bottomRight: 10.0,
                ),
                width: _screenWidth * .4,
                height: _screenHeight * .09,
                thumbRadius: 40.0,
                durationInMs: 300,
                thumbType: testSwitcher1 ? ThumbType.square : ThumbType.circle,
                size: SwitcherSize.large,
                onSwitch: (newValue) {
                  setState(
                    () {
                      testSwitcher1 = newValue;
                    },
                  );
                },
              ), */
              SizedBox(height: _screenHeight * .1),
            ],
          ),
        ),
      ),
    );
  }
}
