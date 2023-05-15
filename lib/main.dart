import 'package:coffeshop/provider/coffe_provider.dart';
import 'package:coffeshop/screen/home_screen.dart';
import 'package:coffeshop/screen/order_screen.dart';
import 'package:coffeshop/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CoffeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'poppins-regular'),
        title: 'Coffe Shop',
        home: const WelcomeScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/order': (context) => const OrderScreen(),
        },
      ),
    );
  }
}
