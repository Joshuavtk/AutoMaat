import 'package:auto_maat/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegisterScreen Widget Tests', () {
    testWidgets('Shows error message when fields are empty', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));
      await tester.tap(find.text('Create account'));
      await tester.pump();
      expect(find.text('Error registering, fields may not be empty'), findsOneWidget);
    });

    testWidgets('Password fields should match', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));
      await tester.enterText(find.byType(TextField).first, 'test@test.nl');
      await tester.enterText(find.byType(TextField).at(1), 'test');
      await tester.enterText(find.byType(TextField).last, 'not test');

      await tester.tap(find.text('Create account'));
      await tester.pump();
      expect(find.text('Error registering, passwords do not match.'), findsOneWidget);
    });
  });
}
