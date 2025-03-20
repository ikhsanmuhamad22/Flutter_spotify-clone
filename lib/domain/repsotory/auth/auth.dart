import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninUser signinuser);
  Future<Either> signup(CreateUser createuser);
}