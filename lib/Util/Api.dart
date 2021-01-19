class Api{
  final String _url = "http://api.currencylayer.com/";
  final String _apiKey = "231d9fef9117be082b12698e16ad9106";
  final String _apiKeyBody = "?access_key=";
  final String _urlListaMoedas = "list";
  final String _urlConverter = "live";

  Api();

  String urlRecuperarMoedas(){
    return _url+_urlListaMoedas+_apiKeyBody+_apiKey;
  }

  String urlConverterMoeda(String moeda){
    return _url+_urlConverter+_apiKeyBody+_apiKey+"&currencies="+moeda+"&source=USD&format=1";
  }
}