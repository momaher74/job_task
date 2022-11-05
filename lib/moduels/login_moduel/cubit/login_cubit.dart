import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_task/component/network/remote/dio.dart';
import 'package:job_task/component/shared_component/shared_pref.dart';
import 'package:job_task/models/user_model.dart';
import 'package:job_task/moduels/gallery_moduel/tab_gallery_screen.dart';
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
    required double width,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'auth/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(LoginSuccessState());
      moveToGalleryScreen(context, userModel!.user!.name!, width);
      rememberUser(userToken: userModel!.token!);
    }).catchError((error) {
      emit(LoginErrorState());
    });
  }

  void moveToGalleryScreen(context, String name, double width) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          if (width < 650) {
            return GalleryScreen(
              name: name,
            );
          } else {
            return TabGalleryScreen(name: name);
          }
        },
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
