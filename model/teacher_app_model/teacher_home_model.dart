// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherHomeModel {
  final int id;
  final String name;
  final String age;
  final String child_gender;
  final String featured_image;
  final String state_health;
  TeacherHomeModel({
    required this.id,
    required this.name,
    required this.age,
    required this.child_gender,
    required this.featured_image,
    required this.state_health,
  });
 

  TeacherHomeModel copyWith({
    int? id,
    String? name,
    String? age,
    String? child_gender,
    String? featured_image,
    String? state_health,
  }) {
    return TeacherHomeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      child_gender: child_gender ?? this.child_gender,
      featured_image: featured_image ?? this.featured_image,
      state_health: state_health ?? this.state_health,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'child_gender': child_gender,
      'featured_image': featured_image,
      'state_health': state_health,
    };
  }

  factory TeacherHomeModel.fromMap(Map<String, dynamic> map) {
    return TeacherHomeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      age: map['age'] as String,
      child_gender: map['child_gender'] as String,
      featured_image: map['featured_image'] as String,
      state_health: map['state_health'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherHomeModel.fromJson(String source) => TeacherHomeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherHomeModel(id: $id, name: $name, age: $age, child_gender: $child_gender, featured_image: $featured_image, state_health: $state_health)';
  }

  @override
  bool operator ==(covariant TeacherHomeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.age == age &&
      other.child_gender == child_gender &&
      other.featured_image == featured_image &&
      other.state_health == state_health;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      age.hashCode ^
      child_gender.hashCode ^
      featured_image.hashCode ^
      state_health.hashCode;
  }
}
