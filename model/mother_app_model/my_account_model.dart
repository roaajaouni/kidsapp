// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MotherMyAccountModel {
 
   final String username;
    final String email;
   final String phone;
   final String address;
  MotherMyAccountModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
  });

 

  MotherMyAccountModel copyWith({
    String? username,
    String? email,
    String? phone,
    String? address,
  }) {
    return MotherMyAccountModel(
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  factory MotherMyAccountModel.fromMap(Map<String, dynamic> map) {
    return MotherMyAccountModel(
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotherMyAccountModel.fromJson(String source) => MotherMyAccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MotherMyAccountModel(username: $username, email: $email, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(covariant MotherMyAccountModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.email == email &&
      other.phone == phone &&
      other.address == address;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      address.hashCode;
  }
}
