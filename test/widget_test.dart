import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:roll_the_dice/main.dart';

void main() {
  testWidgets('Roll button shows a dice value between 1 and 6', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RollTheDiceApp());

    expect(find.text('Hodená hodnota: 1'), findsOneWidget);

    for (var i = 0; i < 20; i++) {
      await tester.tap(find.text('Hoď kockou'));
      await tester.pump();

      final image = tester.widget<Image>(find.byType(Image));
      final assetName = (image.image as AssetImage).assetName;
      expect(assetName, matches(RegExp(r'^assets/images/dice-[1-6]\.png$')));
    }
  });
}
