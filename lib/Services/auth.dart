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
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseObject);
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
Future signinWithEmailAndPassword(String email,String password)async{
  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseObject(user);
  } catch(e){
    print(e.toString());
    return null;
  }
}
//register with email and password
Future registerWithEmailAndPassword(String email,String password)async{
  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    //create new document for the user
    //await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
    return _userFromFirebaseObject(user);
  } catch(e){
    print(e.toString());
    return null;
  }
}
//logout
  Future signout() async{
    try{
      return await _auth.signOut();   
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}
