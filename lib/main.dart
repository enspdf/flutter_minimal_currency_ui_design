import 'package:flutter/material.dart';
import 'package:flutter_minimal_currency_ui_design/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardPage(
        currencyVal: 0.0,
        convertedCurrency: 0.0,
        currencyOne: 'USD',
        currencyTwo: 'RUB',
        isWhite: false,
      ),
    );
  }
}
