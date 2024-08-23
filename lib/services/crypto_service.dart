import 'dart:convert';
import 'package:codyad/Model/crypto_model.dart';
import 'package:http/http.dart' as http;

class CryptoService {
  static const String url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false';

  static Future<List<Crypto>> fetchCryptos() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        // چاپ داده‌های دریافتی برای اشکال‌زدایی

        List<Crypto> cryptos =
            body.map((dynamic item) => Crypto.fromJson(item)).toList();
        return cryptos;
      } else {
        // print('Failed to load cryptocurrencies: ${response.statusCode}');
        throw Exception('Failed to load cryptocurrencies');
      }
    } catch (e) {
      // print('Failed to load cryptocurrencies: $e');
      throw Exception('Failed to load cryptocurrencies');
    }
  }
}
