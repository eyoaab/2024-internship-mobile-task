
import '../../Domaign/Entities/user_entities.dart';

class UserModel extends UserEnities {
  const UserModel({
    required String username,
    required String password,
    required String name,
   
  }) : super(
         username: username, password: password,name:name
        );


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'password': password,
    
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      username: json['username'],
      password: json['password'],
 
    );
  }

  UserEnities toUser() {
    return UserEnities(username: username, password: password,name: name);
    
  }
}
