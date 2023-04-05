
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

class DriverLicensePage extends StatelessWidget {
  DriverLicensePage({Key? key}) : super(key: key);

  TextEditingController licenseNumberController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state){},
        builder: (context, state)=> SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(
                  controller: licenseNumberController,
                  validator: (value){},
                  context: context,
                  inputType: TextInputType.text,
                  height: 50.h,
                  verticalPadding: 12,
                  horizontalPadding: 12,
                  radius: 12,
                  text: 'License Number',
                  enabledBorderColor: Colors.grey
              ),

              SizedBox(height: 30.h,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Front Photo Of Driver\'s License',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 8.h,),
              Container(
                height: 200.h,
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ConditionalBuilder(
                  condition: RegisterCubit.get(context).frontDriverLicenseImage==null,
                  builder: (context)=> Image.asset('assets/images/certification.jpg', fit: BoxFit.cover,),
                  fallback: (context)=>  Image.file(RegisterCubit.get(context).frontDriverLicenseImage!, fit: BoxFit.cover,),
                ) ,
              ),
              SizedBox(height: 16.h,),

              CustomButton(
                text: 'Add Photo',
                color: primaryColor,
                radius: 12,
                height: 40.h,
                textColor: Colors.black,
                elevation: 0.0,
                function: (){
                  RegisterCubit.get(context).uploadFrontDriverLicenseImage();
                },
              ),
              SizedBox(height: 40.h,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Back Photo Of Driver\'s License',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 8.h,),
              Container(
                height: 200.h,
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ConditionalBuilder(
                  condition: RegisterCubit.get(context).backDriverLicenseImage==null,
                  builder: (context)=> Image.asset('assets/images/certification.jpg', fit: BoxFit.cover,),
                  fallback: (context)=> Image.file(RegisterCubit.get(context).backDriverLicenseImage!, fit: BoxFit.cover,),
                ) ,
              ),
              SizedBox(height: 16.h,),

              CustomButton(
                text: 'Add Photo',
                color: primaryColor,
                radius: 12,
                height: 40.h,
                textColor: Colors.black,
                elevation: 0.0,
                function: (){
                  RegisterCubit.get(context).uploadBackDriverLicenseImage();
                },
              ),


              SizedBox(height: 70.h,),
            ],
          ),
        ),
      ),
    );
  }
}
