
import 'package:bloc/bloc.dart';

// CounterState class which holds the counter value
class CounterState {
	final int value;

	const CounterState(this.value);
}

// CounterCubit class which manages the counter value state
class CounterCubit extends Cubit<CounterState> {
	CounterCubit() : super(const CounterState(0));

	// Increment method that multiplies the counter value by 10
	void increment() {
		final newValue = state.value == 0 ? 10 : state.value * 10;
		emit(CounterState(newValue));
	}
}
