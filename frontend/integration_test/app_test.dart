import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymshare/main.dart' as app;
import 'package:integration_test/integration_test.dart';

Future<void> startApp(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();
  await tester.pumpAndSettle(const Duration(milliseconds: 1000));
  await tester.pumpAndSettle(const Duration(milliseconds: 1500));
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets(
      'test logging in',
      (tester) async {
        await startApp(tester);
        await tester.pumpAndSettle();
        await tester.enterText(find.byKey(const Key('login-field')), 'admin');
        await tester.pumpAndSettle();
        await tester.enterText(
            find.byKey(const Key('password-field')), 'Strong2137');
        await tester.pumpAndSettle();
        await tester.tap(find.text('Login'));
        await tester.pumpAndSettle();
      },
    );
  });
}
