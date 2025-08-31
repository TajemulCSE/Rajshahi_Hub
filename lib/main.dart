import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rajshahi_hub/provider/auth_provider.dart';
import 'package:rajshahi_hub/screens/auth/forgot_pass/forgot_password.dart';
import 'package:rajshahi_hub/screens/auth/login/login.dart';
import 'package:rajshahi_hub/screens/auth/signup/signup.dart';
import 'package:rajshahi_hub/screens/home.dart';
import 'package:rajshahi_hub/utils/my_app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
        
      ],
      child: MyApp()));
  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
    
    routes: {
      Home.routeName:(context)=> Home(),
      Login.routeName:(context)=>Login(),
      Signup.routeName:(context)=>Signup(),
      ForgotPassword.routeName:(context)=>ForgotPassword(),




    },
    initialRoute: Login.routeName,

    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: MyAppColors.background),
    
    );
  }
  
}