import 'package:conversor_moedas/src/components/future_builder_components.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conversor de Moedas',
        ),
        centerTitle: true,
      ),
      body: FutureBuilderComponents(),
    );
  }
}
