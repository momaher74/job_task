class GalleryModel{
  String ? status ;
  String ? message ;
  Data ? data ;
  GalleryModel.fromJson(Map<String , dynamic> json){
    status=json['status'] ;
    message=json['message'] ;
    data = Data.fromJson(json['data']) ;
  }

}
class Data{
  List  images  = [];
  Data.fromJson(Map<String , dynamic> json) {
    json['images'].forEach((element) {
      images.add(element) ;
    }) ;
  }
}