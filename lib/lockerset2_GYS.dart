import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class lockerset2_GYS extends StatelessWidget {
  lockerset2_GYS({Key? key}) : super(key: key);
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

                      // ------------------- map -------------------------
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 203), // lockr front of 6g09
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffafafaf),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, start: 61),
                        Pin(size: 24.0, start: 381), // lockr front of 6g03
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
                        Pin(size: 18.0, start: 37.1),
                        Pin(size: 24.0, start: 381), // lockr front of 6g03
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
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 180), // lockr front of 6g09
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffafafaf),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 152.7, start: 24.1),
                        Pin(size: 218.1, start: 166), // middle area
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 44.3),
                        Pin(size: 16.0, start: 230), // 6G02
                        child: Text(
                          '6G02',
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
                        Pin(size: 53.0, start: 39.9),
                        Pin(size: 16.0, start: 180), // 6G01
                        child: Text(
                          '6G01',
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
                        Pin(size: 96.8, start: 24.1),
                        Pin(size: 74.9, start: 408), // 6G03 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc51f),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 43.1),
                        Pin(size: 16.0, start: 440), // 6G03
                        child: Text(
                          '6G03',
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
                        Pin(size: 47.1, start: 24.3),
                        Pin(size: 27.4, start: 266), // stairs base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff1c0000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 49.0),
                        Pin(size: 27.1, start: 266), // stairs line
                        child: SvgPicture.string(
                          _svg_keikg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 44.3),
                        Pin(size: 27.1, start: 266), // stairs line
                        child: SvgPicture.string(
                          _svg_xhp1c,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 39.6),
                        Pin(size: 27.1, start: 266), // stairs line
                        child: SvgPicture.string(
                          _svg_bj8reo,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 34.9),
                        Pin(size: 27.1, start: 266), // stairs line
                        child: SvgPicture.string(
                          _svg_dwbxvk,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 26.8),
                        Pin(size: 27.1, start: 266), // stairs line
                        child: SvgPicture.string(
                          _svg_dw3n40,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 59.5, start: 302), // 6g06 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 63.0, start: 240), // 6g07 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 24.7, start: 216), // exit box
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff7dd871),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 64.7, start: 152), // 6g09 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 64.3, start: 88.3), // 6g11 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, end: 39.1),
                        Pin(size: 16.0, start: 112.5), // 6G11
                        child: Text(
                          '6G11',
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
                        Pin(size: 65.0, end: 41.0),
                        Pin(size: 16.0, start: 180), // 6G09
                        child: Text(
                          '6G09',
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
                        Pin(size: 65.0, end: 39.9),
                        Pin(size: 16.0, start: 265), // 6G07
                        child: Text(
                          '6G07',
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
                        Pin(size: 65.0, end: 39.9),
                        Pin(size: 16.0, start: 325), // 6G06
                        child: Text(
                          '6G06',
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
                        Pin(size: 42.0, middle: 0.817),
                        Pin(size: 14.0, start: 222), // Exit
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
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 29.3, start: 361), // empty class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 93.1, start: 390), //6G05 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, end: 39.1),
                        Pin(size: 16.0, start: 430), //6G05
                        child: Text(
                          '6G05',
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
                        Pin(size: 55.4, middle: 0.4515),
                        Pin(size: 78.6, start: 88.3), //6G10 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.4582),
                        Pin(size: 16.0, start: 125.0), //6G10
                        child: Text(
                          '6G10',
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
                        Pin(size: 94.7, middle: 0.5291),
                        Pin(size: 75.1, start: 408), // 6G04 calss
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc51f),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 62.6, middle: 0.4364),
                        Pin(size: 57.7, start: 167), //grey box
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe4e4e4),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.5195),
                        Pin(size: 16.0, start: 440), //6G04
                        child: Text(
                          '6G04',
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
                        Pin(size: 18.0, middle: 0.2764),
                        Pin(size: 24.0, start: 381), // locker front of 6G03
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
                        Pin(size: 18.0, middle: 0.3747),
                        Pin(size: 24.0, start: 381), // locker front of 6G03
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
                        Pin(size: 18.0, middle: 0.1729),
                        Pin(size: 24.0, start: 336), // locker under stairs
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffafafaf),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.1729),
                        Pin(size: 24.0, start: 312), // locker under stairs
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffafafaf),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, start: 50.4),
                        Pin(size: 24.0, start: 290), //locker under stairs
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
                        Pin(size: 18.0, start: 27.3),
                        Pin(size: 24.0, start: 290), // locker under stairs
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
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 257), // locker front of 6G07
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffafafaf),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 235), // locker front of 6G07
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffafafaf),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.1732),
                        Pin(size: 24.0, start: 360), // locker under stairs
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffafafaf),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 30.9),
                        Pin(size: 27.1, start: 266), // stairs line
                        child: SvgPicture.string(
                          _svg_j0qngg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 0.5, middle: 0.2202),
                        Pin(size: 119.0, start: 266), // behind lockers line
                        child: SvgPicture.string(
                          _svg_xekqzk,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      //-----------------------------------------------

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

const String _svg_keikg =
    '<svg viewBox="49.0 266.8 1.0 27.1" ><path transform="translate(49.0, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xhp1c =
    '<svg viewBox="44.3 266.8 1.0 27.1" ><path transform="translate(44.3, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bj8reo =
    '<svg viewBox="39.6 266.8 1.0 27.1" ><path transform="translate(39.6, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dwbxvk =
    '<svg viewBox="34.9 266.8 1.0 27.1" ><path transform="translate(34.9, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dw3n40 =
    '<svg viewBox="26.8 266.8 1.0 27.1" ><path transform="translate(26.8, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j0qngg =
    '<svg viewBox="30.9 266.8 1.0 27.1" ><path transform="translate(30.9, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xekqzk =
    '<svg viewBox="70.9 266.5 1.0 119.0" ><path transform="translate(70.91, 266.5)" d="M 0 0 L 0 119" fill="none" stroke="#1c0000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
