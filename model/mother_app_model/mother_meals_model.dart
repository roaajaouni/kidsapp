// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MoherMealsModel {
  final String name;
 final String image;
  MoherMealsModel({
    required this.name,
    required this.image,
  });


  MoherMealsModel copyWith({
    String? name,
    String? image,
  }) {
    return MoherMealsModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory MoherMealsModel.fromMap(Map<String, dynamic> map) {
    return MoherMealsModel(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoherMealsModel.fromJson(String source) => MoherMealsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MoherMealsModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant MoherMealsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}


class AddMealResponse {
  final String name;
  final String meal;
  AddMealResponse({
    required this.name,
    required this.meal,
  });

  AddMealResponse copyWith({
    String? name,
    String? meal,
  }) {
    return AddMealResponse(
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

  factory AddMealResponse.fromMap(Map<String, dynamic> map) {
    return AddMealResponse(
      name: map['name'] as String,
      meal: map['meal'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddMealResponse.fromJson(String source) => AddMealResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddMealResponse(name: $name, meal: $meal)';

  @override
  bool operator ==(covariant AddMealResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.meal == meal;
  }

  @override
  int get hashCode => name.hashCode ^ meal.hashCode;
}
