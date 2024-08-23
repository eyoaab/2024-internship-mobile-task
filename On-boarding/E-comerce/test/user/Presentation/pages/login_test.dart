import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_6/User/presentation/Pages/LogIn/login.dart';
import 'package:task_6/User/presentation/bloc/user_bloc.dart';
import 'package:task_6/User/presentation/bloc/user_event.dart';
import 'package:task_6/User/presentation/bloc/user_state.dart';


class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  late MockUserBloc mockUserBloc;

  setUp(() {
    mockUserBloc = MockUserBloc();
  });



  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<UserBloc>(
        create: (_) => mockUserBloc,
        child: LoginPage(),
      ),
    );
  }

  group('LoginPage', () {
    testWidgets('renders LoginPage with initial state', (WidgetTester tester) async {
      when(() => mockUserBloc.state).thenReturn(UserInitial());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Sign in to your account'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Login'), findsOneWidget);
      expect(find.text("Don't have an account? Sign up"), findsNothing);
    });

    testWidgets('shows error message when login fails', (WidgetTester tester) async {
      whenListen(
        mockUserBloc,
        Stream.fromIterable([
          UserLoading(),
          UserError('Invalid username or password'),
        ]),
      );

      when(() => mockUserBloc.state).thenReturn(UserError('Invalid username or password'));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('Invalid username or password'), findsOneWidget);
    });
  });
}
