import 'package:flutter/material.dart';
import '../models/food.dart';
import 'foodItem.dart';

class Restaurant extends StatelessWidget {

  final String logo;
  final Color cont;
  final Color tex;
  final int hour;
  final List <String> images;
  final List <String> names;
  final List <int> ?discounts;
  final List <int> ?discTimes;
  final List <double> prices;

  const Restaurant({super.key, required this.logo, required this.cont, required this.tex, required this.hour, required this.images, required this.names, required this.prices, this.discounts, this.discTimes});

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
            children: index(context),
          ),
        )
      ],
    );
  }
  List<Widget> index(BuildContext context) {
    var widgets = <Widget> [];
    for (int j = 0; j < images.length.toInt(); j++) {
      widgets.add(SizedBox(width: 25));
      widgets.add(foodItem(Food(image: images[j], name: names[j], amount: 1, price: prices[j]), cont, tex, context, hour, discounts?[j], discTimes?[j]),);
    }
    widgets.add(SizedBox(width: 25));
    return widgets;
  }
}