import 'package:flutter/material.dart';
import 'package:food/statics/icons.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../providers/basket_provider.dart';

Widget foodItem(Food food, Color cont, Color tex, BuildContext context, int realTime, [int ?disc, int ?discTime]) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(food.image, width: 300, height: 300),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: cont,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(food.name, style: TextStyle(color: tex, fontSize: 20),),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(
                color: cont,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child:
                    realTime != discTime ? Text(food.price.toString() + '\$', style: TextStyle(color: tex, fontSize: 20),) :
                    Column(
                      children: [
                        Text(food.price.toString() + '\$', style: TextStyle(color: tex, fontSize: 15, decoration: TextDecoration.lineThrough),),
                        Text((food.price * ((100 - disc!) / 100)).toString() + '\$', style: TextStyle(color: tex, fontSize: 20),),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(UsedIcons.add, color: tex,),
                    onPressed: () {
                      var basketProvider = Provider.of<BasketProvider>(context, listen: false);
                      double myFoodPrice = food.price;
                      realTime == discTime ? myFoodPrice = (food.price * ((100 - disc!) / 100)) : null;
                      basketProvider.addFood(Food(image: food.image, name: food.name, amount: food.amount, price: myFoodPrice));
                      basketProvider.addTotal(Food(image: food.image, name: food.name, amount: food.amount, price: myFoodPrice));
                    },
                  )
                ],
              ),
            )
          ],
        )
      ]
  );
}