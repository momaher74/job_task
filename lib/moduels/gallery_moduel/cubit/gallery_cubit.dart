import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_task/component/network/remote/dio.dart';
import 'package:job_task/component/shared_component/constant.dart';
import 'package:job_task/models/gallery_model.dart';
import 'package:job_task/models/upload_model.dart';
import 'package:meta/meta.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  static GalleryCubit get(context) => BlocProvider.of(context);
  GalleryModel? galleryModel;

  void getImages() {
    emit(GetGalleryImagesLoadingState());
    DioHelper.getData(url: 'my-gallery', token: token).then((value) {
      galleryModel = GalleryModel.fromJson(value.data);

      emit(GetGalleryImagesSuccessState());
    }).catchError((error) {
      emit(GetGalleryImagesErrorState());
    });
  }

  ImagePicker picker = ImagePicker();
  File? img;

  Future<void> pickGalleryImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      img = File(pickedFile.path);

      emit(PickFileSuccessState());
    } else {
      print('No  Profile image selected.');
      emit(PickFileErrorState());
    }
  }

  Future<void> pickCameraImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      img = File(pickedFile.path);

      emit(PickFileSuccessState());
    } else {
      print('No  Profile image selected.');
      emit(PickFileErrorState());
    }
  }

  UploadModel? uploadModel;

  void uploadImg() async {
    emit(UploadImgLoadingState());
    String fileName = img!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "img": await MultipartFile.fromFile(img!.path, filename: fileName),
    });
    DioHelper.postData(url: 'upload', data: formData, token: token)
        .then((value) {
      uploadModel = UploadModel.fromJson(value.data);
      getImages();
      img = null;
    }).catchError((error) {
      emit(UploadImgErrorState());
    });
  }
}
