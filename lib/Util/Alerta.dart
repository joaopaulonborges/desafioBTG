import 'package:desafiobtg/Util/Cores.dart';
import 'package:desafiobtg/Util/Strings.dart';
import 'package:flutter/material.dart';

class Alerta {
  static exibirAlert(context, {String titulo, String descricao, String textoBotaoCancelar}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text(titulo),
          content: Text(descricao),
          actions: [
            RaisedButton(
              child: Text(Strings.botaoOk, style: TextStyle(color: Colors.white)),
              color: Cores.corPrimaria,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}