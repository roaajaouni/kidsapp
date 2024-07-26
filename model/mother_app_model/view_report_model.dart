// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ViewReportModel {
final String learn;
final String activities;
 final String attiude;
 final String mood;
 final String created;
final int child;
  ViewReportModel({
    required this.learn,
    required this.activities,
    required this.attiude,
    required this.mood,
    required this.created,
    required this.child,
  });
  

  ViewReportModel copyWith({
    String? learn,
    String? activities,
    String? attiude,
    String? mood,
    String? created,
    int? child,
  }) {
    return ViewReportModel(
      learn: learn ?? this.learn,
      activities: activities ?? this.activities,
      attiude: attiude ?? this.attiude,
      mood: mood ?? this.mood,
      created: created ?? this.created,
      child: child ?? this.child,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'learn': learn,
      'activities': activities,
      'attiude': attiude,
      'mood': mood,
      'created': created,
      'child': child,
    };
  }

  factory ViewReportModel.fromMap(Map<String, dynamic> map) {
    return ViewReportModel(
      learn: map['learn'] ==null ?'_': map['learn'] as String,
      activities: map['activities'] == null? 'No activties today ':  map['activities']as String,
      attiude: map['attiude'] == null?'_':map['attiude'] as String,
      mood: map['mood'] == null ? '_': map['mood'] as String,

      created: map['created'] as String,
      child: map['child'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ViewReportModel.fromJson(String source) => ViewReportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ViewReportModel(learn: $learn, activities: $activities, attiude: $attiude, mood: $mood, created: $created, child: $child)';
  }

  @override
  bool operator ==(covariant ViewReportModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.learn == learn &&
      other.activities == activities &&
      other.attiude == attiude &&
      other.mood == mood &&
      other.created == created &&
      other.child == child;
  }

  @override
  int get hashCode {
    return learn.hashCode ^
      activities.hashCode ^
      attiude.hashCode ^
      mood.hashCode ^
      created.hashCode ^
      child.hashCode;
  }
}
