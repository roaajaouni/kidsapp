// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherFoodModel {
  final  String name;
  final String meal;
  TeacherFoodModel({
    required this.name,
    required this.meal,
  });

  
  

  TeacherFoodModel copyWith({
    String? name,
    String? meal,
  }) {
    return TeacherFoodModel(
      name: name ?? this.name,
      meal: meal ?? this.meal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'meal': meal,
    };
  }

  factory TeacherFoodModel.fromMap(Map<String, dynamic> map) {
    return TeacherFoodModel(
      name: map['name'] == null ?"_" : map['name']  as String,
      meal: map['meal'] ==null ? "_" :map['meal'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherFoodModel.fromJson(String source) => TeacherFoodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TeacherFoodModel(name: $name, meal: $meal)';

  @override
  bool operator ==(covariant TeacherFoodModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.meal == meal;
  }

  @override
  int get hashCode => name.hashCode ^ meal.hashCode;
}
