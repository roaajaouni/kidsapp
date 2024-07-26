import 'package:flutter/material.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/view/screen/admin/home_admin.dart';
import 'package:flutter_childhood/view/screen/auth/mother_login.dart';
import 'package:flutter_childhood/view/screen/auth/teacher_login.dart';
import 'package:flutter_childhood/view/widget/main_bottom_navigation_bar_page.dart';
import 'package:flutter_childhood/view/widget/teacher_main_bottom_navigation_bar_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class Startingrole extends StatelessWidget {
  const Startingrole({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Column(children: [
            const SizedBox(height: 75),
            const SizedBox(height: 50),
            const Text(
              'Which best describes you ?',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: AppColor.grey),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getIt.get<SharedPreferences>().getString('token') != null ?const  MainBottomNavigationBarPage() : MotherLogin(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 1000,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.terqaz,
                ),
                child: const Text(
                  'Parents',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.grey),
                ),
              ),
            ),
            const SizedBox(height: 25),
            // const Text(
            //   'OR',
            //   style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //       color: AppColor.grey),
            // ),
            // const SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getIt.get<SharedPreferences>().getString('teacher_token') != null ? TeacherMainBottomNavigationBarPage() : TeacherLogin(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 1000,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.terqaz,
                ),
                child: const Text(
                  'Teacher',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.grey),
                ),
              ),
            ),
             const SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                   // builder: (context) => getIt.get<SharedPreferences>().getString('teacher_token') != null ? TeacherMainBottomNavigationBarPage() : TeacherLogin(),
                    builder: (context) => AdminHomePage()
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 1000,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.terqaz,
                ),
                child: const Text(
                  'Admin',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              AppImageAsset.starting,
              height: 200,
            ),
          ])),
        ),
      ),
    );
  }
}
