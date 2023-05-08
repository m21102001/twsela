


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twsela/components/core_components.dart';
import 'package:twsela/layout/home_layout.dart';
import '../../models/models.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit <LoginStates>{
  LoginCubit():super(LoginInitialState());


  static LoginCubit get(context)=> BlocProvider.of(context);

  late ShopLoginModel loginModel;



  bool isShown = false;
  void changePassword(){
    isShown=!isShown;
    emit(LoginChangeState());
  }

  void login({
    required String email,
    required String password,
    required context,
  }){
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      print(value.user!.toString());

      navigateWithoutBack(context, HomeLayout());
      emit(LoginSuccessState());
    }).catchError((error){
      List<String>err= error.toString().split(']');
      emit(LoginErrorState(err.last));
    });

  }


}