import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget{
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo>{

  var _maquina = 0;
  var _jogador = 0;

  var _resultadoImagem = "imagens/padrao.png";
  List _resultado = [
    "Aguardando Sua Escolha",
    "Você Perdeu",
    "Você Ganhou",
    "Você empatou com a maquina"
  ];
  var _nResultado=0;


  List _imagens=[
    "imagens/pedra.png",
    "imagens/papel.png",
    "imagens/tesoura.png"
  ];


  void _jogou(int valor){
    _maquina = Random().nextInt(3);
    _jogador = valor;

    setState(() {
      _resultadoImagem = _imagens[_maquina];

      if(_maquina == _jogador){
        _nResultado = 3;
      }else if(_maquina == _jogador+1 || _maquina+2==_jogador){
        _nResultado = 1;
      }else{
        _nResultado = 2;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('JoKenPo'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top:32,bottom:16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Image.asset(_resultadoImagem,height: 110),

          Padding(
            padding: EdgeInsets.only(top:32,bottom:0),
            child: Text(
              _resultado[_nResultado],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top:32,bottom:16),
            child: Text(
              "Escolha uma opção abaixo",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: (){_jogou(0);},
                  child: Image.asset(_imagens[0],height: 95,),
              ),
              GestureDetector(
                onTap: (){_jogou(1);},
                child: Image.asset(_imagens[1],height: 95,),
              ),
              GestureDetector(
                onTap: (){_jogou(2);},
                child: Image.asset(_imagens[2],height: 95,),
              ),

            ],
          )

        ],
      ),
    );
  }
}