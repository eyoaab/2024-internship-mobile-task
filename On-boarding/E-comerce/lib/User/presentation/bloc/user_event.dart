

import 'package:equatable/equatable.dart';

import '../../Domaign/Entities/user_entities.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends UserEvent {
  UserEnities userEnities;
  LoginEvent({required this.userEnities});
}

class SignUpEvent extends UserEvent {
  UserEnities userEnities;
  SignUpEvent({required this.userEnities});
}
class UserInitialEvent extends UserEvent {}

class LoginLoadingEvent extends UserEvent {}
