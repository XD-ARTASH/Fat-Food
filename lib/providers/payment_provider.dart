

import 'package:flutter/material.dart';

import '../textControllers/masked_text_controller.dart';

class PaymentProvider extends ChangeNotifier {

  TextEditingController myController = MaskedTextController(mask: '0', length: 16);

  TextEditingController myController1 = MaskedTextController(mask: 'A', length: 25);

  TextEditingController myController2 = MaskedTextController(mask: '0', length: 4);

  TextEditingController myController3 = MaskedTextController(mask: '0', length: 4);

  TextEditingController myController4 = MaskedTextController(mask: '0', length: 6);

  void init() {
     myController = MaskedTextController(mask: '0', length: 16);

     myController1 = MaskedTextController(mask: 'A', length: 25);

     myController2 = MaskedTextController(mask: '0', length: 4);

     myController3 = MaskedTextController(mask: '0', length: 4);

     myController4 = MaskedTextController(mask: '0', length: 6);

  }

  void controllerDispose() {
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
  }

}