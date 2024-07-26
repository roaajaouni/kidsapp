// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MotherLoginModel {
  final String username;
  final String password;
  MotherLoginModel({
    required this.username,
    required this.password,
  });


  MotherLoginModel copyWith({
    String? username,
    String? password,
  }) {
    return MotherLoginModel(
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

  factory MotherLoginModel.fromMap(Map<String, dynamic> map) {
    return MotherLoginModel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotherLoginModel.fromJson(String source) => MotherLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MotherLoginModel(username: $username, password: $password)';

  @override
  bool operator ==(covariant MotherLoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
