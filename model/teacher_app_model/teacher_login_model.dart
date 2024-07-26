// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherLoginModel {
  final String username;
  final String password;
  TeacherLoginModel({
    required this.username,
    required this.password,
  });

  TeacherLoginModel copyWith({
    String? username,
    String? password,
  }) {
    return TeacherLoginModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory TeacherLoginModel.fromMap(Map<String, dynamic> map) {
    return TeacherLoginModel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherLoginModel.fromJson(String source) => TeacherLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TeacherLoginModel(username: $username, password: $password)';

  @override
  bool operator ==(covariant TeacherLoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
