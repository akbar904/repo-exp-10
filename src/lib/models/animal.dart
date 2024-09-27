
import 'package:flutter/material.dart';

class Animal {
	final String name;
	final IconData icon;

	Animal({required this.name, required this.icon});

	factory Animal.fromJson(Map<String, dynamic> json) {
		return Animal(
			name: json['name'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'name': name,
			'icon': icon.codePoint,
		};
	}

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;
		if (other is! Animal) return false;
		return other.name == name && other.icon == icon;
	}

	@override
	int get hashCode => name.hashCode ^ icon.hashCode;
}
