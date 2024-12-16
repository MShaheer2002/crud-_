


import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel{


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visible = true;

  void toggleVisiblity(){
    visible = !visible;
    notifyListeners();
  }

}