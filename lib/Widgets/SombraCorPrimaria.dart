import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SombraCorPrimaria extends StatelessWidget {
  final Widget child;
  final double arredondamento;
  const SombraCorPrimaria({Key key, this.child, this.arredondamento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(this.arredondamento)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.16),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: this.child,
    );
  }
}