
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/screens/home_screen.dart';

// Mocking the CounterCubit
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late MockCounterCubit mockCounterCubit;

		setUp(() {
			mockCounterCubit = MockCounterCubit();
		});

		testWidgets('shows initial counter value', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (context) => mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('shows incremented counter value after button press', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);
			whenListen(mockCounterCubit, Stream.fromIterable([0, 10]));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (context) => mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);

			await tester.tap(find.byType(FloatingActionButton));
			await tester.pumpAndSettle();

			expect(find.text('10'), findsOneWidget);
		});
	});
}
