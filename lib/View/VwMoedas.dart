import 'package:desafiobtg/Controller/ConversaoController.dart';
import 'package:desafiobtg/Util/Cores.dart';
import 'package:desafiobtg/Util/Strings.dart';
import 'package:desafiobtg/Util/TamanhoFontes.dart';
import 'package:desafiobtg/Util/TamanhoTela.dart';
import 'package:desafiobtg/Widgets/CardMoeda.dart';
import 'package:desafiobtg/Widgets/InputComLabel.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class VwMoedas extends StatefulWidget {
  @override
  _VwMoedasState createState() => _VwMoedasState();
}

class _VwMoedasState extends State<VwMoedas> {
  var conversaoController = GetIt.I.get<ConversaoController>();
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    conversaoController.listaMoedasFiltrada = conversaoController.listaMoedasBusca;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
        child: Stack(
          children: [
            Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.tituloListaMoedas,
                    style: TextStyle(
                      fontSize: TamanhoFontes.extraGrande(context),
                      color: Cores.corFontePrimaria,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InputComLabel(
                    textInputType: TextInputType.text,
                    icone: Icons.search,
                    iconeSenha: false,
                    readOnly: false,
                    placeholder: null,
                    label: Strings.tituloPesquisar,
                    tamanhoIcone: 25.0,
                    alterarTexto: (value) {
                      conversaoController.pesquisarMoedaLista(value);
                    },
                    controller: _controller,
                    habilitarInput: true,
                    senha: false,
                    textoErro: null,
                  ),
                  Observer(builder: (_){
                    return Container(
                      height: TamanhoTela.height(context, 0.70),
                      child: DraggableScrollbar.rrect(
                        padding: EdgeInsets.all(0.0),
                        controller: _scrollController,
                        backgroundColor: Cores.corPrimaria,
                        alwaysVisibleScrollThumb: true,
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: false,
                          physics: ScrollPhysics(),
                          itemCount: conversaoController.listaMoedasFiltrada.length,
                          itemBuilder: (context, index) {
                            return CardMoeda(
                              moeda: conversaoController.listaMoedasFiltrada[index],
                              acaoBotaoFavorito: () async{
                                await conversaoController.alterarFavorito(conversaoController.listaMoedasFiltrada[index].codigo);
                                setState(() {});
                              },
                            );
                          },
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}