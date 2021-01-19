import 'dart:convert';
import 'package:desafiobtg/Model/Moeda.dart';
import 'package:desafiobtg/Util/Alerta.dart';
import 'package:desafiobtg/Util/Api.dart';
import 'package:desafiobtg/Util/Parametros.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
part 'ConversaoController.g.dart';

class ConversaoController = ConversaoControllerBase with _$ConversaoController;

abstract class ConversaoControllerBase with Store {
  @observable
  ObservableList<Moeda> listaMoedas = new List<Moeda>().asObservable();

  @observable
  List<Moeda> listaMoedasBusca = new List<Moeda>();

  @observable
  List<Moeda> listaMoedasFiltrada = new List<Moeda>();

  @observable
  Moeda moedaOrigem = null;

  @observable
  Moeda moedaDestino = null;

  @observable
  String valorInicialConversao = "";

  @observable
  String valorFinalConversao = "";

  @observable
  String tituloAlerta = "";

  @observable
  String textoAlerta = "";

  @observable
  String codigofavorito = "";

  @observable
  bool loadingConversao = false;

  @action
  alterarMoedaOrigem(Moeda value) {
    moedaOrigem = value;
  }

  @action
  alterarMoedaDestino(Moeda value) {
    moedaDestino = value;
  }

  @action
  alterarValorConversao(String value) {
    valorInicialConversao = value;
  }

  @action
  alterarValorFinal(String value) {
    valorFinalConversao = value;
  }

  @action
  alterarLoadingConversao(bool value) {
    loadingConversao = value;
  }

  @action
  pesquisarMoedaLista(String pesquisa) {
    List<Moeda> lista = new List<Moeda>();
    if (pesquisa != "") {
      for (var i in listaMoedasBusca) {
        if (i.codigo.contains(pesquisa) || i.codigo.contains(pesquisa.toUpperCase())) {
          lista.add(i);
        }
      }
      listaMoedasFiltrada = lista;
    }
    else {
      listaMoedasFiltrada = listaMoedasBusca;
    }
  }

  @computed
  bool get validarLoadingConversao {
    return loadingConversao;
  }

  adicionarMoedaLista(Moeda value) {
    listaMoedas.add(value);
  }

  adicionarMoedaListaPesquisa(Moeda value) {
    listaMoedasBusca.add(value);
  }

  alterarTituloAlerta(String value){
    tituloAlerta = value;
  }

  alterarTextoAlerta(String value){
    textoAlerta = value;
  }

  alterarFavorito(String codigo) async{
    for(var i=0;i<listaMoedasBusca.length;i++){
      if(listaMoedasBusca[i].codigo == codigo){
        listaMoedasBusca[i].favorito = !listaMoedasBusca[i].favorito;
        if(listaMoedasBusca[i].favorito){
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("favorito", listaMoedasBusca[i].codigo);
          if(codigofavorito != ""){
            for(var j=0;j<listaMoedasBusca.length;j++){
              if (listaMoedasBusca[j].codigo == codigofavorito){
                listaMoedasBusca[j].favorito = !listaMoedasBusca[j].favorito;
                break;
              }
            }
          }
          codigofavorito = codigo;
        }
        else{
          codigofavorito = "";
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("favorito", null);
        }
        break;
      }
    }
  }

  recuperarMoedas(BuildContext context) async{
    listaMoedas = new List<Moeda>().asObservable();
    listaMoedasBusca = new List<Moeda>();
    try{
      Api api = new Api();
      final resposta = await http.get(api.urlRecuperarMoedas()).timeout(const Duration(seconds: Parametros.timeoutConexaoApi));
      var resultadoRecuperarMoedas = json.decode(resposta.body);
      if (resultadoRecuperarMoedas['success']) {
        Map<dynamic, dynamic> lista = resultadoRecuperarMoedas['currencies'];
        lista.forEach((key, value) {
          adicionarMoedaLista(new Moeda(key.toString(), value.toString(), false));
          listaMoedasBusca.add(new Moeda(key.toString(), value.toString(), false));
        });
        Comparator<Moeda> ordenacaoMoedas = (a, b) => a.codigo.compareTo(b.codigo);
        listaMoedas.sort(ordenacaoMoedas);
        if(listaMoedas.length>=2){
          moedaOrigem = listaMoedas[0];
          moedaDestino = listaMoedas[1];
          final prefs = await SharedPreferences.getInstance();
          String codigoMoedaFavorita = await prefs.getString("favorito");
          if(codigoMoedaFavorita != null){
            for(var i=0;i<listaMoedas.length;i++){
              if(codigoMoedaFavorita == listaMoedas[i].codigo){
                listaMoedas[i].favorito = true;
                listaMoedasBusca[i].favorito = true;
                moedaOrigem = listaMoedas[i];
                codigofavorito = listaMoedas[i].codigo;
                break;
              }
            }
          }
          await prefs.setString("listaMoedas", Moeda.encode(listaMoedas));
        }
      }
      else{
        final prefs = await SharedPreferences.getInstance();
        String lista = await prefs.getString("listaMoedas");
        String codigoMoedaFavorita = await prefs.getString("favorito");
        if(lista != null){
          var listaDecode = json.decode(lista);
          Map<dynamic, dynamic> mapa = listaDecode;
          mapa.forEach((key, value) {
            adicionarMoedaLista(new Moeda(value['codigo'].toString(), value['descricao'].toString(), false));
            adicionarMoedaListaPesquisa(new Moeda(value['codigo'].toString(), value['descricao'].toString(), false));
          });
          if(listaMoedas.length>=2) {
            moedaOrigem = listaMoedas[0];
            moedaDestino = listaMoedas[1];
          }
          listaMoedasFiltrada = listaMoedasBusca;
          if(codigoMoedaFavorita != null){
            for(var i=0;i<listaMoedas.length;i++){
              if(codigoMoedaFavorita == listaMoedas[i].codigo){
                listaMoedas[i].favorito = true;
                listaMoedasBusca[i].favorito = true;
                moedaOrigem = listaMoedas[i];
                codigofavorito = listaMoedas[i].codigo;
                break;
              }
            }
          }
          String mensagemErro = "Utilizaremos a última sessão armazenada no aplicativo";
          retornarMensagemErro(context, "Falha ao recuperar moedas", mensagemErro);
        }
        else{
          String mensagemErro = retornarDescricaoErroApi(resultadoRecuperarMoedas['error']['code']);
          retornarMensagemErro(context, "Falha ao recuperar moedas", mensagemErro);
        }
      }
    }
    catch(erro){
      final prefs = await SharedPreferences.getInstance();
      String lista = await prefs.getString("listaMoedas");
      String codigoMoedaFavorita = await prefs.getString("favorito");
      if(lista != null){
        var listaDecode = Moeda.decode(lista);
        for(var i in listaDecode){
          adicionarMoedaLista(new Moeda(i.codigo, i.descricao, i.favorito));
          adicionarMoedaListaPesquisa(new Moeda(i.codigo, i.descricao, i.favorito));
        }
        if(listaMoedas.length>=2) {
          moedaOrigem = listaMoedas[0];
          moedaDestino = listaMoedas[1];
        }
        listaMoedasFiltrada = listaMoedasBusca;
        if(codigoMoedaFavorita != null){
          for(var i=0;i<listaMoedas.length;i++){
            if(codigoMoedaFavorita == listaMoedas[i].codigo){
              listaMoedas[i].favorito = true;
              listaMoedasBusca[i].favorito = true;
              moedaOrigem = listaMoedas[i];
              codigofavorito = listaMoedas[i].codigo;
              break;
            }
          }
        }
        String mensagemErro = "Utilizaremos a última sessão armazenada no aplicativo";
        retornarMensagemErro(context, "Falha ao recuperar moedas", mensagemErro);
      }
      else{
        alterarLoadingConversao(false);
        String mensagemErro = retornarDescricaoErroGeral(erro.toString());
        retornarMensagemErro(context, "Falha ao recuperar moedas", mensagemErro);
      }
    }
  }

  fazerConversaoDeMoeda(BuildContext context) async{
    alterarLoadingConversao(true);
    try{
      Api api = new Api();
      double valorMoedaOrigemUSD = 0.0;
      double valorMoedaDestinoUSD = 0.0;
      final respostaMoedaOrigem = await http.get(api.urlConverterMoeda(moedaOrigem.codigo)).timeout(const Duration(seconds: Parametros.timeoutConexaoApi));
      var resultadoRecuperarMoedaOrigem = json.decode(respostaMoedaOrigem.body);
      if (resultadoRecuperarMoedaOrigem['success']) {
        Map<dynamic, dynamic> lista = resultadoRecuperarMoedaOrigem['quotes'];
        lista.forEach((key, value) {
          valorMoedaOrigemUSD = double.parse(value.toString());
        });
        final respostaMoedaDestino = await http.get(api.urlConverterMoeda(moedaDestino.codigo)).timeout(const Duration(seconds: Parametros.timeoutConexaoApi));
        var resultadoRecuperarMoedaDestino = json.decode(respostaMoedaDestino.body);
        if (resultadoRecuperarMoedaDestino['success']) {
          Map<dynamic, dynamic> lista2 = resultadoRecuperarMoedaDestino['quotes'];
          lista2.forEach((key, value) {
            valorMoedaDestinoUSD = double.parse(value.toString());
          });
          try{
            alterarValorFinal(((valorMoedaDestinoUSD/valorMoedaOrigemUSD)*double.parse(valorInicialConversao)).toStringAsFixed(2));
            Alerta.exibirAlert(context,
              titulo: "Conversão de "+moedaOrigem.codigo+" para "+moedaDestino.codigo,
              descricao: "Resultado: "+valorFinalConversao.replaceAll('.', ','),
            );
            alterarLoadingConversao(false);
          }
          catch(erro){
            alterarLoadingConversao(false);
            String erro = "O valor informado é inválido";
            retornarMensagemErro(context, "Falha ao converter moedas", erro);
          }
        }
        else{
          alterarLoadingConversao(false);
          String mensagemErro = retornarDescricaoErroApi(resultadoRecuperarMoedaDestino['error']['code']);
          retornarMensagemErro(context, "Falha ao converter moedas", mensagemErro);
        }
      }
      else{
        alterarLoadingConversao(false);
        String mensagemErro = retornarDescricaoErroApi(resultadoRecuperarMoedaOrigem['error']['code']);
        retornarMensagemErro(context, "Falha ao converter moedas", mensagemErro);
      }
    }
    catch(erro){
      alterarLoadingConversao(false);
      String mensagemErro = retornarDescricaoErroGeral(erro.toString());
      retornarMensagemErro(context, "Falha: ", mensagemErro);
    }
  }

  String retornarDescricaoErroGeral(String tipo){
    switch(tipo){
      case "TimeoutException after 0:00:15.000000: Future not completed": {
        return "Tempo limite de conexão atingido. Verifique sua conexão com a internet ou tente novamente mais tarde.";
      }
      break;
      default: {
        return "Verifique sua conexão com a internet ou tente novamente mais tarde. Se o erro persisitir favor entrar em contato com a BTG.";
      }
      break;
    }
  }

  String retornarDescricaoErroApi(String tipo){
    switch(tipo){
      case "404": {
        return "O usuário requisitou um recurso que não existe.";
      }
      break;
      case "101": {
        return "O usuário não informou uma chave de acesso válida.";
      }
      break;
      case "103": {
        return "O usuário requisitou uma função inexistente.";
      }
      break;
      case "104": {
        return "User has reached or exceeded his subscription plan's monthly API request allowance.";
      }
      break;
      case "105": {
        return "O plano atual do usuário não suporta esta requisição.";
      }
      break;
      case "106": {
        return "A solicitação do usuário não retornou resultado.";
      }
      break;
      case "102": {
        return "A conta do usuário não está ativa. Favor entrar em contato com o suporte técnico.";
      }
      break;
      case "201": {
        return "O usuário informou uma moeda que não existe em nossa base de dados.";
      }
      break;
      case "202": {
        return "O usuário informou um ou mais códigos de moedas inválidos.";
      }
      break;
      case "301": {
        return "O usuário não expecificou uma data.";
      }
      break;

      case "302": {
        return "O usuário informou uma data inválida.";
      }
      break;
      case "401": {
        return "O usuário informou uma moeda de origem inválida.";
      }
      break;
      case "402": {
        return "O usuário informou uma moeda de destino inválida.";
      }
      break;
      case "403": {
        return "O usuário não informou o valor para a conversão.";
      }
      break;
      case "501": {
        return "O usuário não espeficicou uma janela de tempo.";
      }
      break;
      case "502": {
        return "O usuário informou uma data de início inválida.";
      }
      break;
      case "503": {
        return "O usuário informou uma data de destino inválida.";
      }
      break;
      case "504": {
        return "O usuário espeficicou uma janela de tempo inválida.";
      }
      break;
      case "505": {
        return "A janela de tempo especificada pelo usuário é muito longa. Contém mais de 365 dias.";
      }
      break;
      default: {
        return "Verifique sua conexão com a internet ou tente novamente mais tarde. Se o erro persisitir favor entrar em contato com a BTG.";
      }
      break;
    }
  }

  retornarMensagemErro(BuildContext context, String tituloAlerta, String textoAlerta){
    alterarTituloAlerta(tituloAlerta);
    alterarTextoAlerta(textoAlerta);
    exibirAlertDialog(context);
  }

  exibirAlertDialog(BuildContext context) {
    Alerta.exibirAlert(context,
      titulo: tituloAlerta,
      descricao: textoAlerta,
    );
  }
}
