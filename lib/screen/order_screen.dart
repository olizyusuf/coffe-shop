import 'package:coffeshop/provider/coffe_provider.dart';
import 'package:coffeshop/screen/widget/size_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = SizeScreen();
    size.mediaQuerySize(context);

    // var passData = ModalRoute.of(context)!.settings.arguments as Map;
    CoffeProvider passData = Provider.of<CoffeProvider>(context, listen: false);

    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
          child: Container(
            height: size.heightScreen,
            color: const Color.fromARGB(250, 109, 89, 47),
            child: Column(
              children: [
                Container(
                  height: size.heightScreen * 0.45,
                  width: size.widthScreen,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(30),
                        child: Image(
                            height: 170,
                            image: AssetImage(passData.orderData[0].image)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  passData.orderData[0].name.toString(),
                  style: const TextStyle(
                      fontFamily: 'Poppins-bold',
                      fontSize: 28,
                      color: Colors.white),
                ),
                Text(
                  passData.orderData[0].price.toString(),
                  style: TextStyle(
                      fontFamily: 'Poppins-bold',
                      fontSize: 18,
                      color: Colors.grey[300]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<CoffeProvider>(
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            value.changeSize('S');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: value.sizeCup == 'S'
                                ? const Color.fromARGB(255, 175, 170, 158)
                                : const Color.fromARGB(255, 109, 89, 47),
                            elevation: 5,
                            shadowColor: Colors.transparent.withOpacity(0.3),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Text('S')]),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            value.changeSize('M');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: value.sizeCup == 'M'
                                ? const Color.fromARGB(255, 175, 170, 158)
                                : const Color.fromARGB(255, 109, 89, 47),
                            elevation: 5,
                            shadowColor: Colors.transparent.withOpacity(0.3),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Text('M')]),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            value.changeSize('L');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: value.sizeCup == 'L'
                                ? const Color.fromARGB(255, 175, 170, 158)
                                : const Color.fromARGB(255, 109, 89, 47),
                            elevation: 5,
                            shadowColor: Colors.transparent.withOpacity(0.3),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Text('L')]),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        passData.adjustQty('-');
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    Consumer<CoffeProvider>(
                      builder: (context, value, child) {
                        return SizedBox(
                          width: 20,
                          child: Text(
                            passData.qty.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins-bold',
                                fontSize: 18),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        passData.adjustQty('+');
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      passData.addCart(
                          passData.orderData[0].name,
                          passData.orderData[0].price,
                          passData.qty,
                          passData.sizeCup,
                          passData.orderData[0].image);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 5,
                      shadowColor:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Add',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
