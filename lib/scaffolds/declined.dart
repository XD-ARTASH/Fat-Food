import 'package:flutter/material.dart';
import 'package:food/statics/icons.dart';

class Declined extends StatefulWidget {
  const Declined({Key? key}) : super(key: key);

  @override
  State<Declined> createState() => _DeclinedState();
}

class _DeclinedState extends State<Declined> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pop();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trustable and convenient payment🗿', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.lightBlueAccent,
          automaticallyImplyLeading: false,
        ),
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(UsedIcons.cancel, size: 150, color: Colors.red),
                SizedBox(height: 30,),
                Text('Not approved🗿', style: TextStyle(fontSize: 30),),
                SizedBox(height: 100,),
              ],
            ),
          ),
        )
    );
  }
}
