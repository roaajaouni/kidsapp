import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/teacher_auth_bloc/bloc/teacher_login_bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/teacher_login_model.dart';
import 'package:flutter_childhood/view/screen/auth/teacher_signup.dart';
import 'package:flutter_childhood/view/widget/teacher_main_bottom_navigation_bar_page.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

import '../../widget/login/custombutton.dart';
import '../../widget/login/customrowloginorsignup.dart';
import '../../widget/login/customtextfield.dart';

class TeacherLogin extends StatelessWidget {
  TeacherLogin({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => TeacherLoginBloc(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: BlocListener<TeacherLoginBloc, TeacherLoginState>(
              listener: (context, state) {
                if (state is TeacherLoginSuccesState) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TeacherMainBottomNavigationBarPage()));
                } else if (state is TeacherLoginFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errormessage)));
                }
              },
              child: Center(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //image

                          ClipOval(
                            child: Image.asset(
                              AppImageAsset.mother,
                              height: screenheight / 4,
                            ),
                          ),
                          SizedBox(
                            height: screenheight / 30,
                          ),
                          //title
                          const Text('SIGN IN',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.grey)),

                          SizedBox(
                            height: screenheight / 30,
                          ),

                          Customtextfield(
                            hintText: 'username',
                            iconData: Icons.person,
                            mycontroller: username,
                            valid: (val) {
                              if (val!.length < 6) {
                                return "Please Enter More Charcters";
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: screenheight / 30,
                          ),

                          //password
                          Customtextfield(
                            hintText: 'password',
                            iconData: Icons.key,
                            mycontroller: password,
                            valid: (val) {
                              if (val!.length < 6) {
                                return "Please Enter More Charcters";
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: screenheight / 30,
                          ),

                          //sign button
                          BlocBuilder<TeacherLoginBloc, TeacherLoginState>(
                            builder: (context, state) {
                              if (state is TeacherLoginInitial) {
                                return Custombutton(
                                  text: 'Sign in',
                                  onPressed: () {
                                    // ! send request to db to login
                                    context.read<TeacherLoginBloc>().add(
                                        AddTeacherLoginInfo(
                                            teacherInfo: TeacherLoginModel(
                                                username: username.text,
                                                password: password.text)));
                                  },
                                );
                              } else if (state is TeacherLoginLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return Custombutton(
                                  text: 'Sign in',
                                  onPressed: () {
                                    // ! send request to db to login
                                    context.read<TeacherLoginBloc>().add(
                                        AddTeacherLoginInfo(
                                            teacherInfo: TeacherLoginModel(
                                                username: username.text,
                                                password: password.text)));
                                  },
                                );
                              }
                            },
                          ),
                          // text signup
                          SizedBox(
                            height: screenheight / 30,
                          ),
                          Customrowloginorsignup(
                            textone: 'Not yet member',
                            texttwo: 'sign up now',
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TeacherSignup(),
                                ),
                              );
                            },
                          )
                        ]),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
