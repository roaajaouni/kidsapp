import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/admin/admin_bloc/teacher_child_bloc.dart';
import 'package:flutter_childhood/blocs/admin/teacher_with_child_bloc/teacher_with_child_bloc.dart';
import 'package:flutter_childhood/blocs/admin/teaher_admin_bloc/teacher_admin_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/model/admin_child_model.dart';
import 'package:flutter_childhood/model/admin_teacher.dart';
import 'package:flutter_childhood/model/teacher_child_model.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  // String teacherName = "sara";
  final Map<String, String?> _selectedTeachers = {};

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TeacherChildBloc()..add(GetAllChildsEvent()),
        ),
        BlocProvider(
          create: (context) => TeacherAdminBloc()..add(GetAllTeachersEvent()),
        ),
         BlocProvider(
          create: (context) => TeacherWithChildBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColor.terqaz,
            title: const Text(
              'Kindergarten Management',
              style: TextStyle(color: AppColor.fairuz),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.fairuz,
              ),
            )),
        body: BlocBuilder<TeacherChildBloc, TeacherChildState>(
          builder: (context, childState) {
            if (childState is AdminGetAllChildsSucessState) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Select teacher for each child',
                      style: TextStyle(color: AppColor.terqaz, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: childState.childs.length,
                        itemBuilder: (context, index) {
                          // print(childState.childs[index].name);
 final child = childState.childs[index];
                          return ListTile(
                            subtitle: Text(
                              "${childState.childs[index].age} years old",
                              style: TextStyle(color: AppColor.terqaz),
                            ),
                            title: Text(
                              childState.childs[index].name,
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: SizedBox(
                              width: 80,
                              height: 80,
                              child: BlocBuilder<TeacherAdminBloc,
                                  TeacherAdminState>(
                                builder: (context, TeacherState) {
                                  if (TeacherState is TeacherAdminSuccess) {
                                    return RoaaWidget(
                                       teacher:_selectedTeachers[child.name],
                                      // TeacherState.teachers.isNotEmpty
                                      //     ? TeacherState.teachers[0]
                                      //         .username // Default to the first teacher or adjust logic
                                      //     : '',
                                      teacherModels: TeacherState.teachers,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedTeachers[child.name] = value;;
                                        });
                                      },
                                    );
                                  } else if (TeacherState
                                      is TeacherAdminFailure) {
                                    return Text(TeacherState.errorMessage);
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      color: AppColor.terqaz,
                      textColor: AppColor.fairuz,
                      onPressed: () {
                         _submitTeacherChildAssociations(context, childState.childs);
                      },
                      child: const Text('Confirm'),
                    )
                  ],
                ),
              );
            } else if (childState is AdminGetAllChildsFailureState) {
              return Center(
                child: Text(childState.errorMessage),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }



   void _submitTeacherChildAssociations(BuildContext context, List<AdminChildModel> childs) {
    List<TeacherChildModel> associations = [];
    _selectedTeachers.forEach((childName, teacher) {
      if (teacher != null) {
        associations.add(TeacherChildModel(
          name: childName,
          teach: teacher,
        ));
      }
    });

    BlocProvider.of<TeacherWithChildBloc>(context).add(AddTeacherWithChild(teacherWithChildModel: associations));
  }
}

class RoaaWidget extends StatefulWidget {
  final String ?teacher;
  final List<AdminTeacherModel> teacherModels;
  final ValueChanged<String?> onChanged;
  const RoaaWidget(
      {super.key,
      required this.teacher,
      required this.teacherModels,
      required this.onChanged});

  @override
  State<RoaaWidget> createState() => _RoaaWidgetState();
}

class _RoaaWidgetState extends State<RoaaWidget> {
  String? teacher;
  @override
  void initState() {
    teacher = widget.teacher;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // value = state.childen.teacher
      value: teacher,
      // onChanged: (value) {
      //   setState(() {
      //   teacher = value!;
      //   });
      // },
      onChanged: (value) {
        setState(() {
          teacher = value;
          widget.onChanged(value);
        });
      },
      items: widget.teacherModels.map((teacher) {
        return DropdownMenuItem(
          value: teacher.username,
          child: Text(teacher.username),
        );
      }).toList(),
    );
  }
}



