import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado( this.pontuacao, this.quandoReiniciarQuestionario,{super.key});
  
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  String get fraseResultado {
    if (pontuacao < 20){
      return 'Você tem um gosto.';
    } else if (pontuacao < 27) {
      return 'Nada incrível, mas ninguém precisa ser!';
    } else if (pontuacao < 30) {
      return 'Impressionante! Você tem bom gosto!';
    } else {
      return 'O dev acha que você tem extremo bom gosto!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
                fraseResultado, 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
            ),
        ),
        SizedBox(height: 100,),
        TextButton(
          onPressed: quandoReiniciarQuestionario, 
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.all(10),
            minimumSize: Size(200, 50),
          ),
          child: Text(
            'Reiniciar',
            style: 
              TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
    );
  }
}