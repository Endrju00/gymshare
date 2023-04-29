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
    /*
    testWidgets(
      'create account test',
      (tester) async {
        await startApp(tester);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Don’t have account yet? Create a new one'));
        await tester.pumpAndSettle();
        await tester.enterText(
            find.byKey(const Key('email-field')), 'user.user@test.com');
        await tester.pumpAndSettle();
        await tester.enterText(find.byKey(const Key('username-field')), 'masakrator');
        await tester.pumpAndSettle();
        await tester.enterText(find.byKey(const Key('password-field')), 'Strong2137');
        await tester.pumpAndSettle();
        await tester.tap(find.text('Signup'));
        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      'display trainings test',
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
        await tester.dragUntilVisible(find.byKey(const Key('workout_tile_15')), find.byKey(const Key('workouts_list')), Offset(0, -200));
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(find.byKey(const Key('workout_tile_30')), find.byKey(const Key('workouts_list')), Offset(0, -200));
      },
    );
    */
    /*
    testWidgets(
      'display burned calories',
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
        await tester.tap(find.text('Statistics'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Workouts'));
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();
        /*
        await tester.tap(find.byType(IconButton));
        await tester.tap(find.widgetWithText(TextButton, 'OK'));
        await tester.pumpAndSettle();*/
        await tester.ensureVisible(find.byKey(const Key('burned_calories_chart')));
      },
    );
    */
    ///*
    testWidgets(
      'display exercises',
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
        await tester.tap(find.text('Statistics'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Exercises'));
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.byKey(const Key('exercises_list'))); //find.byKey(const Key('exercises_tile_2'))
          },
    );
    //*/
  });
}
