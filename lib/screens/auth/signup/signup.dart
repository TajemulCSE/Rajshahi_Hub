import 'package:flutter/material.dart';
import 'package:rajshahi_hub/screens/auth/login/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  static const String routeName = '/signup';
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _SignUpForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     double screenWeight = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/rajshahi_hub_logo.png',
                fit: BoxFit.contain,
                height: screenHeight * .3,
              ),

              Text(
                "Hi, SignUp to continue! 👋",
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: screenHeight * .04,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Form(
                key: _SignUpForm,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter your email";
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "taj@gmail.com",
                          hintStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 20,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.amberAccent,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 248, 235, 188),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //input focused
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.amberAccent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //error
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //focused error
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter your password";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                        style: TextStyle(fontSize: 20),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "123456",
                          hintStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 20,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.amberAccent,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 248, 235, 188),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //input focused
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.amberAccent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //error
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //focused error
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        if (_SignUpForm.currentState!.validate()) {
                          print("SignUp success");
                        }
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,

                      child: Text(
                        "Already have an account ? ",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: screenHeight * .02,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF999EA1),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Login.routeName,
                        );
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
