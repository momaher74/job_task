
class UserModel {
 String ? token ;
 User ? user ;
 UserModel.fromJson(Map<String,dynamic> json){
   token=json['token'] ;
   user = User.fromJson(json['user']) ;
 }
}
class User{
  int? id ;
  String ? name ;
  String ? email ;
  String ? emailVerifiedAt ;
  String ? createdAt ;
  String ? updatedAt ;
  User.fromJson(Map<String , dynamic> json) {
    id = json['id'] ;
    name=json['name'] ;
    emailVerifiedAt=json['email_verified_at'] ;
    createdAt=json['created_at'] ;
    updatedAt=json['updated_at'] ;
    email = json['email'];

  }
}
