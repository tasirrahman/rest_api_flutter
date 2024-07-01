// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AddTodoInList extends StatefulWidget {
  const AddTodoInList({super.key});

  @override
  State<AddTodoInList> createState() => _AddTodoInListState();
}

class _AddTodoInListState extends State<AddTodoInList> {
  TextEditingController title_ctrl = TextEditingController();
  TextEditingController description_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: title_ctrl,
              decoration: InputDecoration(
                  hintText: 'Title',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: description_ctrl,
              decoration: InputDecoration(
                  hintText: 'Description',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              minLines: 5,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: submitdata,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Submit'),
                ))
          ],
        ),
      ),
    );
  }

  submitdata() async {
    final title = title_ctrl.text;
    final description = description_ctrl.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };
    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final headers = {
      "Content-Type": "application/json",
    };
    final response =
        await http.post(uri, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Request was successful!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Request failed. Please try again.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
