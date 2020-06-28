import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindlyshare/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//crate user object
  User _userFromFirebaseObject(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseObject);
  }

//signin anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseObject(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//login with email and password
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseObject(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = name;
      print('name: $name');
      await user.updateProfile(updateInfo);
      await user.reload();
      print('user displayname is : ${user.displayName}');
      //create new document for the user
      Firestore.instance.collection('users').document().setData({
        'name': name,
        'uid': user.uid,
        'email': user.email, // will also be false
        'photoUrl': user.photoUrl, // will always be null
      });
      //await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseObject(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// change password
  void changePassword(String password) async {
    //Create an instance of the current user.
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    //Pass in the password to updatePassword.
    user.updatePassword(password).then((_) {
      print("Succesfull changed password");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

//logout
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
