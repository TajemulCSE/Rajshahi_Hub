import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rajshahi_hub/model/users.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isloading = false;
  String? _errorMsg;
  Users? _user;

  Users? get user => _user;
  bool get isloading => _isloading;
  String? get errorMsg=> _errorMsg;

    Future<void> signUpWithEmailPassword(String email, String password) async {
    _isloading = true;
    _errorMsg=null;
    notifyListeners();

    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = Users.fetchFirebaseUsers(result.user!);

    } catch (e) {
     _errorMsg=e.toString();
     print("Error found");
      print(_errorMsg);
      notifyListeners();
    
     
    }
    finally{
      _isloading=false;
      notifyListeners();
    }
  }

  Future<void> signInWithEmailPassword(String email, String password) async {
    _isloading = true;
    _errorMsg=null;
    notifyListeners();

    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = Users.fetchFirebaseUsers(result.user!);
    } catch (e) {
      _errorMsg=e.toString();
      print(e.toString());
      
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }



  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

void clearError(){
    _errorMsg=null;
    notifyListeners();

  }
}
