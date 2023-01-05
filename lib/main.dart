// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:market_list/ui/list_screen.dart';

void main() => runApp(MarketList());

class MarketList extends StatelessWidget {
  const MarketList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market List',
      home: ListScreen(),
    );
  }
}
