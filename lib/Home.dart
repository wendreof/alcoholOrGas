import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcohol = TextEditingController();
  TextEditingController _controllerGas = TextEditingController();
  String _textResult = "";

  void _calcular() {
    double alcoholPrice = double.tryParse(_controllerAlcohol.text);
    double gasPrice = double.tryParse(_controllerGas.text);

    if (alcoholPrice == null || gasPrice == null) {
      //print("Número inválido, digite números maiores que 0 e utilize (.)");
      setState(() {
        _textResult =
            ("Número inválido, digite números maiores que 0 e utilize (.)");
      });
    } else {
      if (alcoholPrice / gasPrice >= 0.7) {
        setState(() {
          _textResult = "Melhor abastecer com gasolina!";
        });
      } else {
        setState(() {
          _textResult = "Melhor abastecer com álcool!";
        });
      }
      _clearFields();
    }
  }

  void _clearFields() {
    _controllerGas.text = "";
    _controllerAlcohol.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png")),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecer seu carro.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Álcool, ex: 1.59"),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcohol),
            TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina ex: 3.59"),
                style: TextStyle(fontSize: 22),
                controller: _controllerGas),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _calcular),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _textResult,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
