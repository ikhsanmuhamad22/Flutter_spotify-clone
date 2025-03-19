import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';

abstract class AuthFirebaseService {
  Future<void> signup(CreateUser createuser);
  Future<void> signin();
}

class AuthFirebaseImpl extends AuthFirebaseService {
  @override
  Future<void> signin() {
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUser createuser) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createuser.email,
        password: createuser.password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
