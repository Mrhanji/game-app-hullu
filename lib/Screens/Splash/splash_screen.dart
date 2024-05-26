import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/Screens/Splash/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.read(splashProvider).onInit(context);
    return Scaffold(
      ///appBar: AppBar(),
      body:SafeArea(
        child: Center(
         child:
            FlutterLogo(
              size: 190,
            )
        ),
      ),
    );
  }
}
