// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _mainCollection = _firestore.collection('gunpla');

// class Firestore {
//   static String seriesUid;

//   static Stream<QuerySnapshot> readItems() {
//     CollectionReference gunplaItemCollection =
//         _mainCollection.doc(seriesUid).collection('mobile suit gundam');

//     return gunplaItemCollection.snapshots();
//   }
// }

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  //create Accunt
  Future<String> createAccount({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Account created";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return "Error occurred";
    }
  }

  // sign in
  Future<String> signIN({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  // Reset Pw
  Future<String> resetPassword({String email}) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      return "Email sent";
    } catch (e) {
      return "Error occurred";
    }
  }

  // signout
  void signOut() {
    auth.signOut();
  }
}
