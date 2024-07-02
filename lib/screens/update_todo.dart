// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:rest_api_flutter/model/put.dart';

class UpdateTodoInList extends StatefulWidget {
  final String title;
  final String description;
  final String id;

  UpdateTodoInList({
    Key? key,
    required this.title,
    required this.description,
    required this.id,
  }) : super(key: key);

  @override
  _UpdateTodoInListState createState() => _UpdateTodoInListState();
}

class _UpdateTodoInListState extends State<UpdateTodoInList> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _updateTodo() {
    final put = Put(
      title: titleController.text,
      id: widget.id,
      description: descriptionController.text,
      context: context,
    );
    put.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Todo Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: descriptionController,
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
              onPressed: _updateTodo,
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
