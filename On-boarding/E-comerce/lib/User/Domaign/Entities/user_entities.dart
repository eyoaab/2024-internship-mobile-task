import 'package:equatable/equatable.dart';

class UserEnities extends Equatable{
  const UserEnities ({
    required this.name,
    required this.username,
    required this.password,
    
  
  });
  final String name;
  final String username;
  final String password;
  
  
  @override
  List<Object?> get props => [
    password,
    username,
    name,

  ];

}