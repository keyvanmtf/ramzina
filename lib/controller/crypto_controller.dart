import 'dart:convert';

import 'package:codyad/Model/crypto_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CryptoController extends GetxController {
  var cryptos = <Crypto>[].obs; // لیست رمز ارزها، که واکنش‌گرا است
  var isLoading = true.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    fetchCryptos();
    super.onInit();
  }

  Future<List<Crypto>> fetchCryptos() async {
   
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&x_cg_demo_api_key=api-key'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var cryptoList =
            (jsonData as List).map((data) => Crypto.fromJson(data)).toList();
        cryptos.value =
            cryptoList; // این خط برای بروز رسانی لیست در داخل GetX است
        return cryptoList; // لیست رمز ارزها را برمی‌گردانیم
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
        return []; // در صورت خطا، یک لیست خالی برمی‌گردانیم
      }
    } finally {
      isLoading(false);
    }
  }
  // List<Rx<Crypto>> get filteredCryptos => cryptos.where((crypto) {
  //   final nameFa = getCryptoNameInFarsi(crypto.value.name);
  //   final query = searchQuery.value.toLowerCase();
  //   return crypto.value.name.toLowerCase().contains(query) ||
  //       nameFa.toLowerCase().contains(query);
  // }).toList();

  String getCryptoNameInFarsi(String name) {
    // اینجا باید تابع getCryptoNameInFarsi را پیاده‌سازی کنید
    // یا آن را از جای دیگری import کنید
    return name; // این خط را با پیاده‌سازی واقعی جایگزین کنید
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
