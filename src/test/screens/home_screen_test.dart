
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_animals/screens/home_screen.dart';
import 'package:com.example.simple_animals/cubits/animal_cubit.dart';
import 'package:com.example.simple_animals/models/animal.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('HomeScreen displays initial animal as Cat with clock icon', (WidgetTester tester) async {
			// Arrange
			final mockAnimalCubit = MockAnimalCubit();
			whenListen(
				mockAnimalCubit,
				Stream.value(Animal(name: 'Cat', icon: Icons.access_time)),
				initialState: Animal(name: 'Cat', icon: Icons.access_time),
			);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('HomeScreen toggles animal to Dog with person icon when clicked', (WidgetTester tester) async {
			// Arrange
			final mockAnimalCubit = MockAnimalCubit();
			whenListen(
				mockAnimalCubit,
				Stream.fromIterable([
					Animal(name: 'Cat', icon: Icons.access_time),
					Animal(name: 'Dog', icon: Icons.person),
				]),
				initialState: Animal(name: 'Cat', icon: Icons.access_time),
			);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: HomeScreen(),
					),
				),
			);

			// Tap on the text to trigger state change
			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
