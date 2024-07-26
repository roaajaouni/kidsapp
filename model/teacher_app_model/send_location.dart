// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherLocationModel {
  final String location;
  final String Important_notes;
  TeacherLocationModel({
    required this.location,
    required this.Important_notes,
  });

  TeacherLocationModel copyWith({
    String? location,
    String? Important_notes,
  }) {
    return TeacherLocationModel(
      location: location ?? this.location,
      Important_notes: Important_notes ?? this.Important_notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location,
      'Important_notes': Important_notes,
    };
  }

  factory TeacherLocationModel.fromMap(Map<String, dynamic> map) {
    return TeacherLocationModel(
      location: map['location'] ==null ? "":map['location']  as String,
      Important_notes: map['Important_notes']==null?"":map['Important_notes'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherLocationModel.fromJson(String source) => TeacherLocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TeacherLocationModel(location: $location, Important_notes: $Important_notes)';

  @override
  bool operator ==(covariant TeacherLocationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.location == location &&
      other.Important_notes == Important_notes;
  }

  @override
  int get hashCode => location.hashCode ^ Important_notes.hashCode;
}
