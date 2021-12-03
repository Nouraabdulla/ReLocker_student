import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class lockerset4_GGS extends StatelessWidget {
  lockerset4_GGS({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 125.0, middle: 0.5261),
            Pin(size: 21.0, start: 35.0),
            child: Text(
              'Choose zone',
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
            Pin(start: 0.0, end: -16.0),
            Pin(size: 80.0, start: 0.0),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff88d8bb),
                ),
              ),
            ),
          ),
          Container(),
          Pinned.fromPins(
            Pin(size: 323.0, middle: 0.5618),
            Pin(start: 109.0, end: 0.0),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 323.0,
                  height: 900.0,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 21.0, start: 0.0),
                        child: Text(
                          'choose the set of lockers that you want',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xff707070),
                            height: 1.6666666666666667,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 13.0, end: 7.0),
                        Pin(size: 23.0, end: 360),
                        child: Text(
                          'Choose the locker that suits you',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xff707070),
                            height: 1.6666666666666667,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, end: 12.0),
                        Pin(size: 71.0, end: 230), //6-g-004
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd6fff0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, end: 12.0),
                        Pin(size: 69.0, end: 162), //6-g-008
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffefecec),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, end: 12.0),
                        Pin(size: 69.0, end: 94), //6-g-012
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd6fff0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.6393),
                        Pin(size: 71.0, end: 230), //6-g-003
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd6fff0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.6393),
                        Pin(size: 69.0, end: 162), //6-g-007
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffefecec),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.6393),
                        Pin(size: 69.0, end: 94), //6-g-011
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd6fff0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.3279),
                        Pin(size: 71.0, end: 230), //6-g-002
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd6fff0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.3279),
                        Pin(size: 69.0, end: 162), //6-g-006
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffefecec),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.3279),
                        Pin(size: 69.0, end: 94), //6-g-010
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd6fff0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, start: 4.0),
                        Pin(size: 71.0, end: 230), //6-g-001
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd6fff0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, start: 4.0),
                        Pin(size: 69.0, end: 162), //6-g-005
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffefecec),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, start: 4.0),
                        Pin(size: 69.0, end: 94), //6-g-009
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd6fff0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, start: 37.0),
                        Pin(size: 18.0, end: 325), // available locker
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: const Color(0xffafafaf),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 106.0, start: 43.0),
                        Pin(size: 21.0, end: 325), // available locker
                        child: Text(
                          'Available',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xff707070),
                            height: 2.4444444444444446,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 127.0, end: 28.0),
                        Pin(size: 21.0, end: 325), // not available locker
                        child: Text(
                          'Not Available',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xff707070),
                            height: 1.6666666666666667,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5115),
                        Pin(size: 18.0, end: 325), //not available locker
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: const Color(0xffff0000),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      ///---------------- map ----------------
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 40.0),
                        Pin(size: 29.0, start: 222), //exit
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff7dd871),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 85.0, middle: 0.6183),
                        Pin(size: 94.0, start: 335), // 6g38
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 65.0, start: 40.0),
                        Pin(size: 136.0, start: 87.0), //6g35
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 40.0),
                        Pin(size: 46.0, start: 250), //6g37
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 40.0),
                        Pin(size: 52.0, start: 295), //6g40
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 40.0),
                        Pin(size: 83.0, start: 346), //6g41
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 40.0),
                        Pin(size: 62.0, start: 428), //6g42
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 23.0, middle: 0.5083),
                        Pin(size: 63.0, start: 428), // stairs base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 100.0, end: 29.0),
                        Pin(size: 79.0, start: 87.0), //6g30
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 92.0, middle: 0.4487),
                        Pin(size: 79.0, start: 87.0), //6g31
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 450), // stairs line
                        child: SvgPicture.string(
                          _svg_tijdap,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 454), // stairs line
                        child: SvgPicture.string(
                          _svg_ay9r5j,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 457), //stairs line
                        child: SvgPicture.string(
                          _svg_knuc9c,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 460), // stairs line
                        child: SvgPicture.string(
                          _svg_rc4ioe,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 463), // stairs line
                        child: SvgPicture.string(
                          _svg_cw72j7,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 5.0, middle: 0.4642),
                        Pin(
                            size: 63.0,
                            start: 428), // wall between stairs and lockers
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 67.0, start: 38.0),
                        Pin(size: 16.0, start: 450),
                        child: Text(
                          '6G42',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 67.0, start: 39.0),
                        Pin(size: 16.0, start: 380),
                        child: Text(
                          '6G41',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 67.0, start: 40.0),
                        Pin(size: 16.0, start: 315),
                        child: Text(
                          '6G40',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 67.0, start: 42.0),
                        Pin(size: 16.0, start: 265),
                        child: Text(
                          '6G37',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 45.0),
                        Pin(size: 16.0, start: 122.0),
                        child: Text(
                          '6G35',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.4652),
                        Pin(size: 16.0, start: 121.0),
                        child: Text(
                          '6G31',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.8205),
                        Pin(size: 16.0, start: 121.0),
                        child: Text(
                          '6G30',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.6117),
                        Pin(size: 16.0, start: 340),
                        child: Text(
                          '6G38',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 467), // stairs line
                        child: SvgPicture.string(
                          _svg_dkp1o,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 470), // stairs line
                        child: SvgPicture.string(
                          _svg_omj78x,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 473), // stairs line
                        child: SvgPicture.string(
                          _svg_n1hlsa,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7826),
                        Pin(size: 8.0, start: 260), //between stairs bases
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      // Pinned.fromPins(
                      //   Pin(size: 19.0, middle: 0.7622),
                      //   Pin(size: 14.0, middle: 0.3214),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: const Color(0xffe5e5e5),
                      //       border: Border.all(
                      //           width: 0.5, color: const Color(0xff000000)),
                      //     ),
                      //   ),
                      // ),
                      Pinned.fromPins(
                        Pin(size: 85.0, middle: 0.6183),
                        Pin(size: 97.0, start: 239), //6g36
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 148.0, end: 28.0),
                        Pin(size: 60.0, start: 180), //above 36
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, end: 105),
                        Pin(size: 16.0, start: 280),
                        child: Text(
                          '6G36',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 26.7, middle: 0.7818),
                        Pin(size: 1.0, start: 262), //stairs2 line
                        child: SvgPicture.string(
                          _svg_lnz2x,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 26.7, middle: 0.7818),
                        Pin(size: 1.0, start: 265), //stairs2 line
                        child: SvgPicture.string(
                          _svg_nnymfy,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7826),
                        Pin(size: 1.0, start: 264), //stairs2 line
                        child: SvgPicture.string(
                          _svg_dx800g,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 51.0, start: 46.0),
                        Pin(size: 14.0, start: 230),
                        child: Text(
                          'Exit',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3361),
                        Pin(size: 16.0, start: 390), // locker front to 41
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3361),
                        Pin(size: 16.0, start: 370), // locker front to 41
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3361),
                        Pin(size: 16.0, start: 350), // locker front to 41
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3361),
                        Pin(size: 16.0, start: 320), // locker front to 40
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3361),
                        Pin(size: 16.0, start: 300), // locker front to 40
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.4299),
                        Pin(size: 16.0, start: 470), // locker next to stairs
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.4299),
                        Pin(size: 16.0, start: 450), // locker next to stairs
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.4299),
                        Pin(size: 16.0, start: 430), // locker next to stairs
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.4299),
                        Pin(size: 16.0, start: 410), // locker next to stairs
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.5786),
                        Pin(size: 16.0, start: 428), // locker under stairs
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.6475),
                        Pin(size: 16.0, start: 428), // locker under stairs
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.7054),
                        Pin(size: 16.0, start: 431), // locker under stairs
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.7054),
                        Pin(size: 16.0, start: 451), // locker under stairs
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.7054),
                        Pin(size: 16.0, start: 472), // locker under stairs
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffafafaf),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5082),
                        Pin(size: 1.0, start: 477), //stairs line
                        child: SvgPicture.string(
                          _svg_iy9gwn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 481), //stairs line
                        child: SvgPicture.string(
                          _svg_jyak4w,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 485), //stairs line
                        child: SvgPicture.string(
                          _svg_jyak4w,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 36.0, end: 29.0),
                        Pin(size: 8.0, start: 260), // bettween stairs bases
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7826),
                        Pin(size: 21.0, start: 240), // stair 2 base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 60.6),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_vpmvr8,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_w0qrc,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_my8dz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_d1az9d,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_iet5hn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_f0i5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 34.5),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_sz5js6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.8),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_j0ir3,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 37.0, end: 29.0),
                        Pin(size: 21.0, start: 240), //stairs2 line
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 60.6),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_k2xp6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_soa8o,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_kyz015,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_jd6n5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_xeum3v,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_fva47n,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 34.5),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_txj5y,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.8),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_md3kz5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_xeum3v,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_l0ec1i,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7826),
                        Pin(size: 21.0, start: 267), // stair2 base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 60.6),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_lcaj,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_yormcd,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.5),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ufja0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.5),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_dcx164,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ule6p,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_keuec8,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 34.5),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_izqcxj,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.8),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_o62gh,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 37.0, end: 29.0),
                        Pin(size: 21.0, start: 267), // stairs2 base with lines
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 60.6),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_h5wa,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_s28bog,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_e78g0v,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_tmu9ev,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_rcty5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_jzmhph,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 34.5),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_v0z2r6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.8),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ct3v2v,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_rcty5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_e5t40i,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      //-------------------------------------

                      Pinned.fromPins(
                        Pin(size: 18.0, start: 40.0),
                        Pin(size: 18.0, start: 40.0), // available set
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: const Color(0xffafafaf),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 106.0, start: 46.0),
                        Pin(size: 21.0, start: 41.0), // Available set
                        child: Text(
                          'Available',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xff707070),
                            height: 2.4444444444444446,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 127.0, end: 25.0),
                        Pin(size: 21.0, start: 41.0), // Not Available set
                        child: Text(
                          'Not Available',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xff707070),
                            height: 1.6666666666666667,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5213),
                        Pin(size: 18.0, start: 40.0), // Not Available set
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: const Color(0xffff0000),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 79.0, end: 12.0),
                        Pin(size: 69.0, end: 26), // 6-G-016
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffefecec),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.6393),
                        Pin(size: 69.0, end: 26), // 6-G-015
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffefecec),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.3238),
                        Pin(size: 69.0, end: 26), // 6-G-014
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffefecec),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 78.0, start: 4.0),
                        Pin(size: 69.0, end: 26), // 6-G-013
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffefecec),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 47.0, start: 14.0),
                        Pin(size: 14.0, end: 280), //6-G-001
                        child: Text(
                          '6-G-017',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, middle: 0.337),
                        Pin(size: 14.0, end: 280), // 6-G-002
                        child: Text(
                          '6-G-018',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, middle: 0.6087),
                        Pin(size: 14.0, end: 280), // 6-G-003
                        child: Text(
                          '6-G-019',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, end: 33.0),
                        Pin(size: 14.0, end: 280),
                        child: Text(
                          '6-G-020',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, start: 14.0),
                        Pin(size: 14.0, end: 210),
                        child: Text(
                          '6-G-021',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, middle: 0.337),
                        Pin(size: 14.0, end: 210),
                        child: Text(
                          '6-G-022',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, middle: 0.6087),
                        Pin(size: 14.0, end: 210),
                        child: Text(
                          '6-G-023',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, end: 33.0),
                        Pin(size: 14.0, end: 210),
                        child: Text(
                          '6-G-024',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, start: 14.0),
                        Pin(size: 14.0, end: 140),
                        child: Text(
                          '6-G-025',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, middle: 0.337),
                        Pin(size: 14.0, end: 140),
                        child: Text(
                          '6-G-026',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, middle: 0.6087),
                        Pin(size: 14.0, end: 140),
                        child: Text(
                          '6-G-027',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, end: 33.0),
                        Pin(size: 14.0, end: 140), //6-G-012
                        child: Text(
                          '6-G-028',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, start: 13.0),
                        Pin(size: 14.0, end: 70),
                        child: Text(
                          '6-G-029',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, middle: 0.3188),
                        Pin(size: 14.0, end: 70),
                        child: Text(
                          '6-G-030',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, middle: 0.6014),
                        Pin(size: 14.0, end: 70),
                        child: Text(
                          '6-G-031',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, end: 33.0),
                        Pin(size: 14.0, end: 70),
                        child: Text(
                          '6-G-032',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff0f0000),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_eb1si9 =
    '<svg viewBox="154.6 464.2 22.4 1.0" ><path transform="translate(154.6, 464.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jqkp =
    '<svg viewBox="154.6 459.0 22.4 1.0" ><path transform="translate(154.6, 458.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hxyn74 =
    '<svg viewBox="154.6 469.4 22.4 1.0" ><path transform="translate(154.6, 469.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_umwi =
    '<svg viewBox="154.6 474.5 22.4 1.0" ><path transform="translate(154.6, 474.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s1ynlr =
    '<svg viewBox="154.6 478.0 22.4 1.0" ><path transform="translate(154.6, 478.0)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tijdap =
    '<svg viewBox="154.6 466.2 22.4 1.0" ><path transform="translate(154.6, 466.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ay9r5j =
    '<svg viewBox="154.6 462.0 22.4 1.0" ><path transform="translate(154.6, 461.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_knuc9c =
    '<svg viewBox="154.6 470.4 22.4 1.0" ><path transform="translate(154.6, 470.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rc4ioe =
    '<svg viewBox="154.6 478.5 22.4 1.0" ><path transform="translate(154.6, 478.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cw72j7 =
    '<svg viewBox="154.6 457.8 22.4 1.0" ><path transform="translate(154.6, 457.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dkp1o =
    '<svg viewBox="154.6 482.7 22.4 1.0" ><path transform="translate(154.6, 482.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_omj78x =
    '<svg viewBox="154.6 489.5 22.4 1.0" ><path transform="translate(154.6, 489.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n1hlsa =
    '<svg viewBox="154.6 492.9 22.4 1.0" ><path transform="translate(154.6, 492.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lnz2x =
    '<svg viewBox="234.0 265.5 26.7 1.0" ><path transform="translate(234.0, 265.55)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nnymfy =
    '<svg viewBox="234.0 267.1 26.7 1.0" ><path transform="translate(234.0, 267.09)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dx800g =
    '<svg viewBox="234.0 264.0 27.0 1.0" ><path transform="translate(234.0, 264.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iy9gwn =
    '<svg viewBox="154.3 486.0 22.4 1.0" ><path transform="translate(154.31, 485.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jyak4w =
    '<svg viewBox="154.6 474.4 22.4 1.0" ><path transform="translate(154.6, 474.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vpmvr8 =
    '<svg viewBox="264.4 241.6 1.0 20.3" ><path transform="translate(264.4, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w0qrc =
    '<svg viewBox="268.2 241.6 1.0 20.3" ><path transform="translate(268.17, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_my8dz =
    '<svg viewBox="272.6 241.6 1.0 20.3" ><path transform="translate(272.63, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d1az9d =
    '<svg viewBox="276.7 241.6 1.0 20.3" ><path transform="translate(276.75, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iet5hn =
    '<svg viewBox="284.3 241.6 1.0 20.3" ><path transform="translate(284.31, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f0i5 =
    '<svg viewBox="287.3 241.6 1.0 20.3" ><path transform="translate(287.28, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sz5js6 =
    '<svg viewBox="290.5 241.6 1.0 20.3" ><path transform="translate(290.49, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j0ir3 =
    '<svg viewBox="293.2 241.6 1.0 20.3" ><path transform="translate(293.21, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_k2xp6 =
    '<svg viewBox="264.4 242.3 1.0 20.2" ><path transform="translate(264.4, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_soa8o =
    '<svg viewBox="268.2 242.3 1.0 20.2" ><path transform="translate(268.17, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kyz015 =
    '<svg viewBox="272.6 242.3 1.0 20.2" ><path transform="translate(272.63, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jd6n5 =
    '<svg viewBox="276.7 242.3 1.0 20.2" ><path transform="translate(276.75, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xeum3v =
    '<svg viewBox="284.3 242.3 1.0 20.2" ><path transform="translate(284.31, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fva47n =
    '<svg viewBox="287.3 242.3 1.0 20.2" ><path transform="translate(287.28, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_txj5y =
    '<svg viewBox="290.5 242.3 1.0 20.2" ><path transform="translate(290.49, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_md3kz5 =
    '<svg viewBox="293.2 242.3 1.0 20.2" ><path transform="translate(293.21, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_l0ec1i =
    '<svg viewBox="281.1 242.3 1.0 20.2" ><path transform="translate(281.12, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lcaj =
    '<svg viewBox="264.4 268.5 1.0 19.4" ><path transform="translate(264.4, 268.5)" d="M 0.09765625 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yormcd =
    '<svg viewBox="268.2 268.5 1.0 19.4" ><path transform="translate(268.17, 268.5)" d="M 0.3310546875 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ufja0 =
    '<svg viewBox="272.5 268.5 1.0 19.4" ><path transform="translate(272.5, 268.5)" d="M 0 0 L 0.1318359375 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dcx164 =
    '<svg viewBox="276.5 268.5 1.0 19.4" ><path transform="translate(276.5, 268.5)" d="M 0 0 L 0.2490234375 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ule6p =
    '<svg viewBox="284.3 268.5 1.0 19.4" ><path transform="translate(284.31, 268.5)" d="M 0.1904296875 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_keuec8 =
    '<svg viewBox="287.3 268.5 1.0 19.4" ><path transform="translate(287.28, 268.5)" d="M 0.2236328125 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_izqcxj =
    '<svg viewBox="290.5 268.5 1.0 19.4" ><path transform="translate(290.49, 268.5)" d="M 0.0068359375 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o62gh =
    '<svg viewBox="293.2 268.5 1.0 19.4" ><path transform="translate(293.21, 268.5)" d="M 0.291015625 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h5wa =
    '<svg viewBox="264.4 268.3 1.0 20.2" ><path transform="translate(264.4, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s28bog =
    '<svg viewBox="268.2 268.3 1.0 20.2" ><path transform="translate(268.17, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e78g0v =
    '<svg viewBox="272.6 268.3 1.0 20.2" ><path transform="translate(272.63, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tmu9ev =
    '<svg viewBox="276.7 268.3 1.0 20.2" ><path transform="translate(276.75, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rcty5 =
    '<svg viewBox="284.3 268.3 1.0 20.2" ><path transform="translate(284.31, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jzmhph =
    '<svg viewBox="287.3 268.3 1.0 20.2" ><path transform="translate(287.28, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v0z2r6 =
    '<svg viewBox="290.5 268.3 1.0 20.2" ><path transform="translate(290.49, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ct3v2v =
    '<svg viewBox="293.2 268.3 1.0 20.2" ><path transform="translate(293.21, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e5t40i =
    '<svg viewBox="281.1 268.3 1.0 20.2" ><path transform="translate(281.12, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
