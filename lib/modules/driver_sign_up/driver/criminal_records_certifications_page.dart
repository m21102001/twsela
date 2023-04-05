
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

class CriminalRecordsCertificationsPage extends StatelessWidget {
  CriminalRecordsCertificationsPage({Key? key}) : super(key: key);

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

              SizedBox(height: 50.h,),
              Container(
                height: 200.h,
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ConditionalBuilder(
                  condition: RegisterCubit.get(context).criminalRecordsImage==null,
                  builder: (context)=> Image.asset('assets/images/certification.jpg', fit: BoxFit.cover,),
                  fallback: (context)=> Image.file(RegisterCubit.get(context).criminalRecordsImage!, fit: BoxFit.cover,),
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
                  RegisterCubit.get(context).uploadCriminalRecordsImage();
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

