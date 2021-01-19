import 'package:desafiobtg/Widgets/BackspaceTeclado.dart';
import 'package:desafiobtg/Widgets/TecladoConfirmar.dart';
import 'package:desafiobtg/Widgets/TecladoNumerico.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponenteTeclado extends StatelessWidget {
  ComponenteTeclado({
    Key key,
    this.onTextInput,
    this.onBackspace,
    this.onOk,
  }) : super(key: key);
  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback onOk;
  void _textInputHandler(String text) => onTextInput?.call(text);
  void _backspaceHandler() => onBackspace?.call();
  void _onOkHandler() => onOk?.call();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: Colors.white,
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour(),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TecladoNumerico(
            text: '1',
            onTextInput: _textInputHandler,
          ),
          TecladoNumerico(
            text: '2',
            onTextInput: _textInputHandler,
          ),
          TecladoNumerico(
            text: '3',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TecladoNumerico(
            text: '4',
            onTextInput: _textInputHandler,
          ),
          TecladoNumerico(
            text: '5',
            onTextInput: _textInputHandler,
          ),
          TecladoNumerico(
            text: '6',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TecladoNumerico(
            text: '7',
            onTextInput: _textInputHandler,
          ),
          TecladoNumerico(
            text: '8',
            onTextInput: _textInputHandler,
          ),
          TecladoNumerico(
            text: '9',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          TecladoConfirmar(
            onOk: _onOkHandler,
          ),
          TecladoNumerico(
            text: ',',
            onTextInput: _textInputHandler,
          ),
          TecladoNumerico(
            text: '0',
            onTextInput: _textInputHandler,
          ),
          BackspaceTeclado(
            onBackspace: _backspaceHandler,
          ),
        ],
      ),
    );
  }
}