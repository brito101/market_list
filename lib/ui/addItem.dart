// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:market_list/models/Item.dart';

class AddItem extends StatelessWidget {
  final itemC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Item'),
      content: TextField(
        autocorrect: true,
        controller: itemC,
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final item = Item(title: itemC.value.text);
            itemC.clear();
            Navigator.of(context).pop(item);
          },
          child: Text('Adicionar'),
        )
      ],
    );
  }
}
