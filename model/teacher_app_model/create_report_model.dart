// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherCreateReportModel {
  final String learn;
final String activities;
 final String attiude;
 final String mood;
  TeacherCreateReportModel({
    required this.learn,
    required this.activities,
    required this.attiude,
    required this.mood,
  });
 

  TeacherCreateReportModel copyWith({
    String? learn,
    String? activities,
    String? attiude,
    String? mood,
  }) {
    return TeacherCreateReportModel(
      learn: learn ?? this.learn,
      activities: activities ?? this.activities,
      attiude: attiude ?? this.attiude,
      mood: mood ?? this.mood,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'learn': learn,
      'activities': activities,
      'attiude': attiude,
      'mood': mood,
    };
  }

  factory TeacherCreateReportModel.fromMap(Map<String, dynamic> map) {
    return TeacherCreateReportModel(
      learn: map['learn'] as String,
      activities: map['activities'] as String,
      attiude: map['attiude'] as String,
      mood: map['mood'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherCreateReportModel.fromJson(String source) => TeacherCreateReportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherCreateReportModel(learn: $learn, activities: $activities, attiude: $attiude, mood: $mood)';
  }

  @override
  bool operator ==(covariant TeacherCreateReportModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.learn == learn &&
      other.activities == activities &&
      other.attiude == attiude &&
      other.mood == mood;
  }

  @override
  int get hashCode {
    return learn.hashCode ^
      activities.hashCode ^
      attiude.hashCode ^
      mood.hashCode;
  }
}
