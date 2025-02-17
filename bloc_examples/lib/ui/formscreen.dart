import 'dart:convert';

import 'package:bloc_examples/model/formmodel.dart';
import 'package:bloc_examples/repository/formrepo.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Formscreen extends StatefulWidget {
  const Formscreen({super.key});

  @override
  State<Formscreen> createState() => _FormscreenState();
}

class _FormscreenState extends State<Formscreen> {
  TextEditingController titlecontr = TextEditingController();
  TextEditingController bodycontr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Form Screen'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: titlecontr,
                decoration: InputDecoration(
                    hintText: 'Title',
                    labelText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                    )))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: bodycontr,
                decoration: InputDecoration(
                    hintText: 'Body',
                    labelText: 'Body',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                    )))),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Formrepo().postdata(titlecontr.text, bodycontr.text);
              },
              child: Container(
                height: 50,
                width: 150,
                child: Center(child: Text('Submit')),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
