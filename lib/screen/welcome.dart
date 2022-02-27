import 'package:flutter/material.dart';
import 'package:quran/screen/home.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // returning the half of the screen height
    double halfScreenHeight = MediaQuery.of(context).size.height * 0.5;
    // returning the half of the screen width
    double halfScreenWidth = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          NavigateToHome(
            halfScreenHeight: halfScreenHeight,
            halfScreenWidth: halfScreenWidth,
          ),
          const Introduction(),
        ],
      ),
    );
  }
}

class Introduction extends StatelessWidget {
  const Introduction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.75,
          left: 5.0,
          right: 5.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Text(
          """
القرآن الكريم هو شرف عظيم ومنزلة عالية لمن يحافظ عليه ويحفظه، فلابد للجميع التعاون والتنافس لحفظ كتاب الله، لكي يكون عونًا لنا جميعًا وظلًا يوم القيامة، وشفيعًا له
""",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.justify,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}

class NavigateToHome extends StatelessWidget {
  const NavigateToHome({
    Key? key,
    required this.halfScreenHeight,
    required this.halfScreenWidth,
  }) : super(key: key);

  final double halfScreenHeight;
  final double halfScreenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: halfScreenHeight, left: halfScreenWidth),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white, // white as border color
            width: 2,
          ),
        ),
        child: OutlinedButton(
          child: const Center(
            child: Text(
              "اهلا بكم",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MyHomePage();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.asset("images/b1.jpg", fit: BoxFit.cover),
    );
  }
}
