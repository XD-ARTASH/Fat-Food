import 'package:flutter/material.dart';
import 'package:food/providers/basket_provider.dart';
import 'package:food/providers/menuProvider.dart';
import 'package:food/providers/payment_provider.dart';
import 'package:food/scaffolds/Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ListenableProvider.value(value: BasketProvider()),
    ListenableProvider.value(value: PaymentProvider()),
    ListenableProvider.value(value: MenuProvider()),
  ],
  child: Screen()));
}