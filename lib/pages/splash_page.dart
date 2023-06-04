import 'package:cocktail_fp/pages/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.local_bar,
                  size: 32,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Cocktails',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavBar(),
                            ));
                      },
                      child: const Text('Get Started'))
                ],
              )),
        ],
      ),
    );
  }
}
