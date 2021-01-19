import 'package:desafiobtg/Util/Cores.dart';
import 'package:flutter/material.dart';

class Sombra extends StatelessWidget {
  final Widget child;
  final double arredondamento;
  const Sombra({Key key, this.child, this.arredondamento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(this.arredondamento)),
        boxShadow: [
          BoxShadow(
            color: Cores.sombra,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(1, 4), // changes position of shadow
          ),
        ],
      ),
      child: this.child,
    );
  }
}