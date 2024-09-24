
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:counter_app/cubits/counter_cubit.dart';

void main() {
	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is 0', () {
			expect(counterCubit.state.value, 0);
		});

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(10)] when increment is called on initial state',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [CounterState(10)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(100)] when increment is called twice on initial state',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [CounterState(10), CounterState(100)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(1000)] when increment is called thrice on initial state',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
				cubit.increment();
			},
			expect: () => [CounterState(10), CounterState(100), CounterState(1000)],
		);
	});
}
