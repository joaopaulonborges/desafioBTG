import 'package:desafiobtg/Model/Moeda.dart';
import 'package:desafiobtg/Util/Cores.dart';
import 'package:desafiobtg/Util/TamanhoFontes.dart';
import 'package:desafiobtg/Widgets/Sombra.dart';
import 'package:flutter/material.dart';

class CardMoeda extends StatelessWidget {
  final Moeda moeda;
  final Function acaoBotaoFavorito;
  const CardMoeda({Key key, this.moeda, this.acaoBotaoFavorito}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Sombra(
          arredondamento: 8.0,
          child: FlatButton(
            onPressed: null,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Cores.corPrimaria,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        child: Text(
                          this.moeda.codigo,
                          maxLines: 2,
                          style: TextStyle(fontSize: TamanhoFontes.pequena(context), fontWeight: FontWeight.w400, color: Cores.corPrimaria),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      this.moeda.descricao,
                      maxLines: 1,
                      style: TextStyle(fontSize: TamanhoFontes.pequena(context), fontWeight: FontWeight.w400, color: Cores.corFontePrimaria),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: this.acaoBotaoFavorito,
                        child: Icon(
                          this.moeda.favorito ? Icons.favorite : Icons.favorite_border,
                          color: this.moeda.favorito ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}