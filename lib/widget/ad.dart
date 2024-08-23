import 'package:flutter/material.dart';

import 'package:adivery/adivery.dart';
import 'package:adivery/adivery_ads.dart';

class Ad extends StatefulWidget {
  const Ad({
    super.key,
  });

  @override
  State<Ad> createState() => _AdState();
}

class _AdState extends State<Ad> {
  
  final String APP_ID = 'Your api key';
  final String PLACEMENT_ID = 'your api key ';
  @override
  void initState() {
    super.initState();
    AdiveryPlugin.initialize(APP_ID);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 320,
        height: 50,

        // child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        //   Text(
        //     "تبلیغات",
        //     style: Theme.of(context).textTheme.bodyMedium,
        //   ),
        // child: AndroidView(
        //   viewType: 'tapsell_plus_banner',
        //   creationParams: {
        //     'adId': _bannerAdId,
        //     'horizontalGravity': TapsellPlusHorizontalGravity.CENTER.index,
        //     'verticalGravity': TapsellPlusVerticalGravity.CENTER.index,
        //   },
        //   creationParamsCodec: StandardMessageCodec(),
        // ),
        child: BannerAd(
          PLACEMENT_ID,
          BannerAdSize.BANNER,
          onAdLoaded: (ad) {},
          onAdClicked: (ad) {},
        ));
  }
}

// class BannerAdWidget extends StatelessWidget {
//   final String responseId;

//   BannerAdWidget({required this.responseId});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: TapsellPlus.instance.showStandardBannerAd(responseId),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return Container(
//               width: 320,
//               height: 50,
//               child: Text('Banner Ad Loaded'),
//             );
//           }
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
