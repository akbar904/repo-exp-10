
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:simple_animals/models/animal.dart';

void main() {
	group('Animal Model Tests', () {
		test('Animal model serialization', () {
			final animal = Animal(name: 'Cat', icon: Icons.access_time);
			final json = animal.toJson();
			
			expect(json['name'], 'Cat');
			expect(json['icon'], Icons.access_time.codePoint);
		});
		
		test('Animal model deserialization', () {
			final json = {
				'name': 'Dog',
				'icon': Icons.person.codePoint,
			};
			
			final animal = Animal.fromJson(json);
			
			expect(animal.name, 'Dog');
			expect(animal.icon, Icons.person);
		});
		
		test('Animal equality', () {
			final animal1 = Animal(name: 'Cat', icon: Icons.access_time);
			final animal2 = Animal(name: 'Cat', icon: Icons.access_time);
			final animal3 = Animal(name: 'Dog', icon: Icons.person);
			
			expect(animal1, equals(animal2));
			expect(animal1, isNot(equals(animal3)));
		});
		
		test('Animal hash code', () {
			final animal1 = Animal(name: 'Cat', icon: Icons.access_time);
			final animal2 = Animal(name: 'Cat', icon: Icons.access_time);
			
			expect(animal1.hashCode, equals(animal2.hashCode));
		});
	});
}
