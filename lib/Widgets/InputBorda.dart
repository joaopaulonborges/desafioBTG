import 'package:desafiobtg/Util/Cores.dart';
import 'package:desafiobtg/Util/TamanhoTela.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputBorda extends StatefulWidget {
  final Widget widget;

  const InputBorda({Key key, this.widget}) : super(key: key);

  @override
  _InputBordaState createState() => _InputBordaState();
}

class _InputBordaState extends State<InputBorda> {
  bool focado = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: TamanhoTela.width(context, 0.92),
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            color: Cores.corPrimaria,
            width: 1,
          ),
          color: Colors.white,
        ),
        child: this.widget.widget,
      ),
    );
  }
}