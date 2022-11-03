part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GetGalleryImagesLoadingState extends GalleryState {}

class GetGalleryImagesSuccessState extends GalleryState {}

class GetGalleryImagesErrorState extends GalleryState {}

class UploadImgLoadingState extends GalleryState {}

class UploadImgSuccessState extends GalleryState {}

class UploadImgErrorState extends GalleryState {}

class PickProdImgSuccessState extends GalleryState {}

class PickProdImgErrorState extends GalleryState {}
