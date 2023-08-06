import 'package:flutter/material.dart';
import 'package:food/providers/basket_provider.dart';
import 'package:food/statics/colors.dart';
import 'package:food/statics/icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import '../models/food.dart';
import '../textControllers/controllers.dart';
import 'Payment.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {

  @override
  Widget build(BuildContext context) {

    var dt = DateTime.now();

    var width = MediaQuery.of(context).size.width;

    return(
      Scaffold(
        appBar: AppBar(
          title: Text('Basket', style: TextStyle(color: Colors.black),),
          backgroundColor: Color(-13175643),
          automaticallyImplyLeading: false,
          leading: BackButton(
            color: Colors.black,
            //You don't code this for the back button
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: Consumer<BasketProvider>(
            builder: (context, basketProvider ,child) {
              if (dt.day == 11 && dt.month == 2 && dt.hour < 3 && dt.hour > 5) {
                double total = 0;
                for (int j = 0; j < basketProvider.foodList.length; j++) {
                  total += (basketProvider.foodList[j].price * basketProvider.foodList[j].amount);
                }
                total /= 3;
                total *= 2;
                total.round();
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  basketProvider.setTotal(total);
                  basketProvider.bahmanTrue();
                });
              }
              else {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  basketProvider.bahmanFalse();
                });
              }
              if (dt.hour >= 2 && dt.hour <= 5) {
                double total = 0;
                for (int j = 0; j < basketProvider.foodList.length; j++) {
                  total += (basketProvider.foodList[j].price * basketProvider.foodList[j].amount);
                }
                total /= 5;
                total *= 4;
                total.round();
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  basketProvider.setTotal(total);
                  basketProvider.nightTrue();
                });
              }
              else {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  basketProvider.nightFalse();
                });
              }
              List<Widget> foodList = [];
              for (int j = 0; j < basketProvider.foodList.length; j++) {
                foodList.add(foodItem(basketProvider.foodList[j], context, basketProvider));
              }
              List<double> foodPrice = [];
              for (int oj = 0; oj < basketProvider.foodList.length; oj++) {
                foodPrice.add(basketProvider.foodList[oj].price);
              }
              List<Widget> priceWidget = [];
              for (int jo = 0; jo < basketProvider.foodList.length; jo++) {
                double temp = foodPrice[jo] * basketProvider.foodList[jo].amount;
                priceWidget.add(
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(flex: 2, child: Text(basketProvider.foodList[jo].amount.toString() + 'X', style: TextStyle(fontSize: 25),)),
                            Expanded(flex: 10, child: Text(basketProvider.foodList[jo].name, style: TextStyle(fontSize: 25),)),
                            Expanded(flex: 3, child: Text(temp.toString() + '\$', style: TextStyle(fontSize: 23),)),
                          ],
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  )
                );
              }
              return Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Column(
                        children: foodList,
                      ),
                    ),
                  ),
                  Divider(color: Colors.black, thickness: 5,),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  if (basketProvider.augh == true) Dismissible(
                                    key: Key('Discount'),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Container(
                                        width: width,
                                        height: 25,
                                        decoration: BoxDecoration(gradient: LinearGradient(colors: [
                                          Colors.red,
                                          Colors.orange,
                                          Colors.yellow,
                                          Colors.green,
                                          Colors.cyan,
                                          Colors.deepPurpleAccent
                                        ]), borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(child: Text('Discount:', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                                            Expanded(child: Text('20%', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                                            Expanded(child: Text('Code: augh20', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                                          ],
                                        ),
                                      ),
                                    ),
                                    background: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Container(
                                        width: width,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: Colors.red
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 5),
                                          child: Align(alignment: Alignment.centerRight, child: Icon(UsedIcons.delete, color: Colors.white, size: 20,)),
                                        ),
                                        ),
                                    ),
                                    onDismissed: (DismissDirection direction) {
                                      double total = 0;
                                      for (int j = 0; j < basketProvider.foodList.length; j++) {
                                        total += basketProvider.foodList[j].amount * basketProvider.foodList[j].price;
                                      }
                                      basketProvider.setTotal(total);
                                      basketProvider.disFalse();
                                    },
                                    direction: DismissDirection.endToStart,
                                  ),
                                  if (basketProvider.bahman == true)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Container(
                                        width: width,
                                        height: 25,
                                        decoration: BoxDecoration(gradient: LinearGradient(colors: [
                                          Colors.green,
                                          Colors.white,
                                          Colors.red,
                                        ]), borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(child: Text('Discount:', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                                            Expanded(child: Text('30%', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                                            Expanded(child: Text('تخفیف ۲۲ بهمن', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (basketProvider.night == true)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Container(
                                        width: width,
                                        height: 25,
                                        decoration: BoxDecoration(gradient: LinearGradient(colors: [
                                          Colors.pinkAccent,
                                          Colors.blueAccent,
                                        ]), borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(child: Text('Discount:', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                                            Expanded(child: Text('20%', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                                            Expanded(child: Text('Night rush', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  Column(
                                    children: priceWidget,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 3, left: 20, right: 20),
                          child: Divider(color: Color(-13175643), thickness: 5,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Total: ' + basketProvider.total.toString() + '\$', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, foreground: Paint()..shader = LinearGradient(colors: <Color>[Colors.green, Colors.blueAccent]).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),),
                                      Container(
                                        width: 160,
                                        height: 40,
                                        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green, Colors.blueAccent]), borderRadius: BorderRadius.all(Radius.circular(10))),
                                        child: TextButton(
                                          child: Text('Buy items', style: TextStyle(color: Colors.white, fontSize: 20),),
                                          onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Payment(total: basketProvider.total,)));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          width: 155,
                                          height: 50,
                                          child: TextField(
                                            controller: Controllers.myController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Discount coupon',
                                              labelText: 'Discount coupon',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Expanded(
                                        child: Container(
                                          width: 30,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                            color: Color(-13175643),
                                          ),
                                          child: TextButton(
                                            child: Text('OK', style: TextStyle(color: Colors.black, fontSize: 11),),
                                            onPressed: () {
                                              if (basketProvider.night == false && basketProvider.bahman == false) {
                                                if  (Controllers.myController.text == 'augh20' && basketProvider.augh == true) {
                                                  const snackBar = SnackBar(content: Text('You have already used this discount code!', style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center,), backgroundColor: SpecialColors.cyan,);
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                                else if (Controllers.myController.text == 'augh20' && basketProvider.augh == false) {
                                                  basketProvider.disTrue();
                                                  double total = 0;
                                                  for (int j = 0; j < basketProvider.foodList.length; j++) {
                                                    total += (basketProvider.foodList[j].price * basketProvider.foodList[j].amount);
                                                  }
                                                  total /= 5;
                                                  total *= 4;
                                                  total.round();
                                                  basketProvider.setTotal(total);
                                                }
                                                else if (Controllers.myController.text.isEmpty && basketProvider.augh == false) {
                                                  const snackBar = SnackBar(content: Text('Please enter a discount code!', style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center,), backgroundColor: SpecialColors.cyan,);
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                                else if(Controllers.myController.text != 'augh20' && basketProvider.augh == false) {
                                                  const snackBar = SnackBar(content: Text('Your discount code is incorrect!', style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center,), backgroundColor: SpecialColors.cyan,);
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                                else if(Controllers.myController.text != 'augh20' && basketProvider.augh == true) {
                                                  const snackBar = SnackBar(content: Text('Your code is incorrect and you have already used a discount code!', style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center,), backgroundColor: SpecialColors.cyan,);
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                                else if(Controllers.myController.text == 'augh20' && basketProvider.augh == true) {
                                                  const snackBar = SnackBar(content: Text('You have already used a discount code!', style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center,), backgroundColor: SpecialColors.cyan,);
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                              }
                                              else {
                                                const snackBar = SnackBar(content: Text('You have another discount in use!', style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center,), backgroundColor: SpecialColors.cyan,);
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          ),
        ),
      )
    );
  }

  Widget foodItem(Food food, context, BasketProvider basketProvider){
    return Container(
      width: (MediaQuery.of(context).size.width),
      child: (
          Row(
            children: [
              Image.asset(food.image, width: 100, height: 100,),
              Expanded(child: Text(food.name, style: TextStyle(color: Colors.black, fontSize: 20))),
              Column(
                children: [
                  IconButton(
                    icon: Icon(UsedIcons.add, color: Colors.black, size: 18,),
                    onPressed: () {
                      basketProvider.addTotal(food);
                      basketProvider.updateAdd(food);
                    },
                  ),
                  Text(food.amount.toString(), style: TextStyle(fontSize: 18),),
                  IconButton(
                      icon: Icon(UsedIcons.remove, color: Colors.black, size: 18,),
                      onPressed: () {
                        basketProvider.subTotal(food);
                        basketProvider.updateSub(food);
                        if(basketProvider.foodList.isEmpty) Navigator.of(context).pop();
                      }
                  )
                ],
              ),
              IconButton(
                  icon: Icon(UsedIcons.delete, color: Colors.black, size: 18,),
                  onPressed: () {
                    basketProvider.delTotal(food);
                    food.amount = 1;
                    basketProvider.updateDel(food);
                    if(basketProvider.foodList.isEmpty) Navigator.of(context).pop();
                  }
              )
            ],
          )
      ),
    );
  }
}