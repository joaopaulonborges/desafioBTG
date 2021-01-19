import 'package:desafiobtg/Util/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TecladoConfirmar extends StatelessWidget {
  const TecladoConfirmar({
    Key key,
    this.onOk,
    this.flex = 1,
  }) : super(key: key);
  final VoidCallback onOk;
  final int flex;  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Material(
          color: Cores.corFundo,
          child: Container(
            margin: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black45,
                width: 1,
              ),
            ),
            child: InkWell(
              onTap: () {
                onOk?.call();
              },
              child: Container(
                child: Center(
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}