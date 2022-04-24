/*import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final Uri exchangeURL =
      Uri.https("api.coingecko.com", "/api/v3/exchange_rates");

  Future<List<String>> getExchange() async {
    http.Response res = await http.get(exchangeURL);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list = body["rates"];
      List<String> valueexchange = (list.keys).toList();
      return valueexchange;
    } else {
      throw Exception("Failed to connect to API");
    }
  }
}*/