import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecases/usecase.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';
import 'package:spotify_clone/domain/repsotory/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninUser> {
  @override
  Future<Either> call({SigninUser ? params}) {
    return sl<AuthRepository>().signin(params!);
  }
  
}