import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/Screens/Splash/splash_screen.dart';

void main(){

   runApp(const ProviderScope(child: RootApp()));
}




class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: SplashScreen(),
    );
  }
}
