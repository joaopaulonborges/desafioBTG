import 'package:desafiobtg/Util/Cores.dart';
import 'package:desafiobtg/Util/TamanhoTela.dart';
import 'package:desafiobtg/View/VwConversao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VwSplash extends StatefulWidget {
  @override
  _VwSplashState createState() => _VwSplashState();
}

class _VwSplashState extends State<VwSplash> {
  @override
  void initState() {
    super.initState();
    loading();
  }

  loading() async {
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VwConversao()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Cores.corFundo,
        child: Center(
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.scaleDown,
            height: TamanhoTela.height(context, 0.35),
            width: TamanhoTela.width(context, 0.45),
          ),
        ),
    );
  }
}


/*
class _VwSplashState extends State<VwSplash> {
  @override
  Widget build(BuildContext context) {
    return telaIntroducao(context);
  }
}

Widget telaIntroducao(BuildContext context) {
  return Stack(
    children: <Widget>[
      SplashScreen(
        routeName: "/",
        backgroundColor: Cores.corFundo,
        seconds: 3,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Cores.corFundo,
            Cores.corFundo,
          ],
        ),
        navigateAfterSeconds: VwConversao(),
        loaderColor: Cores.corFundo,
      ),
      Center(
        child: Image.asset(
          'assets/logo.png',
          fit: BoxFit.scaleDown,
          height: TamanhoTela.height(context, 0.35),
          width: TamanhoTela.width(context, 0.45),
        ),
      ),
    ],
  );
}

 */