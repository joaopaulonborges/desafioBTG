import 'package:desafiobtg/Util/TamanhoFontes.dart';
import 'package:desafiobtg/Util/TamanhoWidgets.dart';
import 'package:desafiobtg/Widgets/SombraBotao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BotaoGrande extends StatelessWidget {
  final String texto;
  final Function acao;
  final Color cor;
  final bool padding;

  const BotaoGrande({Key key, this.texto, this.acao, this.cor, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: this.padding == true ? 15.0 : 0.0),
      child: SombraBotao(
        arredondamento: 6.0,
        child: Container(
          width: TamanhoWidgets.botoesLargura(context),
          height: TamanhoWidgets.botoesAltura(context),
          constraints: BoxConstraints(maxHeight: 45),
          child: FlatButton(
            color: this.cor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            disabledColor: this.cor.withOpacity(0.5),
            child: Text(
              this.texto,
              style: TextStyle(
                color: Colors.white,
                fontSize: TamanhoFontes.pequena(context),
              ),
            ),
            onPressed: this.acao,
          ),
        ),
      ),
    );
  }
}