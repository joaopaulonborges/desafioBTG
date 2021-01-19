// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Moeda.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Moeda on MoedaBase, Store {
  final _$codigoAtom = Atom(name: 'MoedaBase.codigo');

  @override
  String get codigo {
    _$codigoAtom.reportRead();
    return super.codigo;
  }

  @override
  set codigo(String value) {
    _$codigoAtom.reportWrite(value, super.codigo, () {
      super.codigo = value;
    });
  }

  final _$descricaoAtom = Atom(name: 'MoedaBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$favoritoAtom = Atom(name: 'MoedaBase.favorito');

  @override
  bool get favorito {
    _$favoritoAtom.reportRead();
    return super.favorito;
  }

  @override
  set favorito(bool value) {
    _$favoritoAtom.reportWrite(value, super.favorito, () {
      super.favorito = value;
    });
  }

  final _$MoedaBaseActionController = ActionController(name: 'MoedaBase');

  @override
  dynamic setCodigo(String value) {
    final _$actionInfo =
        _$MoedaBaseActionController.startAction(name: 'MoedaBase.setCodigo');
    try {
      return super.setCodigo(value);
    } finally {
      _$MoedaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricao(String value) {
    final _$actionInfo =
        _$MoedaBaseActionController.startAction(name: 'MoedaBase.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$MoedaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFavorito(bool value) {
    final _$actionInfo =
        _$MoedaBaseActionController.startAction(name: 'MoedaBase.setFavorito');
    try {
      return super.setFavorito(value);
    } finally {
      _$MoedaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
codigo: ${codigo},
descricao: ${descricao},
favorito: ${favorito}
    ''';
  }
}
