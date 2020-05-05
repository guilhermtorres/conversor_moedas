import 'package:conversor_moedas/src/components/conversor_moedas_components.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conversor de Moedas',
        ),
        centerTitle: true,
      ),
      body: ConversorMoedasComponents(),
    );
  }
}
