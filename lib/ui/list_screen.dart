// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:market_list/models/Item.dart';
import 'package:market_list/ui/addItem.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market List'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(color: Colors.blueGrey),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: Icon(item.isDone ? Icons.done_all : Icons.done),
                  ),
                ),
                title: Text(
                  item.title,
                  style: TextStyle(color: Colors.blueGrey),
                ),
                onTap: () {
                  setState(() {
                    items[index].isDone = !items[index].isDone;
                  });
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItem() async {
    final item = await showDialog<Item>(
        context: context,
        builder: (BuildContext context) {
          return AddItem();
        });
    setState(() {
      items.add(item!);
    });
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      items.sort((a, b) {
        if (a.isDone && !b.isDone) {
          return 1;
        } else if (!a.isDone && b.isDone) {
          return -1;
        } else {
          return 0;
        }
      });
    });
    return Future.value();
  }
}
