import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class lockerset1_FGS extends StatelessWidget {
  lockerset1_FGS({
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
            Pin(size: 90.0, start: 0.0),
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
            Pin(size: 323.0, middle: 0.5506),
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
                      Pinned.fromPins(
                        Pin(size: 18.0, start: 28.0),
                        Pin(size: 18.0, start: 40.0),
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
                        Pin(size: 21.0, start: 41.0),
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
                        Pin(size: 21.0, start: 41.0),
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
                        Pin(size: 18.0, start: 40.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: const Color(0xffff0000),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      // --------------------- map ------------------

                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 29.0, start: 217), // exit
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff7dd871),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 85.0, middle: 0.6134),
                        Pin(size: 50.0, start: 340.5), // 38
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 95.0, start: 81.0), // 27
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 50.0, start: 245.5), //36
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 51.0, start: 295), //37
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 155.0, start: 345.5), //49
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 100.0, end: 29.0),
                        Pin(size: 79.0, start: 81.0), //25
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 92.0, middle: 0.4416),
                        Pin(size: 79.0, start: 81.0), //26
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 5.0, middle: 0.4591),
                        Pin(size: 63.0, start: 438), // wall next to stairs
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 67.0, start: 35.0),
                        Pin(size: 16.0, start: 410),
                        child: Text(
                          '6F49',
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
                        Pin(size: 67.0, start: 36.0),
                        Pin(size: 16.0, start: 312),
                        child: Text(
                          '6F37',
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
                        Pin(size: 67.0, start: 36.0),
                        Pin(size: 16.0, start: 265),
                        child: Text(
                          '6F36',
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
                        Pin(size: 53.0, start: 42.0),
                        Pin(size: 16.0, start: 115.0),
                        child: Text(
                          '6F27',
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
                        Pin(size: 53.0, middle: 0.4593),
                        Pin(size: 16.0, start: 115.0),
                        child: Text(
                          '6F26',
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
                        Pin(size: 53.0, middle: 0.8185),
                        Pin(size: 16.0, start: 115.0),
                        child: Text(
                          '6F25',
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
                        Pin(size: 53.0, middle: 0.6074),
                        Pin(size: 16.0, start: 358),
                        child: Text(
                          '6F38',
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
                        Pin(size: 27.0, middle: 0.7804),
                        Pin(size: 8.0, start: 270), // between stairs2 bases
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      // Pinned.fromPins(
                      //   Pin(size: 19.0, middle: 0.7599),
                      //   Pin(size: 14.0, middle: 0.332),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: const Color(0xffe5e5e5),
                      //       border: Border.all(
                      //           width: 0.5, color: const Color(0xff000000)),
                      //     ),
                      //   ),
                      // ),
                      Pinned.fromPins(
                        Pin(size: 85.0, middle: 0.6134),
                        Pin(size: 92.0, start: 249), //35
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 148.0, end: 29.0),
                        Pin(size: 60.0, start: 190), //above 35
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.6074),
                        Pin(size: 16.0, start: 290),
                        child: Text(
                          '6F35',
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
                        Pin(size: 26.7, middle: 0.7796),
                        Pin(size: 1.0, start: 272), // stairs2 line
                        child: SvgPicture.string(
                          _svg_vtdoz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 26.7, middle: 0.7796),
                        Pin(size: 1.0, start: 274), // stairs2 line
                        child: SvgPicture.string(
                          _svg_qy4120,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7804),
                        Pin(size: 1.0, start: 275), // stairs2 line
                        child: SvgPicture.string(
                          _svg_bki7va,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 51.0, start: 43.0),
                        Pin(size: 14.0, start: 225),
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
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 382), // lockrr5
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
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 362), // lockrr4
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
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 342), // lockrr3
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
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 322), // lockrr2
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
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 302), // lockrr1
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
                        Pin(size: 36.0, end: 29.0),
                        Pin(size: 8.0, start: 270), // between stairs2
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7804),
                        Pin(size: 21.0, start: 250), // stairs2 base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 37.0, end: 29.0),
                        Pin(size: 21.0, start: 250), // stairs2 base with lines
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
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_jwxwj0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ojof1e,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_jdo9ql,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_x5e61x,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_wql7,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_gh2l2f,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 33.7),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_wjxm,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.0),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_a2raec,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_wql7,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_jf3lqy,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7804),
                        Pin(size: 21.0, start: 276), // stairs2 base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 37.0, end: 29.0),
                        Pin(size: 21.0, start: 276), // stairs2 base with line
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
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_fmijl8,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_z7pkg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_t7k9n,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_mb96g9,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_kudg25,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_wlvlh,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 33.7),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_mld9ek,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.0),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_hpf2m,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_umwa0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 85.0, middle: 0.6134),
                        Pin(size: 49.0, start: 390), // photocopy room
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 41.0, start: 176), // 6F28, 6F34
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 482), // locker10
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
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 462), // lcoker9
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
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 442), // locker8
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
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 422), // locker7
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
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 402), // locker6
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
                        Pin(size: 27.0, middle: 0.5524),
                        Pin(size: 8.0, start: 448), // between stairs1 bases
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe5e5e5),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, middle: 0.548),
                        Pin(size: 26.7, start: 438), // stairs line
                        child: SvgPicture.string(
                          _svg_s083ni,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, middle: 0.5432),
                        Pin(size: 26.7, start: 438), // stairs line
                        child: SvgPicture.string(
                          _svg_n9tcsn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, middle: 0.5528),
                        Pin(size: 27.0, start: 438), // stairs line
                        child: SvgPicture.string(
                          _svg_ijzsx6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 39.0, middle: 0.5546),
                        Pin(size: 8.0, start: 478), // between stairs1 bases
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe5e5e5),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 23.0, middle: 0.6),
                        Pin(size: 63.0, start: 438), //stairs base1
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 465), // stairs line
                        child: SvgPicture.string(
                          _svg_ehqoh6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 469), // stairs line
                        child: SvgPicture.string(
                          _svg_ehqoh6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 473), // stairs line
                        child: SvgPicture.string(
                          _svg_ehqoh6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 477), // stairs line
                        child: SvgPicture.string(
                          _svg_ehqoh6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 481), // stairs line
                        child: SvgPicture.string(
                          _svg_ehqoh6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 485), // stairs line
                        child: SvgPicture.string(
                          _svg_ehqoh6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 489), // stairs line
                        child: SvgPicture.string(
                          _svg_ehqoh6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 493), // stairs line
                        child: SvgPicture.string(
                          _svg_ehqoh6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 497), // stairs line
                        child: SvgPicture.string(
                          _svg_ehqoh6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 23.0, middle: 0.5033),
                        Pin(size: 63.0, start: 438), // stairs base1
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 470), // stairs line 3
                        child: SvgPicture.string(
                          _svg_f25nbg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 467), // stairs line2
                        child: SvgPicture.string(
                          _svg_yz9joi,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 473), // stairs line4
                        child: SvgPicture.string(
                          _svg_jlxn6h,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 480), // stairs line6
                        child: SvgPicture.string(
                          _svg_nl6wmh,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 464), // stairs line1
                        child: SvgPicture.string(
                          _svg_qqde1m,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 483), // stairs line7
                        child: SvgPicture.string(
                          _svg_xk463,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 491), // stairs line9
                        child: SvgPicture.string(
                          _svg_qhdexi,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 495), // stairs line10
                        child: SvgPicture.string(
                          _svg_o9d8mh,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5034),
                        Pin(size: 1.0, start: 487), // stairs line8
                        child: SvgPicture.string(
                          _svg_dkfpg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 477), // stairs line5
                        child: SvgPicture.string(
                          _svg_yst28x,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 80.0, middle: 0.6132),
                        Pin(size: 36.0, start: 397),
                        child: Text(
                          'Photocopy room',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 1.4285714285714286,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 80.0, start: 30.0),
                        Pin(size: 36.0, start: 180),
                        child: Text(
                          '6F28\n6F34',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 1.4285714285714286,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      //--------------------------------------------

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

const String _svg_vtdoz =
    '<svg viewBox="231.0 271.5 26.7 1.0" ><path transform="translate(231.0, 271.55)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qy4120 =
    '<svg viewBox="231.0 273.1 26.7 1.0" ><path transform="translate(231.0, 273.09)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bki7va =
    '<svg viewBox="231.0 270.0 27.0 1.0" ><path transform="translate(231.0, 270.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cag22 =
    '<svg viewBox="261.4 247.6 1.0 20.3" ><path transform="translate(261.4, 247.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b0idj6 =
    '<svg viewBox="265.2 247.6 1.0 20.3" ><path transform="translate(265.17, 247.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cupjtf =
    '<svg viewBox="269.6 247.6 1.0 20.3" ><path transform="translate(269.63, 247.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sxu3jv =
    '<svg viewBox="273.7 247.6 1.0 20.3" ><path transform="translate(273.75, 247.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ybc9s5 =
    '<svg viewBox="281.3 247.6 1.0 20.3" ><path transform="translate(281.31, 247.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h2y4sn =
    '<svg viewBox="284.3 247.6 1.0 20.3" ><path transform="translate(284.28, 247.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jwxwj0 =
    '<svg viewBox="261.4 248.3 1.0 20.2" ><path transform="translate(261.4, 248.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ojof1e =
    '<svg viewBox="265.2 248.3 1.0 20.2" ><path transform="translate(265.17, 248.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jdo9ql =
    '<svg viewBox="269.6 248.3 1.0 20.2" ><path transform="translate(269.63, 248.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x5e61x =
    '<svg viewBox="273.7 248.3 1.0 20.2" ><path transform="translate(273.75, 248.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wql7 =
    '<svg viewBox="281.3 248.3 1.0 20.2" ><path transform="translate(281.31, 248.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gh2l2f =
    '<svg viewBox="284.3 248.3 1.0 20.2" ><path transform="translate(284.28, 248.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wjxm =
    '<svg viewBox="288.3 248.7 1.0 20.2" ><path transform="translate(288.28, 248.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a2raec =
    '<svg viewBox="291.0 248.7 1.0 20.2" ><path transform="translate(290.99, 248.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jf3lqy =
    '<svg viewBox="278.1 248.3 1.0 20.2" ><path transform="translate(278.12, 248.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fmijl8 =
    '<svg viewBox="261.4 274.3 1.0 20.2" ><path transform="translate(261.4, 274.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z7pkg =
    '<svg viewBox="265.2 274.3 1.0 20.2" ><path transform="translate(265.17, 274.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t7k9n =
    '<svg viewBox="269.6 274.3 1.0 20.2" ><path transform="translate(269.63, 274.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mb96g9 =
    '<svg viewBox="273.7 274.3 1.0 20.2" ><path transform="translate(273.75, 274.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kudg25 =
    '<svg viewBox="281.3 274.3 1.0 20.2" ><path transform="translate(281.31, 274.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wlvlh =
    '<svg viewBox="284.3 274.3 1.0 20.2" ><path transform="translate(284.28, 274.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mld9ek =
    '<svg viewBox="288.3 274.7 1.0 20.2" ><path transform="translate(288.28, 274.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hpf2m =
    '<svg viewBox="291.0 274.7 1.0 20.2" ><path transform="translate(290.99, 274.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_umwa0 =
    '<svg viewBox="278.1 274.3 1.0 20.2" ><path transform="translate(278.12, 274.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s083ni =
    '<svg viewBox="176.5 439.0 1.0 26.7" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 176.45, 439.0)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n9tcsn =
    '<svg viewBox="174.9 439.0 1.0 26.7" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 174.91, 439.0)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ijzsx6 =
    '<svg viewBox="178.0 439.0 1.0 27.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 178.0, 439.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zhfjgc =
    '<svg viewBox="180.6 471.2 22.4 1.0" ><path transform="translate(180.61, 471.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ehqoh6 =
    '<svg viewBox="180.6 467.0 22.4 1.0" ><path transform="translate(180.61, 466.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uxnjlb =
    '<svg viewBox="180.6 475.4 22.4 1.0" ><path transform="translate(180.61, 475.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o1f5 =
    '<svg viewBox="180.6 483.5 22.4 1.0" ><path transform="translate(180.61, 483.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nt7sq6 =
    '<svg viewBox="180.6 462.8 22.4 1.0" ><path transform="translate(180.61, 462.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hjyr19 =
    '<svg viewBox="180.6 487.7 22.4 1.0" ><path transform="translate(180.61, 487.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o27rua =
    '<svg viewBox="180.6 494.5 22.4 1.0" ><path transform="translate(180.61, 494.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qa7y5b =
    '<svg viewBox="180.6 497.9 22.4 1.0" ><path transform="translate(180.61, 497.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nv3aws =
    '<svg viewBox="180.3 491.0 22.4 1.0" ><path transform="translate(180.32, 490.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fqs4iv =
    '<svg viewBox="180.6 479.4 22.4 1.0" ><path transform="translate(180.61, 479.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f25nbg =
    '<svg viewBox="151.6 471.2 22.4 1.0" ><path transform="translate(151.61, 471.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yz9joi =
    '<svg viewBox="151.6 467.0 22.4 1.0" ><path transform="translate(151.61, 466.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jlxn6h =
    '<svg viewBox="151.6 475.4 22.4 1.0" ><path transform="translate(151.61, 475.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nl6wmh =
    '<svg viewBox="151.6 483.5 22.4 1.0" ><path transform="translate(151.61, 483.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qqde1m =
    '<svg viewBox="151.6 462.8 22.4 1.0" ><path transform="translate(151.61, 462.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xk463 =
    '<svg viewBox="151.6 487.7 22.4 1.0" ><path transform="translate(151.61, 487.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qhdexi =
    '<svg viewBox="151.6 494.5 22.4 1.0" ><path transform="translate(151.61, 494.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o9d8mh =
    '<svg viewBox="151.6 497.9 22.4 1.0" ><path transform="translate(151.61, 497.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dkfpg =
    '<svg viewBox="151.3 491.0 22.4 1.0" ><path transform="translate(151.32, 490.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yst28x =
    '<svg viewBox="151.6 479.4 22.4 1.0" ><path transform="translate(151.61, 479.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
