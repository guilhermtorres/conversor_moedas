import 'package:flutter/material.dart';

class ConversorMoedasComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/images/icon_currency.png',
            height: 200,
            width: 200,
            alignment: Alignment.topCenter,
          ),
          TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Reais',
              fillColor: Theme.of(context).primaryColor,
              enabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
