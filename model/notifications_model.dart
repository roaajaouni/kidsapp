// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationsModel {
  final String verb;
  final String description;
  NotificationsModel({
    required this.verb,
    required this.description,
  });

  NotificationsModel copyWith({
    String? verb,
    String? description,
  }) {
    return NotificationsModel(
      verb: verb ?? this.verb,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'verb': verb,
      'description': description,
    };
  }

  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      verb: map['verb'] ==null ?'mmm':map['verb'] as String,
      description: map['description'] == null ? "ttt":map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationsModel.fromJson(String source) => NotificationsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NotificationsModel(verb: $verb, description: $description)';

  @override
  bool operator ==(covariant NotificationsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.verb == verb &&
      other.description == description;
  }

  @override
  int get hashCode => verb.hashCode ^ description.hashCode;
}
