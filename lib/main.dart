import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';


main() => runApp(_PerguntaApp());

class _PerguntaAppState extends State<_PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual é a sua cor favorita?",
      'respostas': [
        {'texto': "Preto", 'pontuacao': 10}, 
        {'texto': "Vermelho", 'pontuacao': 10}, 
        {'texto': "Verde", 'pontuacao': 10 }, 
        {'texto': "Branco", 'pontuacao': 10}
      ],
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': [
        {'texto': "Coelho", 'pontuacao': 7}, 
        {'texto': "Gato", 'pontuacao': 10}, 
        {'texto': "Cachorro", 'pontuacao': 9 }, 
        {'texto': "Tartaruga", 'pontuacao': 8}
      ],
    },
    {
      'texto': "Qual é o seu gênero de música favorito?",
      'respostas': [
        {'texto': "Rock", 'pontuacao': 10}, 
        {'texto': "Pop", 'pontuacao': 8}, 
        {'texto': "Clássica", 'pontuacao': 10 }, 
        {'texto': "Sertanejo", 'pontuacao': 2}
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    // print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
          backgroundColor: Color.fromRGBO(19, 152, 1, 1),
        ),
        body: temPerguntaSelecionada 
        ? Questionario(perguntas: _perguntas,
          perguntaSelecionada: _perguntaSelecionada, 
          quandoResponder: _responder
          ) 
        : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
        backgroundColor: Color.fromRGBO(21, 22, 21, 1),
      ),
    );
  }
}

class _PerguntaApp extends StatefulWidget{
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}