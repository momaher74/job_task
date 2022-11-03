import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_task/component/network/remote/dio.dart';
import 'package:job_task/component/shared_component/constant.dart';
import 'package:job_task/models/gallery.dart';
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
      print(img);
      emit(PickProdImgSuccessState());
    } else {
      print('No  Profile image selected.');
      emit(PickProdImgErrorState());
    }
  }

  void uploadImg() {
    emit(UploadImgLoadingState());
    DioHelper.postData(url: 'upload', data: {
      'img': img,
    }).then((value) {
      emit(UploadImgSuccessState());
    }).catchError((error) {
      emit(UploadImgErrorState());
    });
  }

  pickFile() {
    FilePicker.platform.pickFiles().then((value) {
      img = File(value!.files.single.path!);
      emit(PickProdImgSuccessState());
    }).catchError((error) {
      emit(PickProdImgErrorState());
    });
  }
}
