
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_animals/cubits/animal_cubit.dart';
import 'package:com.example.simple_animals/widgets/animal_widget.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Simple Animals'),
			),
			body: Center(
				child: BlocBuilder<AnimalCubit, Animal>(
					builder: (context, animal) {
						return AnimalWidget(animal: animal);
					},
				),
			),
		);
	}
}
