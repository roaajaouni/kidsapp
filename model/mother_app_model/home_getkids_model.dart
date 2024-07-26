// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HomeMotherModel {
  final int id;
  final String name;
  final String age;
  final String child_gender;
  final String featured_image;
  // final String meal;
  // final String notes;
  final String state_health;
  final int mom;
  HomeMotherModel({
    required this.id,
    required this.name,
    required this.age,
    required this.child_gender,
    required this.featured_image,
    required this.state_health,
    required this.mom,
  });
  

  HomeMotherModel copyWith({
    int? id,
    String? name,
    String? age,
    String? child_gender,
    String? featured_image,
    String? state_health,
    int? mom,
  }) {
    return HomeMotherModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      child_gender: child_gender ?? this.child_gender,
      featured_image: featured_image ?? this.featured_image,
      state_health: state_health ?? this.state_health,
      mom: mom ?? this.mom,
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
      'mom': mom,
    };
  }

  factory HomeMotherModel.fromMap(Map<String, dynamic> map) {
    return HomeMotherModel(
      id: map['id'] as int,
      name: map['name'] as String,
      age: map['age'] as String,
      child_gender: map['child_gender'] as String,
      featured_image: map['featured_image'] as String,
      state_health: map['state_health'] as String,
      mom: map['mom'] == null ? 0:map['mom'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeMotherModel.fromJson(String source) => HomeMotherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeMotherModel(id: $id, name: $name, age: $age, child_gender: $child_gender, featured_image: $featured_image, state_health: $state_health, mom: $mom)';
  }

  @override
  bool operator ==(covariant HomeMotherModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.age == age &&
      other.child_gender == child_gender &&
      other.featured_image == featured_image &&
      other.state_health == state_health &&
      other.mom == mom;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      age.hashCode ^
      child_gender.hashCode ^
      featured_image.hashCode ^
      state_health.hashCode ^
      mom.hashCode;
  }
}
