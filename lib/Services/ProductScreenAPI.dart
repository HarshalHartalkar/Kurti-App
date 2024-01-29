import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proj1/Models/ProductPageData.dart';

Future<ProductPageData> fetchProductData(String productId) async {
  var url = Uri.parse(
      "https://api.kutir.store/api/v1/admin/productsById/${productId}");
  var response = await http.get(url);
  var jsonData = await json.decode(response.body);
  var element = jsonData['data'][0];

  ProductPageData pageData = ProductPageData.fromJson(json: element);

  print('Response Status: ${response.statusCode}');
  print('body: ${jsonData['data']}');
  return pageData;
}
