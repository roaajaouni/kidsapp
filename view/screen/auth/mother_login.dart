import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/mother_auth_bloc/mother_login_bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/mother_login_model.dart';
import 'package:flutter_childhood/view/screen/auth/mother_siginup.dart';
import 'package:flutter_childhood/view/screen/mother_app/mother_home.dart';
import 'package:flutter_childhood/view/widget/main_bottom_navigation_bar_page.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

import '../../widget/login/custombutton.dart';
import '../../widget/login/customrowloginorsignup.dart';
import '../../widget/login/customtextfield.dart';

class MotherLogin extends StatelessWidget {
  MotherLogin({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => MotherLoginBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocListener<MotherLoginBloc, MotherLoginState>(
            listener: (context, state) {
              if (state is MotherLoginSuccessState) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const MainBottomNavigationBarPage(),
                  ),
                );
              } else if (state is MotherLoginFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
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
                            }),

                        SizedBox(
                          height: screenheight / 30,
                        ),

                        //sign button
                        BlocBuilder<MotherLoginBloc, MotherLoginState>(
                          builder: (context, state) {
                            if (state is MotherLoginInitial) {
                              return Custombutton(
                                text: 'Sign in',
                                onPressed: () {
                                  context.read<MotherLoginBloc>().add(
                                        AddMotherInfo(
                                          motherInfo: MotherLoginModel(
                                              username: username.text,
                                              password: password.text),
                                        ),
                                      );
                                },
                              );
                            } else if(state is MotherLoginLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }else{
                              return Custombutton(
                                text: 'Sign in',
                                onPressed: () {
                                  context.read<MotherLoginBloc>().add(
                                        AddMotherInfo(
                                          motherInfo: MotherLoginModel(
                                              username: username.text,
                                              password: password.text),
                                        ),
                                      );
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
                          textone: 'Not yet a member ?',
                          texttwo: 'sign up now',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MotherSignup(),
                              ),
                            );
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
