import 'package:equatable/equatable.dart';

class UserEnities extends Equatable{
  const UserEnities ({
    required this.username,
    required this.password,
    
  
  });
  final String username;
  final String password;
  
  
  @override
  List<Object?> get props => [
    password,
    username,

  ];

}