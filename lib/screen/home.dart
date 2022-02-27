import 'package:flutter/material.dart';
import 'package:quran/json/surah_json.dart';
import 'package:quran/model/surah.dart';
import 'package:quran/model/verses.dart';
import 'package:quran/screen/result.dart';
import 'package:quran/serviece/responce.dart';
import 'package:quran/widgets/appbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "القران الكريم"),
      body: const ElementsOfBody(),
    );
  }
}

class ElementsOfBody extends StatefulWidget {
  const ElementsOfBody({Key? key}) : super(key: key);

  @override
  State<ElementsOfBody> createState() => _ElementsOfBodyState();
}

class _ElementsOfBodyState extends State<ElementsOfBody> {
  // The list of the quran swars
  List<Surah> allSwars = loadingAllSurah();
  String meccan = "مكية";
  String medinan = "مدنية";
  List<Verses> verses = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: ListView.builder(
          itemCount: allSwars.length,
          itemBuilder: (context, value) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 15.0),
                        child: Center(
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text("(${value + 1}"),
                              const SizedBox(width: 10.0),
                              Text("سورة " + allSwars[value].name.toString()),
                              const SizedBox(width: 15.0),
                              Text(allSwars[value].type == "meccan"
                                  ? meccan
                                  : medinan),
                              const SizedBox(width: 10.0),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("عدد اياتها"),
                                    Text("${allSwars[value].totalVerses}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      verses = await fetchVeses(value + 1);
                      String string = convertingVersesToSingleString(verses);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(
                            verses: string,
                            title: allSwars[value].name.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


String convertingVersesToSingleString(List<Verses> verses) {
  List<String> listOfString = [];

  for (int x = 0; x < verses.length; x++) {
    listOfString.add(verses[x].text!);
  }

  String singleString = listOfString.join(" * ");
  return singleString;
}
