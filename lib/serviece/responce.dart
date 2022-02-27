import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:quran/model/verses.dart';

fetchVeses(int numberOfSurah) async {
  final String _url =
      "https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/chapters/$numberOfSurah.json";

  //the response result
  Map<String, dynamic> jsonResponse;

  //the response
  http.Response response;

  //Surah
  List<Verses> verses=[];

  try {
    //here i am sending a request to the "_url"
    response = await http.get(
      Uri.parse(_url),
    );

    if (response.statusCode == 200) {
      //this variable contain all the data that comes from the request,
      //then we parse the data comes from the API
      jsonResponse = convert.jsonDecode(response.body);

      //the parsing of all the data
      SurahVerses surahVerses = SurahVerses.fromJson(jsonResponse);
     verses = surahVerses.verses!;

      return verses;
    } else {
      throw ('Request faild with status: ${response.statusCode}');
    }
  } catch (exeption) {
    throw ("CLASS(Response.dart) ------ FUNCTION(fetchVeses  ---- Exeption($exeption)");
  }
}
