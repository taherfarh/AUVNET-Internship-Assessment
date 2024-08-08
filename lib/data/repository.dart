import 'dart:convert';
// ignore: unused_import
import 'dart:math';

import 'package:final_app/data/model.dart';
import 'package:http/http.dart' as http;

class userrepository {
  getdata() async {
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.parse("https://fakestoreapi.com/products"));
      List decodedResponse = jsonDecode(response.body);

      return decodedResponse.map((e) => Userdata.fromJson(e) );
    } finally {
      client.close();
    }
  }
}
