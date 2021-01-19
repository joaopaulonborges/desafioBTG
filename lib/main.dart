import 'package:desafiobtg/Controller/ConversaoController.dart';
import 'package:desafiobtg/Repositories/Fluro.dart';
import 'package:desafiobtg/Util/Cores.dart';
import 'package:desafiobtg/View/VwSplash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get_it/get_it.dart';

final ThemeData tema = ThemeData(primaryColor: Cores.corPrimaria, accentColor: Cores.corAccet, fontFamily: 'Poppins');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Fluro.setupRouter();
  FlutterStatusbarcolor.setStatusBarColor(Cores.corFundo);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<ConversaoController>(ConversaoController());
  runApp(
    MaterialApp(
      color: Cores.corFundo,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      home: VwSplash(),
      theme: tema,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Fluro.router.generator,
    ),
  );
}