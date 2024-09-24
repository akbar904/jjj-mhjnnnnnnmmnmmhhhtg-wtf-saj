
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'lib/widgets/counter_display.dart';

void main() {
	group('CounterDisplay Widget Tests', () {
		testWidgets('should display the initial counter value', (WidgetTester tester) async {
			// Arrange
			const int initialCounterValue = 0;
			const counterDisplayKey = Key('counterDisplay');

			// Act
			await tester.pumpWidget(MaterialApp(
				home: Scaffold(
					body: CounterDisplay(key: counterDisplayKey, value: initialCounterValue),
				),
			));

			// Assert
			expect(find.byKey(counterDisplayKey), findsOneWidget);
			expect(find.text('$initialCounterValue'), findsOneWidget);
		});

		testWidgets('should update and display the new counter value', (WidgetTester tester) async {
			// Arrange
			const int updatedCounterValue = 10;
			const counterDisplayKey = Key('counterDisplay');

			// Act
			await tester.pumpWidget(MaterialApp(
				home: Scaffold(
					body: CounterDisplay(key: counterDisplayKey, value: updatedCounterValue),
				),
			));

			// Assert
			expect(find.byKey(counterDisplayKey), findsOneWidget);
			expect(find.text('$updatedCounterValue'), findsOneWidget);
		});
	});
}
