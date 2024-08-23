import 'package:codyad/utils/crypto_names_fa.dart';
import 'package:flutter/material.dart';
import 'package:codyad/Model/crypto_model.dart';
import 'package:codyad/widget/ad.dart';
import 'package:codyad/theme/colors.dart';

class CryptoList extends StatelessWidget {
  final List<Crypto> cryptos;
  final String searchQuery;

  const CryptoList({Key? key, required this.cryptos, required this.searchQuery})
      : super(key: key);

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
    final filteredCryptos = cryptos.where((crypto) {
      final nameFa = getCryptoNameInFarsi(crypto.name);
      final query = searchQuery.toLowerCase();
      return crypto.name.toLowerCase().contains(query) ||
          nameFa.contains(query);
    }).toList();

    return ListView.separated(
      itemCount: filteredCryptos.length,
      itemBuilder: (context, index) {
        final crypto = filteredCryptos[index];
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
                  style: TextStyle(
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
                  style: TextStyle(color: Colors.white),
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
  }
}
