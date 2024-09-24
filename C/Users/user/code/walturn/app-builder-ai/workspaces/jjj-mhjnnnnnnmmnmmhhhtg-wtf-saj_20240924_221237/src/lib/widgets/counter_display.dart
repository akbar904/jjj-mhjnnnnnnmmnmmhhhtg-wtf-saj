
import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
	final int value;

	const CounterDisplay({Key? key, required this.value}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Text(
				'$value',
				style: TextStyle(fontSize: 24.0),
			),
		);
	}
}
