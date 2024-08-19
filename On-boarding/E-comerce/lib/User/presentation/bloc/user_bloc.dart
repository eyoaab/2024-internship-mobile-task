


import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/faliure.dart';
import '../../Domaign/Usecases/login_usecase.dart';
import '../../Domaign/Usecases/signIn_usecase.dart';
import 'user_event.dart';
import 'user_state.dart';



 
class UserBloc extends Bloc<UserEvent, UserState> {
   
   final LoginUseCase loginUsecase;
  final SignUpUseCase signUpUsecase;

  UserBloc({
    required this.loginUsecase,
    required this.signUpUsecase,
  }) : super(UserInitial()){
      
   print('Welcome to user bloc...');

   
    
    on<SignUpEvent> ((event,emit)async{
       emit(UserLoading());
    final Either<Failure, bool> result = await signUpUsecase.call(event.userEnities);
    result.fold(
      (failure) => emit(UserError('failed to sign a user')),
      (check) => emit(UserSignedUp(isSignedUp: check)),
    );
    });

    on<LoginEvent> ((event,emit) async{
      ('request accepted in blobc');
       emit(UserLoading());
    final result = await loginUsecase.call(event.userEnities);
    print('result from bloc');
    print(result);
    
    result.fold(
      (failure) => emit(UserError('failed to load')),
      (check) =>emit(UserLoggedIn(isLogedin: check)),
    );
    });

    on<UserInitialEvent> ((event,emit){
      emit(UserInitial());}

    );
  }
}

