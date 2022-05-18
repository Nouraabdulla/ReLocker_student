import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:relocker_sa/locker_type.dart';

class howtoreserve extends StatefulWidget {
  const howtoreserve({Key? key}) : super(key: key);

  @override
  _howtoreserveState createState() => _howtoreserveState();
}

class _howtoreserveState extends State<howtoreserve> {
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(40));
  int _currentIndex = 0;

  late CarouselSlider carouselSlider;

  List imageList = [
    'assets/images/howto1.png',
    'assets/images/howto2.png',
    'assets/images/howto3.png',
    'assets/images/howto4.png',
    'assets/images/howto5.png',
    'assets/images/howto6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xff88d8bb),
          title: Text("how to reserve a locker"),
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 600.0,
                initialPage: 0,
                autoPlay: false,
                reverse: false,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                onPageChanged: (index, reason) =>
                    setState(() => _currentIndex = index),
                // pauseAutoPlayOnTouch: Duration(seconds: 10),
                // scrollDirection: Axis.horizontal,
              ),
              items: imageList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        child: Image.asset(
                      i,
                      fit: BoxFit.fill,
                    ));
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            biuldIndicator(),
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //       primary: Color(0xff88d8bb),
            //       onPrimary: Colors.black,
            //       shape: shape,
            //       padding: EdgeInsets.symmetric(horizontal: 100)),
            //   onPressed: () {
            //     Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context) => locker_type()));
            //   },
            //   child: Text('OK'),
            // )
          ],
        ),
      ),
    );
  }

  Widget biuldIndicator() => AnimatedSmoothIndicator(
        activeIndex: _currentIndex,
        count: 6,
        effect: SwapEffect(
          dotWidth: 12,
          dotHeight: 12,
          activeDotColor: Color(0xff88d8bb),
        ),
      );
}

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:relocker_sa/locker_type.dart';

// class howtoreserve extends StatefulWidget {
//   const howtoreserve({Key? key}) : super(key: key);

//   @override
//   _howtoreserveState createState() => _howtoreserveState();
// }

// class _howtoreserveState extends State<howtoreserve> {
//   final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(40));
//   int _currentIndex = 0;

//   late CarouselSlider carouselSlider;

//   List imageList = [
//     'assets/images/howto1.png',
//     'assets/images/howto2.png',
//     'assets/images/howto3.png',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color(0xffffffff),
//         appBar: AppBar(
//           backgroundColor: const Color(0xff88d8bb),
//           title: Text("how to reserve a locker"),
//           centerTitle: true,
//           foregroundColor: Colors.black,
//           automaticallyImplyLeading: false,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: 500.0,
//                 initialPage: 0,
//                 autoPlay: false,
//                 reverse: false,
//                 enlargeCenterPage: true,
//                 enableInfiniteScroll: false,
//                 scrollDirection: Axis.horizontal,
//                 autoPlayInterval: Duration(seconds: 2),
//                 autoPlayAnimationDuration: Duration(milliseconds: 2000),
//                 onPageChanged: (index, reason) =>
//                     setState(() => _currentIndex = index),
//                 // pauseAutoPlayOnTouch: Duration(seconds: 10),
//                 // scrollDirection: Axis.horizontal,
//               ),
//               items: imageList.map((i) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                         child: Image.asset(
//                       i,
//                       fit: BoxFit.fill,
//                     ));
//                   },
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 32),
//             biuldIndicator(),
//             Padding(
//               padding: const EdgeInsets.all(10),
//             ),
//             // ElevatedButton(
//             //   style: ElevatedButton.styleFrom(
//             //       primary: Color(0xff88d8bb),
//             //       onPrimary: Colors.black,
//             //       shape: shape,
//             //       padding: EdgeInsets.symmetric(horizontal: 100)),
//             //   onPressed: () {
//             //     Navigator.of(context).push(
//             //         MaterialPageRoute(builder: (context) => locker_type()));
//             //   },
//             //   child: Text('OK'),
//             // )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget biuldIndicator() => AnimatedSmoothIndicator(
//         activeIndex: _currentIndex,
//         count: 3,
//         effect: SwapEffect(
//           dotWidth: 12,
//           dotHeight: 12,
//           activeDotColor: Color(0xff88d8bb),
//         ),
//       );
// }

