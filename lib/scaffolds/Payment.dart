import 'package:flutter/material.dart';
import 'package:food/widgets/mellatCard.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../providers/payment_provider.dart';
import 'approved.dart';
import 'declined.dart';

class Payment extends StatefulWidget {

  final double total;

  const Payment({Key? key, required this.total}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  PaymentProvider? paymentProvider;

  bool _isButtonDisabled = false;

  void _handleButtonTap() {
    if (!_isButtonDisabled) {
      setState(() {
        _isButtonDisabled = true;
      });

      Random random = new Random();
      code = random.nextInt(99999) + 10000;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  Text('Your OTP is: ' + code.toString()),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 150,
            left: 10,
            right: 10,
          ),
          duration: Duration(seconds: 7),
          dismissDirection: DismissDirection.up,

        ),
      );

      Future.delayed(Duration(seconds: 120), () {
        setState(() {
          _isButtonDisabled = false;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    paymentProvider = Provider.of(context,listen: false);
    paymentProvider!.init();
  }

  int ?code;

  bool enableOTP = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trustable and convenient payment🗿', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightBlueAccent,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Consumer<PaymentProvider>(
          builder: (context, paymentProvider, child) {
            return Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Text('🗿', style: TextStyle(fontSize: 84,),)),
                  Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text('Amount: ' + widget.total.toString() + '\$', style: TextStyle(fontSize: 30),),
                        ],
                      )
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black)
                      ),
                      child: mellatCard(context,paymentProvider)
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: paymentProvider.myController4,
                            decoration: InputDecoration(
                              hintText: 'OTP Code',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                              labelText: 'OTP Code'
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text('Request OTP', style: TextStyle(color: Colors.black, fontSize: 20),),
                              ),
                            ),
                            onPressed: enableOTP ? () {_handleButtonTap();} : null
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      child: Text('OK'),
                      onPressed: () {
                        if(paymentProvider.myController4!.text == code.toString() && paymentProvider.myController!.text.isNotEmpty && paymentProvider.myController2!.text.isNotEmpty && paymentProvider.myController3!.text.isNotEmpty) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Approved()));
                        }
                        else {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Declined()));
                        }
                      }
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // paymentProvider!.controllerClear();
  }

}
