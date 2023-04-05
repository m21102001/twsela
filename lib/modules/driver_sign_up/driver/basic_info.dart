import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twsela/components/constants.dart';
import 'package:twsela/components/core_components.dart';
import 'package:twsela/components/custom_button.dart';
import 'package:twsela/components/default_app_bar.dart';
import 'package:twsela/modules/register_screen/register_cubit.dart';
import 'package:twsela/modules/register_screen/register_states.dart';

class BasicDriverInfoPage extends StatelessWidget {
  BasicDriverInfoPage({Key? key}) : super(key: key);
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController streetController= TextEditingController();
  TextEditingController buildingNumberController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state){},
        builder: (context, state)=> SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 180.h,
                width: MediaQuery.of(context).size.width*0.6,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ConditionalBuilder(
                  condition: RegisterCubit.get(context).userImage==null,
                  builder: (context)=> Image.asset('assets/images/profile.jpg', fit: BoxFit.cover,),
                  fallback: (context)=> Image.file(RegisterCubit.get(context).userImage!, fit: BoxFit.cover,),
                ) ,
              ),
              SizedBox(height: 16.h,),

              CustomButton(
                text: 'Ad Photo',
                color: primaryColor,
                radius: 12,
                height: 40.h,
                textColor: Colors.black,
                elevation: 0.0,
                function: (){
                  RegisterCubit.get(context).uploadUserImage();
                },
              ),
              SizedBox(height: 40.h,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contact Information',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 8.h,),
              CustomTextFormField(
                  controller: nameController,
                  validator: (value){},
                  context: context,
                height: 50.h,
                verticalPadding: 12,
                horizontalPadding: 12,
                radius: 12,
                text: 'Name',
                enabledBorderColor: Colors.grey
              ),
              SizedBox(height: 20.h,),
              CustomTextFormField(
                  controller: emailController,
                  validator: (value){},
                  context: context,
                  height: 50.h,
                  verticalPadding: 12,
                  inputType: TextInputType.emailAddress,
                  horizontalPadding: 12,
                  radius: 12,
                  text: 'Email',
                  enabledBorderColor: Colors.grey
              ),
              SizedBox(height: 20.h,),
              CustomTextFormField(
                  controller: phoneController,
                  validator: (value){},
                  context: context,
                  height: 50.h,
                  verticalPadding: 12,
                  horizontalPadding: 12,
                  inputType: TextInputType.number,
                  radius: 12,
                  text: 'Phone',
                  enabledBorderColor: Colors.grey
              ),


              SizedBox(height: 30.h,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Driver Address',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 8.h,),
              CustomTextFormField(
                  controller: buildingNumberController,
                  validator: (value){},
                  context: context,
                  inputType: TextInputType.number,
                  height: 50.h,
                  verticalPadding: 12,
                  horizontalPadding: 12,
                  radius: 12,
                  text: 'Building Number',
                  enabledBorderColor: Colors.grey
              ),
              SizedBox(height: 20.h,),
              CustomTextFormField(
                  controller: streetController,
                  validator: (value){},
                  context: context,
                  height: 50.h,
                  verticalPadding: 12,
                  horizontalPadding: 12,
                  radius: 12,
                  text: 'Street',
                  enabledBorderColor: Colors.grey
              ),

              SizedBox(height: 70.h,),
            ],
          ),
        ),
      ),
    );
  }
}
