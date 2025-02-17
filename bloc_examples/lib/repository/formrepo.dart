import 'dart:convert';

import 'package:bloc_examples/model/formmodel.dart';
import 'package:http/http.dart' as http;

class Formrepo {
  Future<void> postdata(String name, String email) async {
    try {
      //below is for normal posting without use of model class
      // final response = await http
      //     .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
      //   'title': titlecontr.text,
      //   'body': bodycontr.text,
      // });

      Formmodel user = Formmodel(name: name, email: email);
      final response = await http.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          headers: {
            'Content-Type': 'application/json', // Ensure JSON format
          },
          body: jsonEncode(user.toJson()));
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
