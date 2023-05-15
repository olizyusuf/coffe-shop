import 'package:coffeshop/model/menus.dart';
import 'package:coffeshop/provider/coffe_provider.dart';
import 'package:coffeshop/screen/widget/size_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final SizeScreen size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: size.heightScreen,
        width: size.widthScreen,
        child: Column(
          children: [
            const Text(
              'Which coffee do you like?',
              style: TextStyle(fontFamily: 'Poppins-bold', fontSize: 20),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    var data = menus[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Image(
                            height: 35,
                            image: AssetImage(data['image']),
                          ),
                          title: Text(data['name']),
                          subtitle: Text(data['price'].toString()),
                          trailing: IconButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, '/order',
                              //     arguments: {
                              //       'name': data['name'],
                              //       'price': data['price'],
                              //       'qty': data['qty'],
                              //       'size': data['size'],
                              //       'image': data['image'],
                              //     });
                              Provider.of<CoffeProvider>(context, listen: false)
                                  .selectOrder(data['name'], data['price'],
                                      data['size'], data['image']);
                              Navigator.pushNamed(context, '/order');
                            },
                            icon: Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}
