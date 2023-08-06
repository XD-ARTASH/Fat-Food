import 'package:flutter/material.dart';
import 'package:food/providers/basket_provider.dart';
import 'package:food/statics/icons.dart';
import 'package:provider/provider.dart';

class Approved extends StatefulWidget {
  const Approved({Key? key}) : super(key: key);

  @override
  State<Approved> createState() => _ApprovedState();
}

class _ApprovedState extends State<Approved> {
  @override
  void initState() {
    super.initState();
    var basketProvider = Provider.of<BasketProvider>(context, listen: false);
    basketProvider.setTotal(0);
    Future.delayed(Duration(seconds: 3),(){
      basketProvider.delFood();
      Navigator.of(context).pop();
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
                Icon(UsedIcons.approved, size: 150, color: Colors.green,),
                SizedBox(height: 30,),
                Text('Approved🗿', style: TextStyle(fontSize: 30),),
                SizedBox(height: 100,),
              ],
            ),
          ),
        )
    );
  }
}
