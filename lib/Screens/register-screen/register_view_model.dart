


import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel{

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController passwordConfirmController =TextEditingController();
  bool visiblePassword = true;

  bool visibleConfirmPassword = true;

  void toggleVisiblity(String from){
    if(from == "pass"){
      visiblePassword = !visiblePassword;
    }else if(from == "confPass"){
      visibleConfirmPassword = !visibleConfirmPassword;
    }

    notifyListeners();
  }


}