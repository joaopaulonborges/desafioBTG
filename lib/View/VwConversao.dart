import 'package:desafiobtg/Controller/ConversaoController.dart';
import 'package:desafiobtg/Model/Moeda.dart';
import 'package:desafiobtg/Util/Cores.dart';
import 'package:desafiobtg/Util/Strings.dart';
import 'package:desafiobtg/Util/TamanhoFontes.dart';
import 'package:desafiobtg/Util/TamanhoTela.dart';
import 'package:desafiobtg/Util/TamanhoWidgets.dart';
import 'package:desafiobtg/Widgets/BotaoGrande.dart';
import 'package:desafiobtg/Widgets/ComponenteTeclado.dart';
import 'package:desafiobtg/Widgets/InputBorda.dart';
import 'package:desafiobtg/Widgets/InputComLabel.dart';
import 'package:desafiobtg/Widgets/LoadingMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class VwConversao extends StatefulWidget {
  @override
  _VwConversaoState createState() => _VwConversaoState();
}

class _VwConversaoState extends State<VwConversao> {
  var conversaoController = GetIt.I.get<ConversaoController>();
  TextEditingController _controller = TextEditingController();
  OverlayEntry _overlayEntry;
  FocusNode _focusNode = FocusNode();

  Future carregarMoedas() async {
    await conversaoController.recuperarMoedas(context);
    return true;
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context).insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      _controller.text = newText;
      _controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    if (textSelection.start == 0) {
      return;
    }

    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(newStart, newEnd, '');
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        builder: (context) => Positioned(
          bottom: 0,
          left: offset.dx,
          width: size.width,
          child: Material(
            elevation: 4.0,
            child: ComponenteTeclado(
              onTextInput: (myText) {
                _insertText(myText);
              },
              onBackspace: () {
                _backspace();
              },
              onOk: () {
                _focusNode.unfocus();
              },
            ),
          ),
        )
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: carregarMoedas(),
        builder: (context, snapshot){
          return snapshot.hasData
            ? WillPopScope(
            onWillPop: () {
              if(_focusNode.hasFocus){
                _focusNode.unfocus();
                return new Future.value(false);
              }
              else{
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                return new Future.value(true);
              }
            },
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Scaffold(
                backgroundColor: Cores.corFundo,
                body: SingleChildScrollView(
                  child: Container(
                    height: TamanhoTela.height(context, 1.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Strings.tituloApp,
                            style: TextStyle(
                              fontSize: TamanhoFontes.extraGrande(context),
                              color: Cores.corFontePrimaria,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          InputComLabel(
                            textInputType: TextInputType.number,
                            controller: _controller,
                            focusNode: _focusNode,
                            readOnly: true,
                            icone: Icons.monetization_on,
                            placeholder: null,
                            label: Strings.inputValor,
                            senha: false,
                            iconeSenha: false,
                            tamanhoIcone: 20,
                            alterarTexto: (value) {},
                            habilitarInput: true,
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Observer(builder: (_){
                            return InputBorda(
                              widget: DropdownButton<Moeda>(
                                value: conversaoController.moedaOrigem,
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 24,
                                elevation: 16,
                                isExpanded: true,
                                style: TextStyle(color: Cores.corPrimaria),
                                underline: SizedBox(),
                                onChanged: (Moeda value) {
                                  conversaoController.alterarMoedaOrigem(value);
                                },
                                items: conversaoController.listaMoedas.map((Moeda value) {
                                  return DropdownMenuItem<Moeda>(
                                    value: value,
                                    child:  SizedBox(
                                      width: TamanhoTela.width(context, 0.75),
                                      child: Text(value.codigo+" - "+value.descricao, style: TextStyle(fontSize: TamanhoFontes.media(context), color: Cores.corFontePrimaria), overflow: TextOverflow.ellipsis, maxLines: 1),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          }),
                          SizedBox(
                            height: 10.0,
                          ),
                          Icon(
                            Icons.compare_arrows,
                            color: Cores.corPrimaria,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Observer(builder: (_){
                            return InputBorda(
                              widget: DropdownButton<Moeda>(
                                value: conversaoController.moedaDestino,
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 24,
                                elevation: 16,
                                isExpanded: true,
                                style: TextStyle(color: Cores.corPrimaria),
                                underline: SizedBox(),
                                onChanged: (Moeda value) {
                                  conversaoController.alterarMoedaDestino(value);
                                },
                                items: conversaoController.listaMoedas.map((Moeda value) {
                                  return DropdownMenuItem<Moeda>(
                                    value: value,
                                    child:  SizedBox(
                                      width: TamanhoTela.width(context, 0.75),
                                      child: Text(value.codigo+" - "+value.descricao, style: TextStyle(fontSize: TamanhoFontes.media(context), color: Cores.corFontePrimaria), overflow: TextOverflow.ellipsis, maxLines: 1),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          }),
                          SizedBox(
                            height: 30.0,
                          ),
                          Observer(builder: (_){
                            return !conversaoController.validarLoadingConversao
                                ? BotaoGrande(
                              padding: true,
                              cor: Cores.corPrimaria,
                              texto: Strings.botaoConverter,
                              acao: () {
                                conversaoController.alterarValorConversao(_controller.text.replaceAll(',', '.'));
                                conversaoController.fazerConversaoDeMoeda(context);
                              },
                            )
                                : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 7.5),
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 60),
                                height: TamanhoWidgets.botoesAltura(context),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 5,
                                  ),
                                ),
                              ),
                            );
                          }),
                          BotaoGrande(
                            padding: true,
                            cor: Cores.corPrimaria,
                            texto: Strings.botaoMoedas,
                            acao: () {
                              Navigator.pushNamed(context, '/VwMoedas');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          )
          : LoadingMenu();
        }
    );
  }
}