import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Screens/Auth/auth_provider.dart';
import '/Screens/Auth/register_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: size.height * 0.25,
                    ),
                  ],
                ),
                Text(
                  "Welcome!",
                  style: GoogleFonts.abel(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.034),
                ),
                Text(
                  "please login or sing up to continue our app.",
                  style: GoogleFonts.openSans(),
                ),
                // Container(
                //   height: size.height*0.06,
                //   width: size.width,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     border: Border.all(color: Colors.black38)
                //   ),
                // ),

                Form(
                  key: ref.read(authProvider).formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(CupertinoIcons.mail_solid)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          // You can add more email validation rules here
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            icon: Icon(CupertinoIcons.lock_circle_fill)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          // You can add more password validation rules here
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.07,
                        child: ElevatedButton(
                          onPressed: ()=>ref.read(authProvider).login(),
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Forgot password logic
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (builder)=>RegisterScreen()));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
