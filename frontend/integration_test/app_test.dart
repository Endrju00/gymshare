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
    // testWidgets(
      
    //   'create account test',
    //   (tester) async {
    //     final stopwatch = Stopwatch()..start();
    //     await startApp(tester);
    //     await tester.pumpAndSettle();
    //     await tester.tap(find.text('Don’t have account yet? Create a new one'));
    //     await tester.pumpAndSettle();

    //     final dT = DateTime.now();
    //     final uniqueEmail =
    //         '${dT.day}${dT.month}${dT.year}${dT.hour}${dT.minute}${dT.second}@test.com';
    //     final uniqueUsername =
    //         'UniqueTestUser${dT.day}${dT.month}${dT.year}${dT.hour}${dT.minute}${dT.second}';

    //     await tester.enterText(
    //       find.byKey(const Key('email-field')),
    //       uniqueEmail,
    //     );
    //     await tester.pumpAndSettle();
    //     await tester.enterText(
    //       find.byKey(const Key('username-field')),
    //       uniqueUsername,
    //     );
    //     await tester.pumpAndSettle();

    //     await tester.enterText(
    //       find.byKey(const Key('password-field')),
    //       'Strong2137',
    //     );
    //     await tester.pumpAndSettle();
    //     await tester.tap(find.text('Signup'));
    //     await tester.pumpAndSettle();
    //     await tester.enterText(find.byKey(const Key('login-field')), uniqueUsername);
    //     await tester.pumpAndSettle();
    //     await tester.enterText(
    //         find.byKey(const Key('password-field')), 'Strong2137');
    //     await tester.pumpAndSettle();
    //     await tester.tap(find.text('Login'));
    //     await tester.pumpAndSettle();
    //     print('test executed in ${stopwatch.elapsed}');
    //   },
    // );

    // testWidgets(
    //   'display trainings test',
    //   (tester) async {
    //     final stopwatch = Stopwatch()..start();
    //     await startApp(tester);
    //     await tester.pumpAndSettle();
    //     await tester.enterText(find.byKey(const Key('login-field')), 'admin');
    //     await tester.pumpAndSettle();
    //     await tester.enterText(
    //         find.byKey(const Key('password-field')), 'Strong2137');
    //     await tester.pumpAndSettle();
    //     await tester.tap(find.text('Login'));
    //     await tester.pumpAndSettle(const Duration(seconds: 3));
    //     await tester.dragUntilVisible(find.byKey(const Key('workout_tile_15')),
    //         find.byKey(const Key('workouts_list')), const Offset(0, -200));
    //     await tester.pumpAndSettle();
    //     await tester.dragUntilVisible(find.byKey(const Key('workout_tile_30')),
    //         find.byKey(const Key('workouts_list')), const Offset(0, -200));
    //     print('test executed in ${stopwatch.elapsed}');
    //   },
    // );

    // testWidgets(
    //   'display burned calories',
    //   (tester) async {
    //     final stopwatch = Stopwatch()..start();
    //     await startApp(tester);
    //     await tester.pumpAndSettle();
    //     await tester.enterText(find.byKey(const Key('login-field')), 'admin');
    //     await tester.pumpAndSettle();
    //     await tester.enterText(
    //         find.byKey(const Key('password-field')), 'Strong2137');
    //     await tester.pumpAndSettle();
    //     await tester.tap(find.text('Login'));
    //     await tester.pumpAndSettle();
    //     await tester.tap(find.text('Statistics'));
    //     await tester.pumpAndSettle();
    //     await tester.pumpAndSettle(const Duration(seconds: 17));
    //     await tester
    //         .ensureVisible(find.byKey(const Key('burned_calories_chart')));
    //     await tester.pumpAndSettle();
    //     print('test executed in ${stopwatch.elapsed}');
    //   },
    // );

    testWidgets(
      'display exercises',
      (tester) async {
        final stopwatch = Stopwatch()..start();
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
        await tester.pumpAndSettle(const Duration(seconds: 15));
        await tester.ensureVisible(find.byKey(const Key('exercises_list')));
        await tester.pumpAndSettle();
        print('test executed in ${stopwatch.elapsed}');
      },
    );
  });
}
