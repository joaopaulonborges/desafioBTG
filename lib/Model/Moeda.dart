import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Moeda.g.dart';

@JsonSerializable()
class Moeda extends MoedaBase with _$Moeda{

  @JsonKey(name: 'codigo')
  @observable
  String codigo;

  @JsonKey(name: 'descricao')
  @observable
  String descricao;

  @JsonKey(name: 'favorito')
  @observable
  bool favorito;

  Moeda(this.codigo, this.descricao, this.favorito) : super(descricao, codigo, favorito);

  factory Moeda.fromJson(dynamic json) {
    return Moeda(json['codigo'].toString(), json['descricao'].toString(), false);
  }

  static Map<String, dynamic> toMap(Moeda moeda) => {
    'codigo': moeda.codigo,
    'descricao': moeda.descricao,
    'favorito': moeda.favorito,
  };

  static String encode(List<Moeda> moedas) => json.encode(moedas.map<Map<String, dynamic>>((moeda) => Moeda.toMap(moeda)).toList());

  static List<Moeda> decode(String musics) => (json.decode(musics) as List<dynamic>).map<Moeda>((item) => Moeda.fromJson(item)).toList();
}

abstract class MoedaBase with Store {

  MoedaBase(this.codigo, this.descricao, this.favorito);

  @observable
  String codigo;

  @observable
  String descricao;

  @observable
  bool favorito;

  @action
  setCodigo(String value) {
    codigo = value;
  }

  @action
  setDescricao(String value) {
    descricao = value;
  }

  @action
  setFavorito(bool value) {
    favorito = value;
  }
}