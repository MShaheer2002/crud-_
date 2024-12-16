import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:untitled3/modal/ProductModal.dart';

class Api {
  static const baseUrl = "http://13.60.192.252:2000/api/";

  static Addproduct(Map pData) async {
    var url = Uri.parse("${baseUrl}add_product");
    final response = await http.post(url, body: pData);

    try {
      if (response.statusCode == 200) {
        //   if work code here
        var data = jsonDecode(response.body);
        print(data);
      } else {
        //   if not work code here
        print("Failed to load data");
      }
    } catch (e) {
      debugPrint(e.toString());
      print("Aaa");
    }
  }

  static Future<List<Productmodal>> fatchProductData() async {
    List<Productmodal> productList = [];
    var url = Uri.parse("${baseUrl}get_product");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);

      var m = data.map(
        (value) {
          return value;
        },
      ).toList();

      // for (var product in m) {
      //   print(product['pname']);
      // }
      m.forEach(
        (value) {
          final product = Productmodal(
              id: value['_id'],
              ProductName: value['pname'],
              Price: value['pprice'],
              description: value['pdesc']);
          productList.add(product);
        });
      return productList;
    } else {
      return [];
    }
  }

  static UpdatedProduct(id, body) async {
    var url = Uri.parse("${baseUrl}update_product/$id");
    print(url);
    final res = await http.put(url, body: body);

    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Failed");
    }
  }

  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete_product/$id");
    final res = await http.delete(url);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Delete Failed");
    }
  }
}
