import 'dart:async'; // برای استفاده از Timer

import 'package:codyad/Model/crypto_model.dart';
import 'package:codyad/controller/crypto_controller.dart';
import 'package:codyad/widget/crypto_list.dart';
import 'package:codyad/widget/update_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../theme/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var cryptoList = [];
  late Future<List<Crypto>> futureCryptos;
  String searchQuery = '';
  Timer? _timer; // متغیر تایمر

  @override
  void initState() {
    super.initState();
    // fetchCryptos();
  }

  @override
  void dispose() {
    _timer?.cancel(); // لغو تایمر
    super.dispose();
  }

  // void fetchCryptos() {
  //   setState(() {
  //     futureCryptos = CryptoService.fetchCryptos();
  //   });
  // }

  // void _startAutoRefresh() {
  //   _timer = Timer.periodic(Duration(seconds: 10), (timer) {
  //     fetchCryptos();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final currentwidth = MediaQuery.of(context).size.width;
    final currentheight = MediaQuery.of(context).size.height;
    final CryptoController cryptoController = Get.put(CryptoController());

    return Scaffold(
      backgroundColor: appColors.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "نرخ آزاد ارز چیست؟",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "مقصود از نرخ ارز آزاد، نرخ خرید و فروش ارز در بازار غیررسمی و غیردولتی است. از آنجایی که اغلب مبادلات عموم مردم در این بازار به انجام می رسد و دسترسی به آن برای همگان امکان پذیر است",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                style: const TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                decoration: InputDecoration(
                  hintText: "جستجوی ارز",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),

                  fillColor: appColors.priceCardColor,
                  filled: true, // Explicit color for testing
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 35,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(1000),
                    ),
                    color: appColors.priceCardColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "نام قیمت ارز",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        "قیمت",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        "تغییر",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: currentheight * 0.45,
                child: Obx(() {
                  if (cryptoController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (cryptoController.cryptos.isEmpty) {
                    return const Center(child: Text('No data available'));
                  } else {
                    return const CryptoList(); // اینجا لیست ارزها را نمایش می‌دهیم
                  }
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: UpdateButton(
                  onUpdate: cryptoController.fetchCryptos,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('kk:mm:ss').format(now);
    return formattedTime;
  }
}
