// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MotherSignupModel {
  final String username;
  final String email;
  final String password;
  MotherSignupModel({
    required this.username,
    required this.email,
    required this.password,
  });

  MotherSignupModel copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return MotherSignupModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory MotherSignupModel.fromMap(Map<String, dynamic> map) {
    return MotherSignupModel(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotherSignupModel.fromJson(String source) => MotherSignupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MotherSignupModel(username: $username, email: $email, password: $password)';

  @override
  bool operator ==(covariant MotherSignupModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ password.hashCode;
}
