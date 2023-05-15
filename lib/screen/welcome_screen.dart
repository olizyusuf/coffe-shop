import 'package:coffeshop/screen/widget/size_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = SizeScreen();
    size.mediaQuerySize(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: size.widthScreen,
          height: size.heightScreen,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 109, 89, 47),
            image: DecorationImage(
              opacity: 0.2,
              image: AssetImage('assets/images/coffe-bean-unsplash-resize.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Logo(size: size),
              NameShop(size: size),
              const Slogan(),
              GetStartedButton(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class Slogan extends StatelessWidget {
  const Slogan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: const Text(
          'How do you like your coffe?',
          style: TextStyle(color: Colors.white, fontFamily: 'poppins-regular'),
        ));
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final SizeScreen size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.widthScreen / 2,
      height: size.heightScreen / 12,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 109, 89, 47),
          elevation: 5,
          shadowColor: Colors.transparent.withOpacity(0.1),
          side: const BorderSide(
            width: 2,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text(
            'Get Started  ',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
            size: 20,
          )
        ]),
      ),
    );
  }
}

class NameShop extends StatelessWidget {
  const NameShop({
    Key? key,
    required this.size,
  }) : super(key: key);

  final SizeScreen size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: size.heightScreen / 3,
      child: const Text(
        'Coffe Shop',
        style: TextStyle(
            fontSize: 30, fontFamily: 'poppins-bold', color: Colors.white),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final SizeScreen size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      height: size.heightScreen / 4,
      child: Image.asset('assets/images/coffeecup.png'),
    );
  }
}
