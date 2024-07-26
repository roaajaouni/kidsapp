// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MotherSelectModel {
  final String meal;
  MotherSelectModel({
    required this.meal,
  });

  
  


  MotherSelectModel copyWith({
    String? meal,
  }) {
    return MotherSelectModel(
      meal: meal ?? this.meal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'meal': meal,
    };
  }

  factory MotherSelectModel.fromMap(Map<String, dynamic> map) {
    return MotherSelectModel(
      meal: map['meal'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotherSelectModel.fromJson(String source) => MotherSelectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MotherSelectModel(meal: $meal)';

  @override
  bool operator ==(covariant MotherSelectModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.meal == meal;
  }

  @override
  int get hashCode => meal.hashCode;
}
