import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_task/component/network/remote/dio.dart';
import 'package:job_task/component/shared_component/shared_pref.dart';
import 'package:job_task/models/user_model.dart';
import 'package:meta/meta.dart';

import '../../gallery_moduel/gallery_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void logIn({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'auth/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(LoginSuccessState());
      moveToGalleryScreen(context , userModel!.user!.name!);
      rememberUser(userToken: userModel!.token!);
    }).catchError((error) {
      emit(LoginErrorState());
    });
  }

  void moveToGalleryScreen(context , String name) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>  GalleryScreen(name: name,),
      ),
    );
  }

  void rememberUser({required String userToken}) {
    CacheHelper.saveData(key: 'token', value: userToken).then((value) {
      emit(RememberUserSuccessState());
    }).catchError((error) {
      emit(RememberUserErrorState());
    });
  }
}
