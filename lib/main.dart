import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twsela/modules/login_screen/login_screen.dart';
import 'package:twsela/shared/network/local/cache_helper.dart';
import 'package:twsela/shared/network/remote/dio_helper.dart';

import 'components/constants.dart';
import 'layout/cubit/app_cubit.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return BlocProvider(
          create: (context)=>AppCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: LoginScreen(),
    );
  }
}
