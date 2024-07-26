// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class AdminTeacherModel {
  final String username;
  AdminTeacherModel({
    required this.username,
  });

  AdminTeacherModel copyWith({
    String? username,
  }) {
    return AdminTeacherModel(
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
    };
  }

  factory AdminTeacherModel.fromMap(Map<String, dynamic> map) {
    return AdminTeacherModel(
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminTeacherModel.fromJson(String source) => AdminTeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdminTeacherModel(username: $username)';

  @override
  bool operator ==(covariant AdminTeacherModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username;
  }

  @override
  int get hashCode => username.hashCode;
}


// List<AdminTeacherModel> teachersExample = [
// AdminTeacherModel(teacherName: "Roaa"),
// AdminTeacherModel(teacherName: "Ruba"),
// AdminTeacherModel(teacherName: "Ahmad"),

// ];