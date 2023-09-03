import 'package:flutter/material.dart';
import 'package:food/providers/basket_provider.dart';
import 'package:food/providers/menuProvider.dart';
import 'package:food/providers/payment_provider.dart';
import 'package:food/statics/colors.dart';
import 'package:food/statics/icons.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../methods/Restaurant.dart';
import 'Basket.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  void initState() {
    super.initState();
    var menuProvider = Provider.of<MenuProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (DateTime.now().hour == 19) menuProvider.familyBannerOn();
      if (DateTime.now().hour >= 2 && DateTime.now().hour <= 5) menuProvider.nightBannerOn();
      if (DateTime.now().day == 11 && DateTime.now().month == 2 && DateTime.now().hour < 3 && DateTime.now().hour > 5) menuProvider.bahmanBannerOn();
    });
    print('${DateTime.now().hour}');
  }

  @override
  Widget build(BuildContext context) {
    var dt = DateTime.now();
    return(
      Scaffold(
        appBar: AppBar(
          title: Text('FatFood Premium👍', style: TextStyle(color: Colors.black),),
          backgroundColor: SpecialColors.cyan,
          leading: Consumer<BasketProvider>(
            builder: (context, basketProvider, child) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    icon: Icon(UsedIcons.basket, color: Colors.black,),
                    onPressed: () {
                      if(basketProvider.foodList.isNotEmpty) Navigator.of(context).push(MaterialPageRoute(builder: (context) => Basket()));
                      else {
                        const snackBar = SnackBar(content: Text('Your basket is empty!', style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center,), backgroundColor: SpecialColors.cyan,);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  ),
                  if(basketProvider.foodList.isNotEmpty) Text(basketProvider.foodList.length.toString(), style: TextStyle(color: Colors.black),)
                  else Text('❌', style: TextStyle(color: Colors.black),)
                ],
              );
            }
          ),
        ),
        body: SafeArea(
          child: Consumer<MenuProvider>(
            builder: (context, menuProvider, child) {
              return Column(
                children: [
                  if(menuProvider.bahman == true)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.green, Colors.white, Colors.red])
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(flex: 1, child: Text('۲۲ بهمن مبارک', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                                Expanded(flex: 2, child: Text('ما ملت دلاوریم، پیرو امر رهبریم', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                              ],
                            ),
                            Countdown(
                              seconds: 86400 - ((dt.minute * 60) + dt.second),
                              build: (BuildContext context, double time){
                                var duration = Duration(seconds: time.toInt());
                                var hour = duration.inHours % 24;
                                var min = duration.inMinutes % 60;
                                var sec = duration.inSeconds % 60;
                                return Container(
                                  decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('${hour.toString()} : ', style: TextStyle(fontSize: 20),),
                                        Text('${min.toString()} : ', style: TextStyle(fontSize: 20),),
                                        Text('${sec.toString()}', style: TextStyle(fontSize: 20),),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              onFinished: () {
                                menuProvider.bahmanBannerOff();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  if(menuProvider.night == true)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.blueAccent])
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          children: [
                            Text('Night rush', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            Countdown(
                              seconds: 10800 - ((dt.minute * 60) + dt.second),
                              build: (BuildContext context, double time){
                                var duration = Duration(seconds: time.toInt());
                                var hour = duration.inHours % 24;
                                var min = duration.inMinutes % 60;
                                var sec = duration.inSeconds % 60;
                                return Container(
                                  decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('${hour.toString()} : ', style: TextStyle(fontSize: 20),),
                                        Text('${min.toString()} : ', style: TextStyle(fontSize: 20),),
                                        Text('${sec.toString()}', style: TextStyle(fontSize: 20),),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              onFinished: () {
                                menuProvider.nightBannerOff();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  if(menuProvider.family == true)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.yellowAccent, Colors.orange,])
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(flex: 1, child: Text('Family dinner', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                                Expanded(flex: 2, child: Text('20% off family meals', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                              ],
                            ),
                            Countdown(
                            seconds: 3600 - ((dt.minute * 60) + dt.second),
                            build: (BuildContext context, double time){
                              var duration = Duration(seconds: time.toInt());
                              var hour = duration.inHours % 24;
                              var min = duration.inMinutes % 60;
                              var sec = duration.inSeconds % 60;
                              return Container(
                                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('${hour.toString()} : ', style: TextStyle(fontSize: 20),),
                                      Text('${min.toString()} : ', style: TextStyle(fontSize: 20),),
                                      Text('${sec.toString()}', style: TextStyle(fontSize: 20),),
                                    ],
                                  ),
                                ),
                              );
                            },
                            onFinished: () {
                              menuProvider.familyBannerOff();
                            },
                            )
                          ],
                        ),
                      ),
                    ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Restaurant(logo: 'Assets/Images/KFC.png', cont: Colors.red, tex: Colors.white, hour: dt.hour, images: ['Assets/Images/five.png', 'Assets/Images/twister.png', 'Assets/Images/burger.png', 'Assets/Images/tender.png', 'Assets/Images/bucket.png'], names: ['Five piece wings', 'Twister', 'Dynamite burger', 'Five piece chicken tenders', 'Fifteen piece bucket'], prices: [6, 3, 5, 5, 20], discounts: [0, 0, 0, 0, 20], discTimes: [100, 100, 100, 100, 19],),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
                            child: Divider(color: Colors.black, thickness: 5,),
                          ),
                          Restaurant(logo: 'Assets/Images/mcdonalds.png', cont: Color(0xFFF5BF2F), tex: Color(0xFFCE3527), hour: dt.hour, images: ['Assets/Images/mac.png', 'Assets/Images/chMac.png', 'Assets/Images/nuggets.png', 'Assets/Images/spicy.png', 'Assets/Images/double.png'], names: ['Big Mac', 'Chicken Big Mac', 'chicken McNuggets', 'Spicy McChicken', 'Double Quarter Pounder'], prices: [5.50, 5.50, 4.50, 5, 7],),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('bye bye');
    Provider.of<PaymentProvider>(context,listen: false).controllerDispose();
  }
}