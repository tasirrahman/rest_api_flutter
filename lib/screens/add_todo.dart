// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rest_api_flutter/model/post.dart';

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
                onPressed: () {
                  final post = Post(
                    title: title_ctrl.text,
                    description: description_ctrl.text,
                    context: context,
                  );
                  post.submitdata();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Submit'),
                ))
          ],
        ),
      ),
    );
  }
}
