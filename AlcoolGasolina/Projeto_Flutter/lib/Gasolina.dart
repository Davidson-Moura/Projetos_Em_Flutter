import 'package:flutter/material.dart';

class Gasolina extends StatefulWidget{
  @override
  _GasolinaState createState() => _GasolinaState();
}

class _GasolinaState extends State<Gasolina>{

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  var _resultado = "";

  void _calcular(){
    try{
      double _gasolina = double.parse(_controllerGasolina.text.replaceAll(',', '.'));
      double _alcool = double.parse(_controllerAlcool.text.replaceAll(',', '.'));

      if(_alcool/_gasolina >= 0.7){
        _resultado = "É melhor abastecer com gasolina.";
      }else{
        _resultado = "É melhor abastecer com álcool.";
      }
      setState(() {
        _resultado = _resultado;
      });
      _limparCampos();
    }catch(Exception) {
      setState(() {
        _resultado = "Número Inválido";
      });
    }
  }

  void _limparCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Gasolina/Álcool"),
        backgroundColor: Colors.blueGrey
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "imagens/logo.png",
              ),

              Padding(
                padding: EdgeInsets.only(top:12,bottom:12),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 20 ,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),


              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool"
                ),
                controller: _controllerAlcool,
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina"
                ),
                controller: _controllerGasolina,
              ),

              ElevatedButton(
                  onPressed: _calcular,
                  child: Text("Calcular")
              ),

              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
      )
    );
  }
}