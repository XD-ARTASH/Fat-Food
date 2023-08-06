import 'package:flutter/material.dart';
import 'package:food/providers/basket_provider.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import 'foodItem.dart';

class Restaurant extends StatelessWidget {

  final String logo;
  final Color cont;
  final Color tex;
  final int hour;
  final String imageOne;
  final String nameOne;
  final int ?discountOne;
  final int ?discTimeOne;
  final double priceOne;
  final String imageTwo;
  final int ?discountTwo;
  final int ?discTimeTwo;
  final String nameTwo;
  final double priceTwo;
  final String imageThree;
  final String nameThree;
  final int ?discountThree;
  final int ?discTimeThree;
  final double priceThree;
  final String imageFour;
  final String nameFour;
  final int ?discountFour;
  final int ?discTimeFour;
  final double priceFour;
  final String imageFive;
  final String nameFive;
  final double priceFive;
  final int ?discountFive;
  final int ?discTimeFive;

  const Restaurant({super.key, required this.logo, required this.cont, required this.tex, required this.hour, required this.imageOne, required this.nameOne, required this.priceOne, this.discountOne, this.discTimeOne, required this.imageTwo, required this.nameTwo, required this.priceTwo, this.discountTwo, this.discTimeTwo, required this.imageThree, required this.nameThree, required this.priceThree, this.discountThree, this.discTimeThree, required this.imageFour, required this.nameFour, required this.priceFour, this.discountFour, this.discTimeFour, required this.imageFive, required this.nameFive, required this.priceFive, this.discountFive, this.discTimeFive,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            Image.asset(logo, width: 200,)
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 25),
              foodItem(Food(image: imageOne, name: nameOne, amount: 1, price: priceOne), cont, tex, context, hour, discountOne, discTimeOne),
              SizedBox(width: 25),
              foodItem(Food(image: imageTwo, name: nameTwo, amount: 1, price: priceTwo), cont, tex, context, hour, discountTwo, discTimeTwo),
              SizedBox(width: 25),
              foodItem(Food(image: imageThree, name: nameThree, amount: 1, price: priceThree), cont, tex, context, hour, discountThree, discTimeThree),
              SizedBox(width: 25),
              foodItem(Food(image: imageFour, name: nameFour, amount: 1, price: priceFour), cont, tex, context, hour, discountFour, discTimeFour),
              SizedBox(width: 25),
              foodItem(Food(image: imageFive, name: nameFive, amount: 1, price: priceFive), cont, tex, context, hour, discountFive, discTimeFive),
              SizedBox(width: 25),
            ],
          ),
        )
      ],
    );
  }
}