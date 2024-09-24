
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Counter App'),
			),
			body: Center(
				child: BlocBuilder<CounterCubit, int>(
					builder: (context, state) {
						return Text(
							'$state',
							style: TextStyle(fontSize: 24.0),
						);
					},
				),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () => context.read<CounterCubit>().increment(),
				child: Icon(Icons.add),
			),
		);
	}
}
