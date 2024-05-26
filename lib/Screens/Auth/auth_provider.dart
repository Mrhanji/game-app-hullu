import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider= ChangeNotifierProvider((ref) => _authProvider());

class _authProvider extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  register()async{
    registerFormKey.currentState!.validate();
  }


  login()async{
    formKey.currentState!.validate();
  }
}