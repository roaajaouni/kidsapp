import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/teacher_auth_signupbloc/teacher_signup_bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/signup_model.dart';
import 'package:flutter_childhood/view/screen/auth/teacher_login.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/login/custombutton.dart';
import '../../widget/login/customrowloginorsignup.dart';
import '../../widget/login/customtextfield.dart';

class TeacherSignup extends StatelessWidget {
  TeacherSignup({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => TeacherSignupBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocListener<TeacherSignupBloc, TeacherSignupState>(
            listener: (context, state) {
              if (state is TeacherSignUpSuccessState) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => TeacherLogin()));
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text(state.successmessage)));
              } else if (state is TeacherSignUpFailureState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errormessage)));
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
                        const Text('SIGN UP',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: AppColor.grey)),

                        SizedBox(
                          height: screenheight / 50,
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
                          height: screenheight / 50,
                        ),
                        //email
                        Customtextfield(
                          hintText: 'email',
                          iconData: Icons.email,
                          mycontroller: email,
                          valid: (val) {
                            if (val!.length < 6) {
                              return "Please Enter More Charcters";
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: screenheight / 50,
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
                          height: screenheight / 50,
                        ),
                        //address

                        SizedBox(
                          height: screenheight / 30,
                        ),

                        //sign button
                        BlocBuilder<TeacherSignupBloc, TeacherSignupState>(
                          builder: (context, state) {
                            if (state is TeacherSignupInitial) {
                              return Custombutton(
                                text: 'Sign up',
                                onPressed: () {
                                  context.read<TeacherSignupBloc>().add(
                                      AddTeacherSignupInfo(
                                          teacherSignUpModel:
                                              TeacherSignUpModel(
                                                  username: username.text,
                                                  email: email.text,
                                                  password: password.text)));
                                },
                              );
                            } else if (state is TeacherSignUpLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Custombutton(
                                text: 'Sign up',
                                onPressed: () {
                                  context.read<TeacherSignupBloc>().add(
                                      AddTeacherSignupInfo(
                                          teacherSignUpModel:
                                              TeacherSignUpModel(
                                                  username: username.text,
                                                  email: email.text,
                                                  password: password.text)));
                                                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => TeacherLogin()));
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
                          textone: 'Already a member ?',
                          texttwo: 'sign in',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
