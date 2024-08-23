import 'dart:async'; // برای استفاده از Timer
import 'package:codyad/widget/crypto_list.dart';
import 'package:codyad/widget/update_btn.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:codyad/Model/crypto_model.dart';
import 'package:codyad/services/crypto_service.dart';
import 'package:flutter/cupertino.dart';
import '../theme/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
    fetchCryptos();
  }

  @override
  void dispose() {
    _timer?.cancel(); // لغو تایمر
    super.dispose();
  }

  void fetchCryptos() {
    setState(() {
      futureCryptos = CryptoService.fetchCryptos();
    });
  }

  // void _startAutoRefresh() {
  //   _timer = Timer.periodic(Duration(seconds: 10), (timer) {
  //     fetchCryptos();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;
    final currentheight = MediaQuery.of(context).size.height;

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
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

                  fillColor: appColors.priceCardColor,
                  filled: true, // Explicit color for testing
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
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
                child: FutureBuilder<List<Crypto>>(
                  future: futureCryptos,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child:
                              Text('Failed to load data: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      final cryptos = snapshot.data!;
                      return CryptoList(
                        cryptos: cryptos,
                        searchQuery: searchQuery,
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                child: UpdateButton(
                  onUpdate: fetchCryptos,
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
