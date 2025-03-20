import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecases/usecase.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/domain/repsotory/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SignupUseCase implements Usecase<Either, CreateUser> {
  @override
  Future<Either> call({CreateUser ? params}) {
    return sl<AuthRepository>().signup(params!);
  }
  
}