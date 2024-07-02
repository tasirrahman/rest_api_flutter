// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rest_api_flutter/model/post.dart';

class AddTodoInList extends StatefulWidget {
  const AddTodoInList({super.key});

  @override
  State<AddTodoInList> createState() => _AddTodoInListState();
}

class _AddTodoInListState extends State<AddTodoInList> {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();

  void submit() {
    final post = Post(
        title: titleCtrl.text,
        description: descriptionCtrl.text,
        context: context);
    post.submitdata();
  }

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
              controller: titleCtrl,
              decoration: InputDecoration(
                hintText: 'Title',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: descriptionCtrl,
              decoration: InputDecoration(
                hintText: 'Description',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              minLines: 5,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: submit,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
