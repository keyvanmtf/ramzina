import 'dart:convert';

import 'package:codyad/Model/crypto_model.dart';
import 'package:codyad/utils/crypto_names_fa.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CryptoController extends GetxController {
  var cryptos = <Crypto>[].obs; // لیست رمز ارزها، که واکنش‌گرا است
  var isLoading = true.obs;
  var searchText = ''.obs;
  var filteredCryptos = <Crypto>[].obs;

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

  String getCryptoNameInFarsi(String name) {
    // اینجا باید تابع getCryptoNameInFarsi را پیاده‌سازی کنید
    // یا آن را از جای دیگری import کنید
    return name; // این خط را با پیاده‌سازی واقعی جایگزین کنید
  }

  void searchCrypto(String query) {
    searchText.value =
        query.trim(); // حذف فضاهای اضافی در ابتدا و انتهای متن جستجو

    if (query.isEmpty) {
      filteredCryptos.value = cryptos; // نمایش همه ارزها اگر جستجو خالی است
    } else {
      filteredCryptos.value = cryptos.where((crypto) {
        final nameFa =
            cryptoNamesFa[crypto.name] ?? ''; // دریافت نام فارسی از Map
        final lowerQuery = query.toLowerCase();
        return crypto.name.toLowerCase().contains(lowerQuery) ||
            nameFa.contains(query); // جستجو در نام انگلیسی و فارسی
      }).toList();

      // بررسی نتایج فیلتر شده
      print("Filtered Cryptos: ${filteredCryptos.length}");
      for (var crypto in filteredCryptos) {
        print("Matched Crypto: ${crypto.name}");
      }
    }
  }
}
