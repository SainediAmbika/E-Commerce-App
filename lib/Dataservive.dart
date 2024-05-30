import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Model.dart';

class GetService {
  List<Eachproduct> list = [];
//   final String getUrl = 'https://dummyjson.com/products';

//   Future<List<ProductsModel>> getApiData() async {
//     try {
//       var response = await http.get(Uri.parse(getUrl));
//       if (response.statusCode == 200) {
//         var jsonData = jsonDecode(response.body);
//         return list = jsonData.map((e) => ProductsModel.fromJson(e)).toList();
//       } else {
//         return <ProductsModel>[];
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
  Future<List<Eachproduct>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      //  for (Map<String, dynamic> index in data) {
      //       list.add(ProductsModel.fromJson(index));
      //     }
      var list1 = (ProductsModel.fromJson(data));
      print(list.toString());
      return list;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load products');
    }
  }
}
