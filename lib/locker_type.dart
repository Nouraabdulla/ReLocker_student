import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relocker_sa/controller_view_screen.dart';
import 'package:relocker_sa/home_view.dart';
import 'package:relocker_sa/locker_Gfloor.dart';
import 'package:relocker_sa/locker_floor.dart';
import 'package:relocker_sa/profile.dart';

class locker_type extends StatelessWidget {
  locker_type({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
          backgroundColor: const Color(0xff88d8bb),
          title: Text("Choose type"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ) /* textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 20,
                  color: Colors.black,
                ))*/
          ),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 26.0, end: 20.0),
            Pin(size: 259.9, middle: 0.1013),
            child: IconButton(
              icon: Image.asset('assets/images/regular.jpg'),
              iconSize: 50,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => locker_Gfloor()));
              },
            ),
          ),
          Pinned.fromPins(
            Pin(start: 26.0, end: 20.0),
            Pin(size: 259.0, middle: 0.8194),
            child: IconButton(
              icon: Image.asset('assets/images/flexible.jpg'),
              iconSize: 50,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ControllerViewScreen()));
              },
            ),
          ),

          /*Pinned.fromPins(
            Pin(start: 26.0, end: 26.0),
            Pin(size: 262.9, middle: 0.2413),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(4, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 26.0, end: 26.0),
            Pin(size: 259.0, middle: 0.7774),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(4, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: Image.asset('assets/images/background3.jpeg'),
            iconSize: 50,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ControllerViewScreen()));
            },
          ),
          Container(
              child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => profile()));
                      },
                      child: Image.asset('assets/images/background3.jpeg')))),
          Pinned.fromPins(
            Pin(start: 26.0, end: 26.0),
            Pin(size: 188.4, middle: 0.2175),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: const Color(0xffbff1e1),
                  border:
                      Border.all(width: 1.0, color: const Color(0xffbff1e1)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 164.0, middle: 0.5),
            Pin(size: 53.0, middle: 0.2756),
            child: Text(
              'Regular',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 44,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                height: 2.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 246.0, middle: 0.5),
            Pin(size: 22.0, middle: 0.4236),
            child: Text(
              'Rent locker for one semester',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 19,
                color: const Color(0x7c000000),
                height: 1.2105263157894737,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 290.0, end: 56.0),
            Pin(size: 21.0, end: 149.0),
            child: Text(
              'Rent locker for less than a semester',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0x7c000000),
                height: 1.2222222222222223,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 162.0, middle: 0.5),
            Pin(size: 53.0, middle: 0.672),
            child: Text(
              'Flexible',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 44,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                height: 2.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 26.0, end: 26.0),
            Pin(size: 202.4, middle: 0.7109),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: SvgPicture.string(
                _svg_m594vh,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 115.8, start: 26.0),
            Pin(size: 43.8, middle: 0.7713),
            child: SvgPicture.string(
              _svg_gg2hjs,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 184.9, middle: 0.4431),
            Pin(size: 56.1, middle: 0.7629),
            child: SvgPicture.string(
              _svg_e6hexj,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, end: 26.0),
            Pin(size: 45.4, middle: 0.7619),
            child: SvgPicture.string(
              _svg_oerk2s,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 125.0, middle: 0.4785),
            Pin(size: 21.0, start: 39.0),
            child: Text(
              'Choose type',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff1c0000),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 90.0, start: -0.9),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff88d8bb),
                ),
              ),
            ),
          ),*/

          Container(),
        ],
      ),
    );
  }
}

const String _svg_m594vh =
    '<svg viewBox="26.0 474.6 360.0 202.4" ><path transform="translate(33.92, 475.57)" d="M 12.00196170806885 -1 L 338.177490234375 0 C 344.9851684570312 0 351.1236267089844 3.603014707565308 351.1236267089844 10.80634212493896 C 351.1236267089844 29.03702163696289 353.2195129394531 149.5723724365234 351.1709899902344 157.4482421875 C 349.1126098632812 165.3650817871094 341.8846740722656 163.1313018798828 339.7082214355469 167.9017791748047 C 333.5091552734375 181.4893035888672 301.0628967285156 195.3973693847656 301.0628967285156 195.3973693847656 C 301.0628967285156 195.3973693847656 283.1604614257812 196.84716796875 276.8845825195312 193.7494354248047 C 272.9526672363281 191.8074340820312 270.60595703125 189.7754058837891 266.2066040039062 189.4551849365234 C 263.1054992675781 189.2294769287109 251.8141479492188 181.8600311279297 251.8141479492188 181.8600311279297 C 251.8141479492188 181.8600311279297 247.651123046875 178.5450744628906 247.6493682861328 178.3977661132812 C 247.6507110595703 178.4992980957031 246.275146484375 165.1620941162109 241.3806304931641 164.7122802734375 C 214.9702453613281 162.2851715087891 199.8208465576172 163.2792816162109 163.6211700439453 153.8042907714844 C 159.9329223632812 152.8389434814453 89.00518798828125 193.5971221923828 85.13443756103516 192.4803924560547 C 80.16436004638672 191.0465698242188 71.35356140136719 202.9493103027344 66.24143218994141 201.266357421875 C 62.25278854370117 199.9532775878906 46.4661865234375 201.266357421875 46.4661865234375 201.266357421875 C 46.4661865234375 201.266357421875 25.23797035217285 201.4620056152344 20.7867374420166 197.1873779296875 C 14.13136959075928 190.7965240478516 7.132230281829834 190.4849853515625 3.316667318344116 181.1378326416016 C 1.868768930435181 177.5914154052734 -1.675714015960693 177.9519958496094 -4.008596897125244 175.4569549560547 C -5.452028274536133 173.9178314208984 -5.817523956298828 169.7219085693359 -6.430967330932617 166.2920074462891 C -9.57651424407959 148.7069091796875 -6.79194974899292 128.1819305419922 -6.430967330932617 105.9435501098633 C -5.881388664245605 72.08010864257812 -6.333296775817871 35.91444778442383 -6.430967330932617 13.10630989074707 C -6.430967330932617 5.902982711791992 5.194277763366699 -1 12.00196170806885 -1 Z" fill="#bff1e1" stroke="#bff1e1" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_gg2hjs =
    '<svg viewBox="26.0 637.2 115.8 43.8" ><path transform="translate(28.92, 603.29)" d="M 51.65446853637695 73.06098175048828 C 81.41605377197266 73.06098175048828 112.8790969848633 18.29922103881836 112.8790969848633 38.32383346557617 C 112.8790969848633 58.34846115112305 81.41605377197266 77.76737213134766 51.65446853637695 77.76737213134766 C 21.89287567138672 77.76737213134766 -2.915710687637329 60.56713485717773 -2.915710687637329 40.54252243041992 C -2.915710687637329 20.51791000366211 21.89287567138672 73.06098175048828 51.65446853637695 73.06098175048828 Z" fill="#bff1e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e6hexj =
    '<svg viewBox="100.6 620.9 184.9 56.1" ><path transform="matrix(-0.999848, 0.017452, -0.017452, -0.999848, 285.52, 673.79)" d="M 84.23089599609375 38.79569625854492 C 119.9197616577148 38.79569625854492 171.8404083251953 -1.132480621337891 183.7767639160156 0.02466011047363281 C 185.880615234375 0.2180709838867188 172.0393524169922 12.4169807434082 172.0393524169922 15.84323120117188 C 172.0393524169922 35.64815902709961 122.2819366455078 52.85075759887695 79.12733459472656 52.85075759887695 C 35.97270202636719 52.85075759887695 -4.973693292378118e-16 35.83922958374023 -2.225209021391842e-16 16.0343132019043 C 5.232755142922294e-17 -3.770605087280273 41.07626342773438 38.79569625854492 84.23089599609375 38.79569625854492 Z" fill="#bff1e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_oerk2s =
    '<svg viewBox="254.0 628.3 132.0 45.4" ><path transform="translate(256.92, 594.37)" d="M 59.28295516967773 74.41484832763672 C 93.20497894287109 74.41484832763672 129.0662994384766 17.75890159606934 129.0662994384766 38.47615814208984 C 129.0662994384766 59.19342803955078 93.20497894287109 79.28403472900391 59.28295516967773 79.28403472900391 C 25.36091995239258 79.28403472900391 -2.915709972381592 61.48884963989258 -2.915709972381592 40.77159118652344 C -2.915709972381592 20.05433464050293 25.36091995239258 74.41484832763672 59.28295516967773 74.41484832763672 Z" fill="#bff1e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
