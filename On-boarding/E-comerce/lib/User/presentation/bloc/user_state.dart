abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoggedIn extends UserState {
  final bool isLogedin;


  UserLoggedIn({required this.isLogedin});

}

class UserSignedUp extends UserState {
  final bool isSignedUp;

  UserSignedUp({required this.isSignedUp});
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
