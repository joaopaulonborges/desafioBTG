import 'package:desafiobtg/Util/Cores.dart';
import 'package:desafiobtg/Util/TamanhoTela.dart';
import 'package:flutter/material.dart';

class LoadingMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.corFundo,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: TamanhoTela.height(context, 0.85),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}