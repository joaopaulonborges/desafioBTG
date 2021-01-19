import 'package:desafiobtg/Util/Cores.dart';
import 'package:desafiobtg/Util/TamanhoFontes.dart';
import 'package:desafiobtg/Widgets/SombraCorPrimaria.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputComLabel extends StatefulWidget {
  final String label;
  final String placeholder;
  final IconData icone;
  final double tamanhoIcone;
  final String textoErro;
  final Function alterarTexto;
  final bool habilitarInput;
  final bool senha;
  final bool iconeSenha;
  final bool readOnly;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextEditingController controller;
  const InputComLabel({Key key, this.label, this.placeholder, this.icone, this.tamanhoIcone, this.textoErro, this.alterarTexto, this.habilitarInput, this.senha, this.controller, this.iconeSenha, this.readOnly, this.focusNode, this.textInputType}) : super(key: key);

  @override
  _InputComLabelState createState() => _InputComLabelState();
}

class _InputComLabelState extends State<InputComLabel> {
  bool focado = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SombraCorPrimaria(
            arredondamento: 6.0,
            child: TextField(
              keyboardType: this.widget.textInputType,
              showCursor: true,
              readOnly: this.widget.readOnly,
              autofocus: false,
              focusNode: this.widget.focusNode,
              textInputAction: TextInputAction.done,
              controller: this.widget.controller ?? null,
              enabled: this.widget.habilitarInput,
              style: TextStyle(fontSize: TamanhoFontes.pequena(context)),
              onChanged: (value) => this.widget.alterarTexto(value),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.0),
                labelText: this.widget.label ?? null,
                labelStyle: TextStyle(
                  fontSize: TamanhoFontes.pequena(context),
                  height: focado ? 0.5 : null,
                  fontWeight: focado ? FontWeight.w500 : FontWeight.w400,
                  color: Cores.corPrimaria,
                ),
                prefixIcon: this.widget.icone != null
                    ? Icon(this.widget.icone,
                    color: focado
                        ? Cores.corPrimaria
                        : Cores.corPrimaria,
                    size: this.widget.tamanhoIcone)
                    : null,
                focusedBorder: border(context, 1.0),
                enabledBorder: border(context, 1.0),
                border: border(context, 1.0),
                hintText: this.widget.placeholder ?? null,
                errorStyle: TextStyle(fontSize: TamanhoFontes.micro(context)),
                errorBorder: border(context, 0.5),
                focusedErrorBorder: border(context, 1.0),
                hintStyle: TextStyle(
                  fontSize: TamanhoFontes.pequena(context),
                  fontWeight: FontWeight.w400,
                  color: Cores.corPrimaria,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder border(BuildContext context, double tamanhoBorda) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: tamanhoBorda,
          color: Cores.corPrimaria,
        ),
      );
}