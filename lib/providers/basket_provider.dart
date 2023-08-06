import 'package:flutter/material.dart';
import '../models/food.dart';

class BasketProvider extends ChangeNotifier {

  List<Food> foodList = [];

  double total = 0;

  bool augh = false;

  bool bahman = false;

  bool night = false;

  void bahmanFalse() {
    this.bahman = false;
    notifyListeners();
  }

  void bahmanTrue() {
    this.bahman = true;
    notifyListeners();
  }

  void nightFalse() {
    this.night = false;
    notifyListeners();
  }

  void nightTrue() {
    this.night = true;
    notifyListeners();
  }

  void disFalse() {
    this.augh = false;
    notifyListeners();
  }

  void disTrue() {
    this.augh = true;
    notifyListeners();
  }

  void addTotal(Food food) {
    if (this.augh == true) {
      this.total += ((food.price / 5) * 4);
      this.total.round();
    }
    else {
      this.total += food.price;
      this.total.round();
    }
    notifyListeners();
  }

  void subTotal(Food food) {
    if (this.augh == true) {
      this.total -= ((food.price / 5) * 4);
      this.total.round();
    }
    else {
      this.total -= food.price;
      this.total.round();
    }
    notifyListeners();
  }

  void delTotal(Food food) {
    if (this.augh == true) {
      this.total -= (((food.price * food.amount) / 5) * 4);
      this.total.round();
    }
    else {
      this.total -= food.price * food.amount;
      this.total.round();
    }
    notifyListeners();
  }

  void setTotal(double total) {
    this.total = total;
    notifyListeners();
  }

  void addFood(Food food) {
    int index = foodList.indexWhere((foodItem) => foodItem == food);
    if (index.isNegative) {
      foodList.add(food);
      notifyListeners();
    }
    else {
      foodList[index].amount++;
      notifyListeners();
    }
  }

  void subFood(Food food) {
    if(foodList.isNotEmpty) {
      foodList.remove(food);
      notifyListeners();
    }
  }

  void updateAdd(Food food) {
    int index = foodList.indexWhere((foodItem) => foodItem == food);
    foodList[index].amount++;
    notifyListeners();
  }


  void updateSub(Food food) {
    int index = foodList.indexWhere((foodItem) => foodItem == food);
    int result = --foodList[index].amount;
    if(result < 1) {
      food.amount = 1;
        subFood(food);
    }
    notifyListeners();
  }

  void updateDel(Food food) {
    foodList.remove(food);
    notifyListeners();
  }

  void delFood() {
    foodList.clear();
    notifyListeners();
  }

}