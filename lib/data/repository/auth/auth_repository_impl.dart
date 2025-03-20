import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repsotory/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUser signinuser) async {
      return await sl<AuthFirebaseService>().signin(signinuser);
  }

  @override
  Future<Either> signup(CreateUser createuser) async {
    return await sl<AuthFirebaseService>().signup(createuser);
  }
}
