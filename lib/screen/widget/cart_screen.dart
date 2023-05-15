import 'package:coffeshop/provider/coffe_provider.dart';
import 'package:coffeshop/screen/widget/size_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final SizeScreen size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.heightScreen,
      width: size.widthScreen,
      child: Center(
        child: Consumer<CoffeProvider>(
          builder: (context, value, child) {
            num total = 0;
            for (var e in value.cartItems) {
              total += e.price * e.qty;
            }
            return value.cartItems.isNotEmpty
                ? Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            value.clearCartItems();
                          },
                          icon: const Icon(Icons.clear)),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: ListView.builder(
                            itemCount: value.cartItems.length,
                            itemBuilder: (context, index) {
                              var data = value.cartItems[index];
                              return Card(
                                  child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                        backgroundColor: const Color.fromARGB(
                                            255, 228, 188, 132),
                                        foregroundColor: Colors.black,
                                        child: Text(data.qty.toString())),
                                    title: Text('${data.name}, ${data.size}'),
                                    subtitle: Text(data.price.toString()),
                                  ),
                                ],
                              ));
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: 200,
                        height: 80,
                        child: Column(
                          children: [
                            Text(
                              'Total $total',
                              style: const TextStyle(fontSize: 16),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                elevation: 5,
                                shadowColor: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.7),
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
                                      'Payment',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins-bold'),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 50,
                          child: Image.asset('assets/images/empty.png')),
                      const Text('Your cart is empty...'),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
