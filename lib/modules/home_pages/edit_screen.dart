

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twsela/components/custom_button.dart';
import 'package:twsela/components/default_app_bar.dart';

import '../../components/constants.dart';
import '../../layout/cubit/app_cubit.dart';
import '../../layout/cubit/shop_states.dart';


class EditScreen extends  StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){

          return Scaffold(
            appBar: DefaultAppBar(
              title: 'Update Profile',
              leadingFunction: (){
                Navigator.pop(context);
              },
              withLeadingButton: true,

            ),
            body:  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter your name';
                            }
                            else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0,),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone',
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter your phone';
                            }
                            else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',

                            prefixIcon: Icon(
                              Icons.email_outlined,
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter email address';
                            }
                            else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter new password';
                            }
                            else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter new password';
                            }
                            else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 50.0,),
                        CustomButton(
                          text: 'Update',
                          radius: 12,
                          height: 40.h,
                          color: secondaryColor,
                          function: (){},
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
