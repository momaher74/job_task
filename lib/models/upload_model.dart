class UploadModel{
  String ?status ;
  String ?message ;
  UploadModel.fromJson(Map<String,dynamic> json) {
    status = json['status'] ;
    message = json['message'] ;
  }

}