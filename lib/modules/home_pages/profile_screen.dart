
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twsela/components/custom_button.dart';
import 'package:twsela/components/default_app_bar.dart';
import 'package:twsela/modules/login_screen/login_screen.dart';

import '../../components/core_components.dart';
import 'edit_profile_screen.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Profile',
        withLeadingButton: true,
        leadingFunction: (){},
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 77.w,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 75.w,
                  backgroundImage: AssetImage('assets/images/person.jpg',),
                ),
              ),
              SizedBox(height: 4.h,),
              Text(
                'Mohamed Fayoumy',
                style: TextStyle(
                  fontSize: 26.sp,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 16.h,),
              CustomButton(
                text: 'Edit Information',
                elevation: 0.0,
                textColor: Colors.black,
                color: Colors.white,
                width: MediaQuery.of(context).size.width*0.5,
                icon: Icons.arrow_back_ios,
                iconColor: Colors.black,
                function: (){
                  //navigateTo(context, EditProfileScreen());
                },
              ),

              SizedBox(height: 16.h,),
              SettingButton(
                text: 'Settings',
                icon: Icons.settings_outlined,
                function: (){

                },
              ),
              SettingButton(
                text: 'Support',
                icon: Icons.support_agent_rounded,
                function: (){

                },
              ),
              SettingButton(
                text: 'Log out',
                icon: Icons.logout_rounded,
                function: (){
                  navigateWithoutBack(context, LoginScreen());
                },
              ),
              SizedBox(height: 50.h,),
            ],
          ),
        ),
      ),
    );
  }
}



class SettingButton extends StatelessWidget {
  SettingButton({Key? key,
    required this.icon,
    required this.text,
    this.isDelete=false,
    required this.function,
  }) : super(key: key);

  String text;
  Function function;
  IconData icon;
  bool isDelete=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: MaterialButton(
        height: 50.h,
        elevation: 0.0,
        onPressed: (){
          function();
        },
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Icon(icon, color: Colors.black,size: 24.w,)),
            SizedBox(width: 12.w,),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color:Colors.black,
                fontSize: 18.sp,
              ),
            ),
            const Spacer(),
            CircleAvatar(
                radius: 12.w,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 16.w,)),
          ],
        ),
      ),
    );
  }
}

