

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class UpdateViewModal extends BaseViewModel{

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void updateController(String title,String subtitle, String price){
    titleController.text = title;
    subtitleController.text = subtitle;
    priceController.text = price;

    notifyListeners();
  }

}

