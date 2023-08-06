class Food {

  String image;
  String name;
  int amount;
  double price;
  int ?discountHour;

  Food({required this.image, required this.name, required this.amount, required this.price, this.discountHour});

}