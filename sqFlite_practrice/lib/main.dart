import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MaterialApp(home: HomePage(),));


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sqflite Example'),),
      body: RaisedButton(
        onPressed: (){

        },
      )
    );
  }
}
