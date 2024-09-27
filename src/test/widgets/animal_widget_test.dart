
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_animals/widgets/animal_widget.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalWidget', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('displays Cat with clock icon initially', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(Animal(name: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalWidget(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog with person icon when clicked', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(Animal(name: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalWidget(),
					),
				),
			);

			when(() => animalCubit.state).thenReturn(Animal(name: 'Dog', icon: Icons.person));
			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
