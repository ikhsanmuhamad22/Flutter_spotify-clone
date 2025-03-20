import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUser createuser);
  Future<Either> signin(SigninUser signinuser);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUser signinuser) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinuser.email,
        password: signinuser.password,
      );

      print('hasil $result');

      return right('succesfully Signin');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'wrong password provided';
      }

      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUser createuser) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createuser.email,
        password: createuser.password,
      );

      return right('account succesfully registed');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is to week';
      } else if (e.code == 'email-already-in use') {
        message = 'an account is already exits with that email';
      }

      return left(message);
    }
  }
}
