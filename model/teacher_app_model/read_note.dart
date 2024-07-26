// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherReadNoteModel {
  final String name;
  final String notes;
  TeacherReadNoteModel({
    required this.name,
    required this.notes,
  });

  TeacherReadNoteModel copyWith({
    String? name,
    String? notes,
  }) {
    return TeacherReadNoteModel(
      name: name ?? this.name,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'notes': notes,
    };
  }

  factory TeacherReadNoteModel.fromMap(Map<String, dynamic> map) {
    return TeacherReadNoteModel(
      name: map['name'] ==null ?"": map['name'] as String,
      notes: map['notes']==null?"":map['notes'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherReadNoteModel.fromJson(String source) => TeacherReadNoteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TeacherReadNoteModel(name: $name, notes: $notes)';

  @override
  bool operator ==(covariant TeacherReadNoteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.notes == notes;
  }

  @override
  int get hashCode => name.hashCode ^ notes.hashCode;
}
