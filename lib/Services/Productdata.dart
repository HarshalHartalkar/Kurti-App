import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proj1/Models/CartData.dart';

Future<List<CardData>> fetchData() async {
  var url = Uri.parse(
      "https://api.kutir.store/api/v1/admin/productsBycategories/Women%E2%80%99s%20Wear");
  var response = await http.get(url);
  var jsonData = await json.decode(response.body);
  List<CardData> productList = [];

  for (var element in jsonData['data']) {
    CardData cardData = CardData.fromJson(json: element);
    productList.add(cardData);
    print('$element');
  }
  // print('Response Status: ${response.statusCode}');
  // print('body: ${jsonData['data']}');
  return productList;
}
