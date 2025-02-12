import 'dart:convert';
import 'dart:io';

import 'package:bloc_examples/model/postmodel.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  Future<List<postmodel>> fetchpost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;

        return body
            .map((e) => postmodel.fromJson(e))
            .toList(); //loops through each item in body list and convert each json obj into postmodel obj
      }
      throw Exception('failed to fetch data');
    } on SocketException {
      throw Exception('failed to fetch data');
    }
  }
}
