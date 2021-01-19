import 'package:desafiobtg/Util/Cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackspaceTeclado extends StatelessWidget {
  const BackspaceTeclado({
    Key key,
    this.onBackspace,
    this.flex = 1,
  }) : super(key: key);
  final VoidCallback onBackspace;
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
                onBackspace?.call();
              },
              child: Container(
                child: Center(
                  child: Icon(Icons.backspace),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}