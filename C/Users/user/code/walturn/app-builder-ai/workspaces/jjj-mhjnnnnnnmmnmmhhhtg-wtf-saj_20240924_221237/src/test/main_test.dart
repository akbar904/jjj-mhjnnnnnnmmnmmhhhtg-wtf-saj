
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'lib/main.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('Main App', () {
		testWidgets('App starts with HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});

		testWidgets('HomeScreen displays initial counter value', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('Increment button multiplies counter by 10', (WidgetTester tester) async {
			final mockCounterCubit = MockCounterCubit();
			whenListen(
				mockCounterCubit,
				Stream.fromIterable([0, 10]),
				initialState: 0,
			);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: mockCounterCubit,
					child: MyApp(),
				),
			);

			expect(find.text('0'), findsOneWidget);

			await tester.tap(find.byIcon(Icons.add));
			await tester.pump();

			expect(find.text('10'), findsOneWidget);
		});
	});
}
