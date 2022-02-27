import 'package:flutter/material.dart';
import 'package:quran/widgets/appbar.dart';

class Result extends StatefulWidget {
  final String verses;
  final String title;
  
 const Result({Key? key, required this.verses, required this.title})
      : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // the dafult value of the font
  double customFont = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "سورة " + widget.title),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
               const Padding(
                  padding:  EdgeInsets.only(bottom: 10.0),
                  child:  Text(
                    "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ ",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  widget.verses,
                  style: TextStyle(fontSize: customFont),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (customFont < 20) {
                setState(() {
                  customFont = customFont + 2;
                });
              }
            },
            child: const Text("+"),
            heroTag: "Increment",
            mini: true,
            backgroundColor: Colors.blueGrey[700],
          ),
          FloatingActionButton(
            onPressed: () {
              if (customFont > 12) {
                setState(() {
                  customFont = customFont-2;
                });
              }
            },
            child: const Text("-"),
            heroTag: "Dncrement",
            mini: true,backgroundColor: Colors.blueGrey[700],
          ),
        ],
      ),
    );
  }
}
