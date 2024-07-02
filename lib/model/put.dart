// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Put {
  final String title;
  late String id;
  final String description;
  final BuildContext context;

  Put(
      {required this.title,
      required this.id,
      required this.description,
      required this.context});

  Future<void> updatedata() async {
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final headers = {
      "Content-Type": "application/json",
    };
    final response =
        await http.put(uri, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
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
