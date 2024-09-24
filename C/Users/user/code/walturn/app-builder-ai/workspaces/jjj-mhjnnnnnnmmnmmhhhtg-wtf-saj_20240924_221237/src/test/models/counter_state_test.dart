
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/models/counter_state.dart';

void main() {
	group('CounterState Model Tests', () {
		test('CounterState should initialize with a value', () {
			final counterState = CounterState(value: 0);
			expect(counterState.value, 0);
		});

		test('CounterState should correctly serialize and deserialize from JSON', () {
			final counterState = CounterState(value: 10);
			final json = counterState.toJson();
			expect(json['value'], 10);

			final newCounterState = CounterState.fromJson(json);
			expect(newCounterState.value, 10);
		});
	});
}
