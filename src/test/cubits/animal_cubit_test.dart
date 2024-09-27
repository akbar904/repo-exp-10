
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project_name/cubits/animal_cubit.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is Cat', () {
			expect(animalCubit.state.name, 'Cat');
		});

		blocTest<AnimalCubit, Animal>(
			'emits Dog when toggleAnimal is called after initial state',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [isA<Animal>().having((animal) => animal.name, 'name', 'Dog')]
		);

		blocTest<AnimalCubit, Animal>(
			'emits Cat when toggleAnimal is called twice',
			build: () => animalCubit,
			act: (cubit) { 
				cubit.toggleAnimal();
				cubit.toggleAnimal();
			},
			expect: () => [
				isA<Animal>().having((animal) => animal.name, 'name', 'Dog'),
				isA<Animal>().having((animal) => animal.name, 'name', 'Cat')
			]
		);
	});
}
