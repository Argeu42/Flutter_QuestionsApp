import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  final String texto;
  final void Function() quandoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(19, 152, 1, 1),
        ),
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}