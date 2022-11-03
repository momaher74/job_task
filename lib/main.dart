import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_task/component/network/remote/dio.dart';
import 'package:job_task/moduels/gallery_moduel/gallery_screen.dart';

import 'component/shared_component/bloc_observ.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized() ;
  DioHelper.init() ;
  BlocOverrides.runZoned(
        () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GalleryScreen(),
    );
  }
}

