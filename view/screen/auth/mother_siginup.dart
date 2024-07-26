import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/signup_bloc/signup_mother_bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/signup_model.dart';
import 'package:flutter_childhood/view/screen/auth/mother_login.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/login/custombutton.dart';
import '../../widget/login/customrowloginorsignup.dart';
import '../../widget/login/customtextfield.dart';

class MotherSignup extends StatelessWidget {
  MotherSignup({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    // double screenwidth=MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => SignupMotherBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocListener<SignupMotherBloc, SignupMotherState>(
            listener: (context, state) {
              if (state is MotherSignUpSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.successmessage)));
                    print(state.successmessage);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MotherLogin()));
                
               }
              else if (state is MotherSignUpFailureState) {
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
                            height: screenheight / 6,
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
                        SizedBox(
                          height: screenheight / 30,
                        ),

                        //sign button
                        BlocBuilder<SignupMotherBloc, SignupMotherState>(
                          builder: (context, state) {
                            if (state is SignupMotherInitial) {
                              return Custombutton(
                                text: 'Sign up',
                                onPressed: () {
                                  context.read<SignupMotherBloc>().add(
                                      AddMotherSignupInfo(
                                          motherSignUpModel: MotherSignupModel(
                                              username: username.text,
                                              email: email.text,
                                              password: password.text)));
                                },
                              );
                            } else if (state is MotherSignUpLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Custombutton(
                                text: 'Sign up',
                                onPressed: () {
                                  context.read<SignupMotherBloc>().add(
                                      AddMotherSignupInfo(
                                          motherSignUpModel: MotherSignupModel(
                                              username: username.text,
                                              email: email.text,
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
