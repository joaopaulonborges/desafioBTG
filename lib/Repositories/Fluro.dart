import 'package:desafiobtg/View/VwMoedas.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class Fluro {
  static FluroRouter router = FluroRouter();

  static Handler vwMoedasHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => VwMoedas());

  static void setupRouter() {
    router.define('/VwMoedas', handler: vwMoedasHandler, transitionType: TransitionType.fadeIn);
  }
}