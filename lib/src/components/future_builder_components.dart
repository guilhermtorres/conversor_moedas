import 'package:conversor_moedas/src/utils/api_financeira.dart';
import 'package:flutter/material.dart';

class FutureBuilderComponents extends StatefulWidget {
  @override
  _FutureBuilderComponentsState createState() => _FutureBuilderComponentsState();
}

class _FutureBuilderComponentsState extends State<FutureBuilderComponents> {
  double dolar;

  double euro;

  double bitcoin;

  final realController = TextEditingController();

  final dolarController = TextEditingController();

  final euroController = TextEditingController();

  final bitcoinController = TextEditingController();

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
    bitcoinController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(10);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
    bitcoinController.text = (dolar * this.dolar / bitcoin).toStringAsFixed(10);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
    bitcoinController.text = (euro * this.euro / bitcoin).toStringAsFixed(10);
  }

  void _bitcoinChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double bitcoin = double.parse(text);
    realController.text = (bitcoin * this.bitcoin).toStringAsFixed(2);
    dolarController.text = (bitcoin * this.bitcoin / dolar).toStringAsFixed(2);
    euroController.text = (bitcoin * this.bitcoin / euro).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Text(
                'Carregando Dados...',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                ),
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Erro ao carregar dados...',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                  ),
                ),
              );
            } else {
              dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
              euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
              bitcoin = snapshot.data["results"]["currencies"]["BTC"]["buy"];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/icon_currency.png',
                      height: 100,
                      width: 100,
                      alignment: Alignment.topCenter,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        onChanged: _realChanged,
                        controller: realController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                          hoverColor: Colors.white,
                          labelText: ' Reais',
                          border: OutlineInputBorder(),
                          prefixText: 'R\$',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        onChanged: _dolarChanged,
                        controller: dolarController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                          hoverColor: Colors.white,
                          labelText: ' Dollar',
                          border: OutlineInputBorder(),
                          prefixText: 'U\$',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        onChanged: _euroChanged,
                        controller: euroController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                          hoverColor: Colors.white,
                          labelText: ' Euro',
                          border: OutlineInputBorder(),
                          prefixText: '€\$',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        onChanged: _bitcoinChanged,
                        controller: bitcoinController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                          hoverColor: Colors.white,
                          labelText: ' BitCoin',
                          border: OutlineInputBorder(),
                          prefixText: '฿\$',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: _clearAll,
                            child: Text(
                              'Limpar Tudo',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
