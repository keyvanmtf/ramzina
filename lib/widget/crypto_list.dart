import 'package:codyad/controller/crypto_controller.dart';
import 'package:codyad/theme/colors.dart';
import 'package:codyad/utils/crypto_names_fa.dart';
import 'package:codyad/widget/ad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({super.key});

  String getCryptoNameInFarsi(String name) {
    return cryptoNamesFa[name] ?? name;
  }

  String convertToPersianNumber(String input) {
    const englishNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persianNumbers = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < englishNumbers.length; i++) {
      input = input.replaceAll(englishNumbers[i], persianNumbers[i]);
    }
    return input;
  }

  @override
  Widget build(BuildContext context) {
    final CryptoController cryptoController = Get.find<CryptoController>();

    return Obx(() {
      return ListView.separated(
        itemCount: cryptoController
            .filteredCryptos.length, // استفاده از filteredCryptos
        itemBuilder: (context, index) {
          final crypto = cryptoController
              .filteredCryptos[index]; // استفاده از filteredCryptos
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: appColors.priceCardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Image.network(
                  crypto.image,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    getCryptoNameInFarsi(crypto.name),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    convertToPersianNumber(
                        '\$${crypto.currentPrice.toStringAsFixed(2)}'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    convertToPersianNumber(
                        '${crypto.priceChangePercentage24h.toStringAsFixed(2)}%'),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: crypto.priceChangePercentage24h >= 0
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                )
              ]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return (index + 5) % 5 == 0 ? const Ad() : const SizedBox.shrink();
        },
      );
    });
  }
}
