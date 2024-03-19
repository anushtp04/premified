import 'package:firebase_auth/firebase_auth.dart';

class FireAuthHelper{
  final FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;

  Future<String?> signUp({required String email, required String password})async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return null;
    }
    on FirebaseAuthException catch(error){
      return error.message;
    }
  }

  Future<String?> signIn({required String email, required String password})async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    }
    on FirebaseAuthException catch(error){
      return error.message;
    }
  }

  Future<void> signOut() async{
    await auth.signOut();
  }

}