import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimal_currency_ui_design/currency_list.dart';
import 'package:flutter_minimal_currency_ui_design/currency_service.dart';
import 'package:flutter_minimal_currency_ui_design/red_input.dart';
import 'package:flutter_minimal_currency_ui_design/white_input.dart';

class DashboardPage extends StatefulWidget {
  final currencyVal;
  final convertedCurrency;
  final currencyOne;
  final currencyTwo;
  final isWhite;

  DashboardPage({
    this.currencyVal,
    this.convertedCurrency,
    this.currencyOne,
    this.currencyTwo,
    this.isWhite,
  });

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEC5759),
          ),
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => CurrencyList()));
                    },
                    child: Text(
                      CurrencyService().getCurrencyString(widget.currencyOne),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => InputRedPage(
                                origCurrency: widget.currencyOne,
                                convCurrency: widget.currencyTwo,
                              )));
                    },
                    child: Text(
                      widget.currencyVal.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 120,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                  Text(
                    widget.currencyOne,
                    style: TextStyle(
                      color: Color(0xFFFFB6B6),
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 75),
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(65.5),
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFFEC5759),
                        style: BorderStyle.solid,
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: widget.isWhite
                          ? Icon(
                              Icons.arrow_upward,
                              size: 60,
                              color: Color(0xFFEC5759),
                            )
                          : Icon(
                              Icons.arrow_downward,
                              size: 60,
                              color: Color(0xFFEC5759),
                            ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.currencyTwo,
                    style: TextStyle(
                      color: Color(0xFFFFB6B6),
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => InputWhitePage(
                              origCurrency: widget.currencyOne,
                              convCurrency: widget.currencyTwo,
                            ),
                      ));
                    },
                    child: Text(
                      widget.convertedCurrency.toString(),
                      style: TextStyle(
                        color: Color(0xFFEC5759),
                        fontSize: 120,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    CurrencyService().getCurrencyString(widget.currencyTwo),
                    style: TextStyle(
                      color: Color(0xFFEC5759),
                      fontSize: 22,
                      fontFamily: 'Quicksand',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
