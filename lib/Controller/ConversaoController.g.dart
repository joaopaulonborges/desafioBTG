// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConversaoController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConversaoController on ConversaoControllerBase, Store {
  Computed<bool> _$validarLoadingConversaoComputed;

  @override
  bool get validarLoadingConversao => (_$validarLoadingConversaoComputed ??=
          Computed<bool>(() => super.validarLoadingConversao,
              name: 'ConversaoControllerBase.validarLoadingConversao'))
      .value;

  final _$listaMoedasAtom = Atom(name: 'ConversaoControllerBase.listaMoedas');

  @override
  ObservableList<Moeda> get listaMoedas {
    _$listaMoedasAtom.reportRead();
    return super.listaMoedas;
  }

  @override
  set listaMoedas(ObservableList<Moeda> value) {
    _$listaMoedasAtom.reportWrite(value, super.listaMoedas, () {
      super.listaMoedas = value;
    });
  }

  final _$listaMoedasBuscaAtom =
      Atom(name: 'ConversaoControllerBase.listaMoedasBusca');

  @override
  List<Moeda> get listaMoedasBusca {
    _$listaMoedasBuscaAtom.reportRead();
    return super.listaMoedasBusca;
  }

  @override
  set listaMoedasBusca(List<Moeda> value) {
    _$listaMoedasBuscaAtom.reportWrite(value, super.listaMoedasBusca, () {
      super.listaMoedasBusca = value;
    });
  }

  final _$listaMoedasFiltradaAtom =
      Atom(name: 'ConversaoControllerBase.listaMoedasFiltrada');

  @override
  List<Moeda> get listaMoedasFiltrada {
    _$listaMoedasFiltradaAtom.reportRead();
    return super.listaMoedasFiltrada;
  }

  @override
  set listaMoedasFiltrada(List<Moeda> value) {
    _$listaMoedasFiltradaAtom.reportWrite(value, super.listaMoedasFiltrada, () {
      super.listaMoedasFiltrada = value;
    });
  }

  final _$moedaOrigemAtom = Atom(name: 'ConversaoControllerBase.moedaOrigem');

  @override
  Moeda get moedaOrigem {
    _$moedaOrigemAtom.reportRead();
    return super.moedaOrigem;
  }

  @override
  set moedaOrigem(Moeda value) {
    _$moedaOrigemAtom.reportWrite(value, super.moedaOrigem, () {
      super.moedaOrigem = value;
    });
  }

  final _$moedaDestinoAtom = Atom(name: 'ConversaoControllerBase.moedaDestino');

  @override
  Moeda get moedaDestino {
    _$moedaDestinoAtom.reportRead();
    return super.moedaDestino;
  }

  @override
  set moedaDestino(Moeda value) {
    _$moedaDestinoAtom.reportWrite(value, super.moedaDestino, () {
      super.moedaDestino = value;
    });
  }

  final _$valorInicialConversaoAtom =
      Atom(name: 'ConversaoControllerBase.valorInicialConversao');

  @override
  String get valorInicialConversao {
    _$valorInicialConversaoAtom.reportRead();
    return super.valorInicialConversao;
  }

  @override
  set valorInicialConversao(String value) {
    _$valorInicialConversaoAtom.reportWrite(value, super.valorInicialConversao,
        () {
      super.valorInicialConversao = value;
    });
  }

  final _$valorFinalConversaoAtom =
      Atom(name: 'ConversaoControllerBase.valorFinalConversao');

  @override
  String get valorFinalConversao {
    _$valorFinalConversaoAtom.reportRead();
    return super.valorFinalConversao;
  }

  @override
  set valorFinalConversao(String value) {
    _$valorFinalConversaoAtom.reportWrite(value, super.valorFinalConversao, () {
      super.valorFinalConversao = value;
    });
  }

  final _$tituloAlertaAtom = Atom(name: 'ConversaoControllerBase.tituloAlerta');

  @override
  String get tituloAlerta {
    _$tituloAlertaAtom.reportRead();
    return super.tituloAlerta;
  }

  @override
  set tituloAlerta(String value) {
    _$tituloAlertaAtom.reportWrite(value, super.tituloAlerta, () {
      super.tituloAlerta = value;
    });
  }

  final _$textoAlertaAtom = Atom(name: 'ConversaoControllerBase.textoAlerta');

  @override
  String get textoAlerta {
    _$textoAlertaAtom.reportRead();
    return super.textoAlerta;
  }

  @override
  set textoAlerta(String value) {
    _$textoAlertaAtom.reportWrite(value, super.textoAlerta, () {
      super.textoAlerta = value;
    });
  }

  final _$codigofavoritoAtom =
      Atom(name: 'ConversaoControllerBase.codigofavorito');

  @override
  String get codigofavorito {
    _$codigofavoritoAtom.reportRead();
    return super.codigofavorito;
  }

  @override
  set codigofavorito(String value) {
    _$codigofavoritoAtom.reportWrite(value, super.codigofavorito, () {
      super.codigofavorito = value;
    });
  }

  final _$loadingConversaoAtom =
      Atom(name: 'ConversaoControllerBase.loadingConversao');

  @override
  bool get loadingConversao {
    _$loadingConversaoAtom.reportRead();
    return super.loadingConversao;
  }

  @override
  set loadingConversao(bool value) {
    _$loadingConversaoAtom.reportWrite(value, super.loadingConversao, () {
      super.loadingConversao = value;
    });
  }

  final _$ConversaoControllerBaseActionController =
      ActionController(name: 'ConversaoControllerBase');

  @override
  dynamic alterarMoedaOrigem(Moeda value) {
    final _$actionInfo = _$ConversaoControllerBaseActionController.startAction(
        name: 'ConversaoControllerBase.alterarMoedaOrigem');
    try {
      return super.alterarMoedaOrigem(value);
    } finally {
      _$ConversaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterarMoedaDestino(Moeda value) {
    final _$actionInfo = _$ConversaoControllerBaseActionController.startAction(
        name: 'ConversaoControllerBase.alterarMoedaDestino');
    try {
      return super.alterarMoedaDestino(value);
    } finally {
      _$ConversaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterarValorConversao(String value) {
    final _$actionInfo = _$ConversaoControllerBaseActionController.startAction(
        name: 'ConversaoControllerBase.alterarValorConversao');
    try {
      return super.alterarValorConversao(value);
    } finally {
      _$ConversaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterarValorFinal(String value) {
    final _$actionInfo = _$ConversaoControllerBaseActionController.startAction(
        name: 'ConversaoControllerBase.alterarValorFinal');
    try {
      return super.alterarValorFinal(value);
    } finally {
      _$ConversaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterarLoadingConversao(bool value) {
    final _$actionInfo = _$ConversaoControllerBaseActionController.startAction(
        name: 'ConversaoControllerBase.alterarLoadingConversao');
    try {
      return super.alterarLoadingConversao(value);
    } finally {
      _$ConversaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pesquisarMoedaLista(String pesquisa) {
    final _$actionInfo = _$ConversaoControllerBaseActionController.startAction(
        name: 'ConversaoControllerBase.pesquisarMoedaLista');
    try {
      return super.pesquisarMoedaLista(pesquisa);
    } finally {
      _$ConversaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaMoedas: ${listaMoedas},
listaMoedasBusca: ${listaMoedasBusca},
listaMoedasFiltrada: ${listaMoedasFiltrada},
moedaOrigem: ${moedaOrigem},
moedaDestino: ${moedaDestino},
valorInicialConversao: ${valorInicialConversao},
valorFinalConversao: ${valorFinalConversao},
tituloAlerta: ${tituloAlerta},
textoAlerta: ${textoAlerta},
codigofavorito: ${codigofavorito},
loadingConversao: ${loadingConversao},
validarLoadingConversao: ${validarLoadingConversao}
    ''';
  }
}
