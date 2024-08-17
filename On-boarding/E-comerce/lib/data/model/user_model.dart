
import '../../domain/entitiy/user_entities.dart';

class UserModel extends UserEnities {
  const UserModel({
    required String username,
    required String password,
   
  }) : super(
         username: username, password: password
        );


  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      password: json['password'],
 
    );
  }

  UserEnities toUser() {
    return UserEnities(username: username, password: password);
    
  }
}
