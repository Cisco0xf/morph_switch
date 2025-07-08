/* import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:morph_switch/morph_switch.dart'; */

void main() {
  /* // Helper widget to wrap MorphSwitch with state management
  group('MorphSwitch Button Tests', () {
    testWidgets('ON button triggers onClick and sets state to ON',
        (tester) async {
      bool switchState = false;
      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: Center(
                  child: MorphSwitch(
                    stateValue: switchState,
                    onLabel: 'ON',
                    offLabel: 'OFF',
                    onClick: (value) {
                      setState(() {
                        switchState = value;
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      // Tap the ON button (if your MorphSwitch exposes it by key or text)
      await tester.tap(find.text('ON'));
      await tester.pumpAndSettle();

      expect(find.text('ON'), findsOneWidget);
      expect(switchState, isTrue);
    });

    testWidgets('OFF button triggers onClick and sets state to OFF',
        (tester) async {
      bool switchState = true;
      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: Center(
                  child: MorphSwitch(
                    stateValue: switchState,
                    onLabel: 'ON',
                    offLabel: 'OFF',
                    onClick: (value) {
                      setState(() {
                        switchState = value;
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      // Tap the OFF button (if your MorphSwitch exposes it by key or text)
      await tester.tap(find.text('OFF'));
      await tester.pumpAndSettle();

      expect(find.text('OFF'), findsOneWidget);
      expect(switchState, isFalse);
    });
  }); */
}
