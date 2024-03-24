import 'package:firebase_auth/firebase_auth.dart';

class FireAuthHelper{
  final FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;


  Future<String?> signUp({required String name, required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);

      // Update user profile to set the display name
      await userCredential.user?.updateDisplayName(name);

      return null; // Return null when sign-up is successful
    } on FirebaseAuthException catch (error) {
      return error.message; // Return error message if sign-up fails
    } catch (error) {
      print("Error updating profile: $error");
      return "Failed to update profile"; // Handle other errors when updating profile
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