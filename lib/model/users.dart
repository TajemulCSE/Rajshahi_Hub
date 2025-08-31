import 'package:firebase_auth/firebase_auth.dart';

class Users {
  final String uid;
  final String email;
  final String? fullName;
  final String? address;
  final String? phoneNo;

  
  Users({
    required this.uid,
    required this.email,
    this.fullName,
    this.address,
    this.phoneNo

  });

 factory Users.fetchFirebaseUsers(User user) {
    return Users(
      uid: user.uid,
      email: user.email!,
    );
  }

 Map<String, dynamic> toMapFireStore(){
  return{
    'uid':uid,
    'email':email,
    'fullName':fullName,
    'address':address,
    'phoneNo':phoneNo

  };
 }
  
}