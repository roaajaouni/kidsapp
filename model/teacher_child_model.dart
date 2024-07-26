// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherChildModel {
  final String name;
  final String teach;
  TeacherChildModel({
    required this.name,
    required this.teach,
  });

  TeacherChildModel copyWith({
    String? name,
    String? teach,
  }) {
    return TeacherChildModel(
      name: name ?? this.name,
      teach: teach ?? this.teach,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'teach': teach,
    };
  }

  factory TeacherChildModel.fromMap(Map<String, dynamic> map) {
    return TeacherChildModel(
      name: map['name'] as String,
      teach: map['teach'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherChildModel.fromJson(String source) => TeacherChildModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TeacherChildModel(name: $name, teach: $teach)';

  @override
  bool operator ==(covariant TeacherChildModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.teach == teach;
  }

  @override
  int get hashCode => name.hashCode ^ teach.hashCode;
}
