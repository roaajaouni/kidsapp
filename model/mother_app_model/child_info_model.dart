// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChildInfoModel {
  final String name;
  final String age;
  final String child_gender;
  final String state_health;
  
  ChildInfoModel({
    required this.name,
    required this.age,
    required this.child_gender,
    required this.state_health,
  });

  ChildInfoModel copyWith({
    String? name,
    String? age,
    String? child_gender,
    String? state_health,
  }) {
    return ChildInfoModel(
      name: name ?? this.name,
      age: age ?? this.age,
      child_gender: child_gender ?? this.child_gender,
      state_health: state_health ?? this.state_health,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'child_gender': child_gender,
      'state_health': state_health,
    };
  }

  factory ChildInfoModel.fromMap(Map<String, dynamic> map) {
    return ChildInfoModel(
      name: map['name'] as String,
      age: map['age'] as String,
      child_gender: map['child_gender'] as String,
      state_health: map['state_health'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildInfoModel.fromJson(String source) => ChildInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChildInfoModel(name: $name, age: $age, child_gender: $child_gender, state_health: $state_health)';
  }

  @override
  bool operator ==(covariant ChildInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.age == age &&
      other.child_gender == child_gender &&
      other.state_health == state_health;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      age.hashCode ^
      child_gender.hashCode ^
      state_health.hashCode;
  }
}
