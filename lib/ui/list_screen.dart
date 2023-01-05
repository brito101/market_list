// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> items = ['Teste'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market List'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.blueGrey),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: Icon(Icons.done),
              ),
            ),
            title: Text(
              items[index],
              style: TextStyle(color: Colors.blueGrey),
            ),
          );
        },
      ),
    );
  }
}
