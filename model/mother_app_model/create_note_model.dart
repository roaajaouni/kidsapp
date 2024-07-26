// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MotherCreateNoteModel {
  
  final String name;
  final String notes;
  MotherCreateNoteModel({
    required this.name,
    required this.notes,
  });
 

  MotherCreateNoteModel copyWith({
    String? name,
    String? notes,
  }) {
    return MotherCreateNoteModel(
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

  factory MotherCreateNoteModel.fromMap(Map<String, dynamic> map) {
    return MotherCreateNoteModel(
      name: map['name'] as String,
      notes: map['notes'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotherCreateNoteModel.fromJson(String source) => MotherCreateNoteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MotherCreateNoteModel(name: $name, notes: $notes)';

  @override
  bool operator ==(covariant MotherCreateNoteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.notes == notes;
  }

  @override
  int get hashCode => name.hashCode ^ notes.hashCode;
}
