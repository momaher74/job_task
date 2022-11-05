import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_task/component/network/remote/dio.dart';
import 'package:job_task/component/shared_component/shared_pref.dart';
import 'package:job_task/moduels/gallery_moduel/cubit/gallery_cubit.dart';
import 'package:job_task/moduels/gallery_moduel/gallery_screen.dart';
import 'package:job_task/moduels/login_moduel/cubit/login_cubit.dart';
import 'package:job_task/moduels/login_moduel/login_screen.dart';

import 'component/shared_component/bloc_observ.dart';
import 'component/shared_component/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  String userToken = await CacheHelper.getData(key: 'token');
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => GalleryCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home:  LoginScreen(),
      ),
    );
  }
}
