import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_sozler_2/model/quotes_model.dart';
import 'package:http/http.dart' as http;

class QuotesService {
  final String url = "https://quotable.io/quotes?tags=love";

  Future<QuotesModel?> fetchQuotes() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBody = QuotesModel.fromJson(jsonDecode(res.body));
      debugPrint(res.statusCode.toString());
      return jsonBody;
    } else {
      print("İstek başarısız");
    }
  }
}
