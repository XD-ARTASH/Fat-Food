import 'package:flutter/material.dart';
import 'package:food/statics/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../providers/payment_provider.dart';

Widget mellatCard(BuildContext context, PaymentProvider paymentProvider) {
  return
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: Image.asset('Assets/Images/shahab.png', width: 40, height: 40,)),
              Expanded(flex: 2, child: Image.asset('Assets/Images/mellat.png', width: 30, height: 30,)),
              Expanded(flex: 4, child: Image.asset('Assets/Images/bank.png', width: 30, height: 30,)),
            ],
          ),
        ),
        Container(
        color: SpecialColors.mellatPink,
        child: Column(
          children: [
            SizedBox(
              height: 55,
            ),
            PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
                length: 16,
                blinkWhenObscuring: true,
                animationType: AnimationType.scale,
                validator: (text) {
                  if (text!.length < 16) {
                    return 'You must enter a 16 digit card number';
                  }
                  else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 25,
                  fieldWidth: 18,
                  activeFillColor: SpecialColors.mellatPink,
                  activeColor: Colors.black,
                  inactiveFillColor: SpecialColors.mellatPink,
                  inactiveColor: Colors.black,
                  selectedFillColor: SpecialColors.mellatPink,
                  selectedColor: Colors.black,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 400),
                enableActiveFill: true,
                controller: paymentProvider.myController,
                keyboardType: TextInputType.number,
                separatorBuilder: (context, index) {
                  if ((index + 1) % 4 == 0) {
                    return const SizedBox(width: 10,);
                  }
                  return Container();
                }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                textAlign: TextAlign.right,
                controller: paymentProvider.myController1,
                decoration: InputDecoration(
                    hintText: 'Full name',
                    border: InputBorder.none
                ),
              ),
            ),
            Row(

              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 30,
                              child: PinCodeTextField(
                                  appContext: context,
                                  pastedTextStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10
                                  ),
                                  length: 4,
                                  blinkWhenObscuring: true,
                                  animationType: AnimationType.scale,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.underline,
                                    fieldHeight: 30,
                                    fieldWidth: 15,
                                    activeFillColor: SpecialColors.mellatPink,
                                    activeColor: Colors.black,
                                    inactiveFillColor: SpecialColors.mellatPink,
                                    inactiveColor: Colors.black,
                                    selectedFillColor: SpecialColors.mellatPink,
                                    selectedColor: Colors.black,
                                  ),
                                  cursorColor: Colors.black,
                                  animationDuration: const Duration(
                                      milliseconds: 400),
                                  enableActiveFill: true,
                                  controller: paymentProvider.myController2,
                                  keyboardType: TextInputType.number,
                                  separatorBuilder: (context, index) {
                                    if ((index + 1) % 2 == 0) {
                                      return Text('/', style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),);
                                    }
                                    return Container();
                                  }
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(' : Exp. date'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('CVV2 : '),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: 50,
                          child: TextField(
                            controller: paymentProvider.myController3,
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
  ),
      ],
    );
}