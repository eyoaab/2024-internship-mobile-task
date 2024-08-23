import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/User/presentation/Pages/LogIn/login.dart';
import 'package:task_6/User/presentation/Pages/SplashScreen/splashScreen.dart';
 // Update with the correct path

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('SplashScreen displays correct UI elements', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SplashScreen(),
      ),
    );

    expect(find.text('ECOM'), findsOneWidget);
    expect(find.text('ECOMMERCE APP'), findsOneWidget);
    expect(find.byType(Image), findsNothing); // since the image is a background image
  });

  testWidgets('SplashScreen navigates to LoginPage after 3 seconds', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: SplashScreen(),
        navigatorObservers: [mockObserver],
      ),
    );

    // Verify that SplashScreen is displayed
    expect(find.byType(SplashScreen), findsOneWidget);

    // Use runAsync to wait for the Future.delayed to complete
    await tester.runAsync(() async {
      // Fast forward the time by 3 seconds
      await Future.delayed(const Duration(seconds: 3));
    });

    // Rebuild the widget after the time has passed
    await tester.pumpAndSettle();

    // Verify that we have navigated to the LoginPage
    verify(mockObserver.didReplace(
      oldRoute: anyNamed('oldRoute'),
      newRoute: anyNamed('newRoute'),
    ));
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
