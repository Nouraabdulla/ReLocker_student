import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relocker_sa/editfgzone.dart';

import 'controller_view_screen.dart';
import 'editfozone.dart';
import 'editfpzone.dart';
import 'editfyzone.dart';
import 'lockerset1_fg.dart';
import 'lockerset1_fo.dart';
import 'lockerset1_fp.dart';
import 'lockerset1_fp.dart';
import 'lockerset1_fy.dart';

class first extends StatelessWidget {
  final int? numberOfWeek;
  final String? resId;
  final String? startDate;
  final String? endDate;
  final String? from;
  final String? option;
  first({
    Key? key,
    this.numberOfWeek,
    this.resId,
    this.startDate,
    this.endDate,
    this.from = '1',
    this.option = "",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xff88d8bb),
        title: Text("Choose zone"),
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ControllerViewScreen()));
              },
              child: Text("Cancle", style: TextStyle(color: Colors.black)))
        ], /* textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 20,
                  color: Colors.black,
                ))*/
      ),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 14.0, end: -0.2),
            Pin(size: 686.3, end: 7), // whole map
            child: Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 600.0,
                  height: 686.0,
                  child: Stack(
                    children: <Widget>[
                      // ----------  Green zone ----------
                      Pinned.fromPins(
                        Pin(size: 51.0, start: 6.0),
                        Pin(size: 29.0, start: 107.0), //exit green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff7dd871),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 51.0, start: 6.0),
                        Pin(size: 107.0, start: 0.0), // 6F27 green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 51.0, start: 6.0),
                        Pin(size: 29.0, start: 78.0), //6F28, 6F34 green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 51.0, start: 6.0),
                        Pin(size: 46.0, middle: 0.2077), // 6F36 green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 51.0, start: 6.0),
                        Pin(size: 40.0, middle: 0.2723), // 6F37 green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 51.0, start: 6.0),
                        Pin(size: 99.0, start: 216), // 6F49 green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 8.0, start: 113),
                        Pin(
                            size: 36.0,
                            middle: 0.4291), // strais base green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 18.0, start: 96),
                        Pin(
                            size: 36.0,
                            middle: 0.4291), // between strais bases green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, start: 119),
                        Pin(
                            size: 36.0,
                            middle: 0.4291), // strais base green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 75.0, start: 132.0),
                        Pin(size: 62.0, start: 0.0), // 6F25 green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 75.0, start: 57.0),
                        Pin(size: 62.0, start: 0.0), // 6F26 green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 96),
                        Pin(size: 1.0, middle: 0.4338), // strais line
                        child: SvgPicture.string(
                          _svg_nnqg92,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 96),
                        Pin(size: 1.0, middle: 0.4295), // strais line
                        child: SvgPicture.string(
                          _svg_u9wn5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 96),
                        Pin(size: 1.0, middle: 0.4382), // strais line
                        child: SvgPicture.string(
                          _svg_es9wy,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 96),
                        Pin(size: 1.0, middle: 0.4425), // strais line
                        child: SvgPicture.string(
                          _svg_jljbho,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 96),
                        Pin(size: 1.0, middle: 0.4251), // strais line
                        child: SvgPicture.string(
                          _svg_i1mcg2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 17.3, start: 119),
                        Pin(size: 1.0, middle: 0.4338), // strais line
                        child: SvgPicture.string(
                          _svg_nnqg92,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 119),
                        Pin(size: 1.0, middle: 0.4295), // strais line
                        child: SvgPicture.string(
                          _svg_u9wn5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 119),
                        Pin(size: 1.0, middle: 0.4382), // strais line
                        child: SvgPicture.string(
                          _svg_es9wy,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 119),
                        Pin(size: 1.0, middle: 0.4425), // strais line
                        child: SvgPicture.string(
                          _svg_jljbho,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 119),
                        Pin(size: 1.0, middle: 0.4251), // strais line
                        child: SvgPicture.string(
                          _svg_i1mcg2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 6.0, start: 90),
                        Pin(
                            size: 36.0,
                            middle:
                                0.4291), // wall between strais and lockers in green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 53.0, start: 5.0),
                        Pin(size: 16.0, middle: 0.3551), //6F49
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
                        Pin(size: 53.0, start: 5.0),
                        Pin(size: 30.0, start: 80), //6F28 6F34
                        child: Text(
                          '6F28 6F34',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff1c0000),
                            height: 1,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 5.0),
                        Pin(size: 16.0, middle: 0.285), //6F37
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
                        Pin(size: 53.0, start: 5.0),
                        Pin(size: 16.0, middle: 0.2223), //6F36
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
                        Pin(size: 53.0, start: 4.0),
                        Pin(size: 16.0, start: 23.0), //6F27
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
                        Pin(size: 75.0, start: 57.0),
                        Pin(size: 62.0, start: 24.0), //6F26
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
                        Pin(size: 75.0, start: 132.0),
                        Pin(size: 62.0, start: 24.0), //6F25
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
                        Pin(size: 17.3, start: 96),
                        Pin(size: 1.0, middle: 0.4469), // strais line
                        child: SvgPicture.string(
                          _svg_o0btzw,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 96),
                        Pin(size: 1.0, middle: 0.4512), // strais line
                        child: SvgPicture.string(
                          _svg_jirv31,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 96),
                        Pin(size: 1.0, middle: 0.4556), // strais line
                        child: SvgPicture.string(
                          _svg_jbkp9b,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 17.3, start: 119),
                        Pin(size: 1.0, middle: 0.4469), // strais line
                        child: SvgPicture.string(
                          _svg_o0btzw,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 119),
                        Pin(size: 1.0, middle: 0.4512), // strais line
                        child: SvgPicture.string(
                          _svg_jirv31,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.3, start: 119),
                        Pin(size: 1.0, middle: 0.4556), // strais line
                        child: SvgPicture.string(
                          _svg_jbkp9b,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 17.0, start: 157),
                        Pin(size: 5.0, start: 125.0), // between stair2 bases
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 19.0, start: 174),
                        Pin(
                            size: 5.0,
                            start: 125.0), // between stair2 bases with lines
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, start: 157),
                        Pin(size: 14.0, start: 111.0), // strais2 base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 19.0, start: 174),
                        Pin(size: 14.0, start: 111.0), //strais2 base with lines
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 177),
                        Pin(size: 13.0, start: 111.7), //strais2 line
                        child: SvgPicture.string(
                          _svg_whisr,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 179),
                        Pin(size: 13.0, start: 111.7), //strais2 line
                        child: SvgPicture.string(
                          _svg_c378nl,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 181),
                        Pin(size: 13.0, start: 111.7), //strais2 line
                        child: SvgPicture.string(
                          _svg_kmal,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 183),
                        Pin(size: 13.0, start: 111.7), //strais2 line
                        child: SvgPicture.string(
                          _svg_l4l1fr,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 185),
                        Pin(size: 13.0, start: 111.7), //strais2 line
                        child: SvgPicture.string(
                          _svg_f7oos5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 187),
                        Pin(size: 13.0, start: 111.7), //strais2 line
                        child: SvgPicture.string(
                          _svg_f7oos5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 189),
                        Pin(size: 13.0, start: 111.7), //strais2 line
                        child: SvgPicture.string(
                          _svg_f7oos5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, start: 157),
                        Pin(size: 14.0, middle: 0.1904), // strais2 base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 19.0, start: 174),
                        Pin(
                            size: 14.0,
                            middle: 0.1904), // strais2 base with lines
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 177),
                        Pin(size: 13.0, middle: 0.191), //strais2 line
                        child: SvgPicture.string(
                          _svg_jtd0io,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 177),
                        Pin(size: 13.0, middle: 0.191), //strais2 line
                        child: SvgPicture.string(
                          _svg_jtd0io,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 179),
                        Pin(size: 13.0, middle: 0.191), //strais2 line
                        child: SvgPicture.string(
                          _svg_jtd0io,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 181),
                        Pin(size: 13.0, middle: 0.191), //strais2 line
                        child: SvgPicture.string(
                          _svg_jtd0io,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 183),
                        Pin(size: 13.0, middle: 0.191), //strais2 line
                        child: SvgPicture.string(
                          _svg_jtd0io,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 185),
                        Pin(size: 13.0, middle: 0.191), //strais2 line
                        child: SvgPicture.string(
                          _svg_jtd0io,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 187),
                        Pin(size: 13.0, middle: 0.191), //strais2 line
                        child: SvgPicture.string(
                          _svg_jtd0io,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 189),
                        Pin(size: 13.0, middle: 0.191), //strais2 line
                        child: SvgPicture.string(
                          _svg_jtd0io,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 67.0, start: 90.0),
                        Pin(size: 89.0, start: 112.0), // 6F35 green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 67.0, start: 90.0),
                        Pin(size: 79.0, start: 200.0), // 6F38 green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 97),
                        Pin(size: 16.0, start: 215), // 6F38
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
                        Pin(size: 67.0, start: 90.0),
                        Pin(
                            size: 42.0,
                            start: 240), // photocopy room green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 60.0, start: 94),
                        Pin(size: 50.0, start: 249), // 6G38
                        child: Text(
                          'photocopy room',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff1c0000),
                            height: 1,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 235.0, start: 150.0),
                        Pin(
                            size: 22.0,
                            start: 260), // photocopy room green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 103.0, start: 90.0),
                        Pin(size: 38.0, start: 74.0), // above 6F35
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 97),
                        Pin(size: 16.0, middle: 0.2223), //6F35
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
                        Pin(size: 17.0, start: 157),
                        Pin(size: 1.0, start: 126.4), // strais2 line
                        child: SvgPicture.string(
                          _svg_ola6l,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.0, start: 157),
                        Pin(size: 1.0, start: 127.4), //strais2 line
                        child: SvgPicture.string(
                          _svg_rmkt,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 17.0, start: 157),
                        Pin(size: 1.0, start: 125.4), // strais2 line
                        child: SvgPicture.string(
                          _svg_duy9hk,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 37.0, start: 12.0),
                        Pin(size: 14.0, start: 115.0), // Exit green zone
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

                      // --------- orange zone ----------

                      Pinned.fromPins(
                        Pin(size: 85.0, end: 190.7),
                        Pin(size: 62.0, start: 0.0), // 6F21 orange zone
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 131.0, end: 140.0),
                        Pin(size: 158.5, start: 74.9), // orange zone middle
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, end: 205.1),
                        Pin(size: 16.0, start: 24), // 6F21
                        child: Text(
                          '6F21',
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
                        Pin(size: 34.0, end: 236.7),
                        Pin(
                            size: 158.5,
                            start:
                                74.9), //grey area in the middle of orange zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 228.0, end: 215),
                        Pin(size: 140.0, middle: 0.26), // patio box
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 235.0, start: 150.0),
                        Pin(
                            size: 22.0,
                            start: 260), // photocopy room green zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 54.0, start: 235),
                        Pin(size: 21.0, start: 265), // patio
                        child: Text(
                          '6F47',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff1c0000),
                            height: 1,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // ---------- purple zone ---------------
                      Pinned.fromPins(
                        Pin(size: 54.0, start: 5.5),
                        Pin(size: 74.5, end: 0.0), // 6F54 purple zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 76.0, start: 59.5),
                        Pin(size: 59.3, end: 0.0), // 6F55 purple zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.9, start: 5.5),
                        Pin(size: 60.0, end: 92.1), // 6F53 purple zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.9, start: 5.5),
                        Pin(size: 146, middle: 0.6994), // 6F50 purple zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 105.0, start: 90),
                        Pin(size: 175.8, end: 74.4), // 6f48, 6G51 purple zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 42.0, start: 90),
                        Pin(size: 60.0, middle: 0.603), // area above 6G48, 6G51
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 76.0, start: 135),
                        Pin(size: 59.3, end: 0.0), // 6f56 purple zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 147),
                        Pin(size: 16.0, end: 16.9), //6F56
                        child: Text(
                          '6F56',
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
                        Pin(size: 53.0, start: 70),
                        Pin(size: 16.0, end: 18.9), //6F55
                        child: Text(
                          '6F55',
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
                        Pin(size: 53.0, start: 6),
                        Pin(size: 16.0, end: 19.2), // 6F54
                        child: Text(
                          '6F54',
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
                        Pin(size: 65.0, start: 0.5),
                        Pin(size: 16.0, end: 110.3), //6F53
                        child: Text(
                          '6F53',
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
                        Pin(size: 65.0, start: 0.5),
                        Pin(size: 16.0, end: 250), // 6F50
                        child: Text(
                          '6F50',
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
                        Pin(size: 53.0, start: 95),
                        Pin(size: 16.0, middle: 0.7713), //6F51
                        child: Text(
                          '6F51',
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
                        Pin(size: 53.0, start: 145),
                        Pin(size: 16.0, middle: 0.6675), //6F48
                        child: Text(
                          '6F48',
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
                        Pin(size: 53.9, start: 5.5),
                        Pin(size: 63.0, end: 143), // 6F52 purple zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 0.0),
                        Pin(size: 16.0, end: 160), //6F52
                        child: Text(
                          '6F52',
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
                        Pin(size: 53.9, start: 5.5),
                        Pin(size: 19.0, end: 74.5), // Exit box purple zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff7dd871),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 42.0, start: 10.3),
                        Pin(size: 12.0, end: 79.0), //Exit purple zone
                        child: Text(
                          'Exit',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            height: 5.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 46.6, start: 90),
                        Pin(
                            size: 47.0,
                            middle: 0.6842), // big grey box on 6f52, 6f53
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
                        Pin(size: 48.6, start: 148),
                        Pin(
                            size: 47.0,
                            end: 120), // big white box on 6f52, 6f53
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 44.0, start: 90),
                        Pin(size: 17.0, end: 74.4), // WC box purple zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, start: 100),
                        Pin(size: 10.0, end: 77.4), //WC
                        child: Text(
                          'WC',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 8,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            height: 5.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 20.5, start: 175),
                        Pin(
                            size: 38.8,
                            end: 74.4), // small grey box on 6f52, 6f53
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

                      //-------------------------------------

                      // ------------ yellow zone --------------
                      Pinned.fromPins(
                        Pin(size: 119.0, end: 148),
                        Pin(size: 165.0, end: 75.2), // 6f6, 6f11 yellow zone
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
                        Pin(size: 53.0, end: 155),
                        Pin(size: 16.0, middle: 0.7922), // 6f6
                        child: Text(
                          '6F6',
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
                        Pin(size: 53.0, end: 200),
                        Pin(size: 16.0, middle: 0.6987), // 6F11
                        child: Text(
                          '6F11',
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
                        Pin(size: 48.6, end: 219),
                        Pin(size: 47.0, end: 120), // big white box on 6f6, 6f11
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 76.0, end: 190.7),
                        Pin(size: 59.2, end: 0.0), // 6F1 yellow zone
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
                        Pin(size: 53.0, end: 200),
                        Pin(size: 16.0, end: 16.7), // 6F1
                        child: Text(
                          '6F1',
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
                        Pin(size: 27.0, end: 240),
                        Pin(
                            size: 10.0,
                            end: 90), // between stairs bases yellow zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff1c0000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, end: 240),
                        Pin(size: 18.0, end: 97), // stairs base yellow zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff1c0000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, end: 240),
                        Pin(size: 18.0, end: 75), // stairs base yellow zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff1c0000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 1.0, end: 262),
                        Pin(size: 17.8, end: 97), // stairs line
                        child: SvgPicture.string(
                          _svg_huonf3,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 258),
                        Pin(size: 17.8, end: 97), // stairs line
                        child: SvgPicture.string(
                          _svg_olshmi,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 255),
                        Pin(size: 17.8, end: 97), // stairs line
                        child: SvgPicture.string(
                          _svg_pybd6k,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 252),
                        Pin(size: 17.8, end: 97), // stairs line
                        child: SvgPicture.string(
                          _svg_cildt2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 1.0, end: 262),
                        Pin(size: 17.8, end: 75), // stairs line
                        child: SvgPicture.string(
                          _svg_huonf3,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 258),
                        Pin(size: 17.8, end: 75), // stairs line
                        child: SvgPicture.string(
                          _svg_olshmi,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 255),
                        Pin(size: 17.8, end: 75), // stairs line
                        child: SvgPicture.string(
                          _svg_pybd6k,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 252),
                        Pin(size: 17.8, end: 75), // stairs line
                        child: SvgPicture.string(
                          _svg_cildt2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 80.1, start: 228),
                        Pin(
                            size: 145.6,
                            end:
                                100.0), // grey box between yellow and orange zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      //------------------------------------------

                      // ---------------- orange zone -----------------
                      Pinned.fromPins(
                        Pin(size: 75, end: 140.0),
                        Pin(size: 74.0, middle: 0.3789), // 6F13 orange zone
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, end: 154),
                        Pin(size: 16.0, middle: 0.3925), //6F13
                        child: Text(
                          '6F15',
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
                        Pin(size: 53.0, end: 154),
                        Pin(size: 16.0, middle: 0.2827), // 6F17
                        child: Text(
                          '6F17',
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

                      // -------------------------------------

                      // ---------------- yellow zone ------------------
                      Pinned.fromPins(
                        Pin(size: 54.0, end: 57.0),
                        Pin(size: 46.0, end: 98.5), // 6F5 yellow zone
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
                        Pin(size: 54.0, end: 57),
                        Pin(size: 49.0, middle: 0.7753), // 6F7 yellow zone
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
                        Pin(size: 54.0, end: 57),
                        Pin(size: 19.0, middle: 0.7138), // Exit box yellow zone
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
                        Pin(size: 54.0, end: 57),
                        Pin(size: 51.0, middle: 0.6697), // 6F8 yellow zone
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
                        Pin(size: 54.0, end: 57),
                        Pin(size: 48.0, middle: 0.5918), // 6F9 yellow zone
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

                      //---------------------------------------

                      // ----------------- orange zone ----------------
                      Pinned.fromPins(
                        Pin(size: 54.0, end: 57),
                        Pin(size: 88.0, start: 0.0), // 6F19 orange zone
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 80.0, end: 111),
                        Pin(size: 62.0, start: 0.0), // 6F20 orange zone
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 54.0, end: 57.0),
                        Pin(size: 65.0, start: 97.7), // above 6F16 orange zone
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, end: 89.0),
                        Pin(
                            size: 65.0,
                            start: 97.7), // above 6F16 orange zone grey area
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
                        Pin(size: 54.0, end: 57.0),
                        Pin(size: 45.0, start: 162.7), // 6F16 orange zone
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 54.0, end: 57.0),
                        Pin(size: 45.0, start: 208), // 6F14 orange zone
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 54.0, end: 57.0),
                        Pin(size: 45.0, start: 248), // 6F13 orange zone
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 54.0, end: 57.0),
                        Pin(size: 35.0, start: 289), // 6F12 orange zone
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, end: 125.7),
                        Pin(size: 16.0, start: 24), //6F20
                        child: Text(
                          '6F20',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xe31c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, end: 58),
                        Pin(size: 16.0, start: 24), // 6F18
                        child: Text(
                          '6F19',
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
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, start: 180), //6F16
                        child: Text(
                          '6F16',
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
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, start: 220), // 6F14
                        child: Text(
                          '6F14',
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
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, start: 260), //6F13
                        child: Text(
                          '6F13',
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
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, start: 297), //6F12
                        child: Text(
                          '6F12',
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
                      //---------------------------------------

                      // ------------------ yellow zone ----------------------
                      Pinned.fromPins(
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, middle: 0.5993), // 6F9
                        child: Text(
                          '6F9',
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
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, middle: 0.6675), // 6F8
                        child: Text(
                          '6F8',
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
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, middle: 0.7595), // 6F7
                        child: Text(
                          '6F7',
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
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, end: 113.4), // 6F5
                        child: Text(
                          '6F5',
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
                        Pin(size: 42.0, end: 59),
                        Pin(size: 12.0, middle: 0.7117), // Exit yellow zone
                        child: Text(
                          'Exit',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            height: 5.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // --------------------------------------------

                      // ------------------- orange zone -----------------
                      Pinned.fromPins(
                        Pin(size: 44.0, end: 140),
                        Pin(size: 17.0, middle: 0.4568), // wc box orange zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffdfbe),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, end: 150),
                        Pin(size: 10.0, middle: 0.458), // WC orange zone
                        child: Text(
                          'WC',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 8,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            height: 5.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 54.1, end: 57),
                        Pin(size: 21.2, start: 88.3), //Exit box orange zone
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
                        Pin(size: 30.0, end: 70),
                        Pin(size: 12.0, start: 91.9), // exit orange zone
                        child: Text(
                          'Exit',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            height: 5.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 44.0, end: 140),
                        Pin(size: 17.0, start: 74.9), // WC box orange zone
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffdfbe),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, end: 150),
                        Pin(size: 10.0, start: 78.4), // WC orange zone
                        child: Text(
                          'WC',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 8,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            height: 5.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      //--------------------------------------------

                      //------------------- yellow zone ---------------
                      Pinned.fromPins(
                        Pin(size: 54.0, end: 57),
                        Pin(size: 31.0, end: 69.2), // 6F4 yellow zone
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
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, end: 78.4), // 6F4
                        child: Text(
                          '6F4',
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
                        Pin(size: 54.0, end: 57),
                        Pin(size: 71.2, end: 0.0), // 6F3  yellow zone
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
                        Pin(size: 65.0, end: 50),
                        Pin(size: 16.0, end: 19.2), //6F3
                        child: Text(
                          '6F3',
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
                        Pin(size: 42.0, end: 148),
                        Pin(size: 69.0, middle: 0.6118), // 6F10  yellow zone
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
                        Pin(size: 53.0, end: 142),
                        Pin(size: 16.0, middle: 0.6037), // 6F10
                        child: Text(
                          '6F10',
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
                        Pin(size: 80.2, end: 111),
                        Pin(size: 59.5, end: 0.0), // 6F2 yellow zone
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
                        Pin(size: 46.6, end: 148),
                        Pin(
                            size: 47.0,
                            middle: 0.6997), // grey area yellow zone
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
                        Pin(size: 53.0, end: 124),
                        Pin(size: 16.0, end: 16.7), //6F2
                        child: Text(
                          '6F2',
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
                      //----------------------------------------------------
                      Positioned(
                        child: Container(
                            child: OutlinedButton(
                          onPressed: () {
                            if (from == "2") {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => editfgzone(
                                            option: option,
                                          )));
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => lockerset1_fg(
                                            numberOfWeek: numberOfWeek!,
                                            resId: resId!,
                                            endDate: endDate!,
                                            startDate: startDate!,
                                          )));
                            }
                          },
                          child: Text(""),
                          style: ElevatedButton.styleFrom(
                              side: BorderSide.none, fixedSize: Size(215, 315)),
                        )),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                            child: OutlinedButton(
                          onPressed: () {
                            if (from == "2") {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => editfpzone(
                                            option: option,
                                          )));
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => lockerset1_fp(
                                            numberOfWeek: numberOfWeek!,
                                            resId: resId!,
                                            endDate: endDate!,
                                            startDate: startDate!,
                                          )));
                            }
                          },
                          child: Text(""),
                          style: ElevatedButton.styleFrom(
                              side: BorderSide.none, fixedSize: Size(215, 315)),
                        )),
                      ),
                      Positioned(
                        right: 50,
                        child: Container(
                            child: OutlinedButton(
                          onPressed: () {
                            if (from == "2") {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => editfozone(
                                            option: option,
                                          )));
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => lockerset1_fo(
                                            numberOfWeek: numberOfWeek!,
                                            resId: resId!,
                                            endDate: endDate!,
                                            startDate: startDate!,
                                          )));
                            }
                          },
                          child: Text(""),
                          style: ElevatedButton.styleFrom(
                              side: BorderSide.none, fixedSize: Size(215, 315)),
                        )),
                      ),
                      Positioned(
                        right: 50,
                        bottom: 0,
                        child: Container(
                            child: OutlinedButton(
                          onPressed: () {
                            if (from == "2") {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => editfyzone(
                                            option: option,
                                          )));
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => lockerset1_fy(
                                            numberOfWeek: numberOfWeek!,
                                            resId: resId!,
                                            endDate: endDate!,
                                            startDate: startDate!,
                                          )));
                            }
                          },
                          child: Text(""),
                          style: ElevatedButton.styleFrom(
                              side: BorderSide.none, fixedSize: Size(225, 315)),
                        )),
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

const String _svg_nnqg92 =
    '<svg viewBox="100.3 297.3 17.1 1.0" ><path transform="translate(100.29, 297.28)" d="M 0 0 L 17.0576171875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u9wn5 =
    '<svg viewBox="100.3 294.3 17.1 1.0" ><path transform="translate(100.29, 294.29)" d="M 0 0 L 17.0576171875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_es9wy =
    '<svg viewBox="100.3 300.3 17.1 1.0" ><path transform="translate(100.29, 300.26)" d="M 0 0 L 17.0576171875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jljbho =
    '<svg viewBox="100.3 303.2 17.1 1.0" ><path transform="translate(100.29, 303.25)" d="M 0 0 L 17.0576171875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r6mx =
    '<svg viewBox="100.3 305.2 17.1 1.0" ><path transform="translate(100.29, 305.24)" d="M 0 0 L 17.0576171875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i1mcg2 =
    '<svg viewBox="100.3 291.3 17.1 1.0" ><path transform="translate(100.29, 291.31)" d="M 0 0 L 17.0576171875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o0btzw =
    '<svg viewBox="100.3 306.2 17.1 1.0" ><path transform="translate(100.29, 306.23)" d="M 0 0 L 17.0576171875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jirv31 =
    '<svg viewBox="100.3 309.2 17.1 1.0" ><path transform="translate(100.29, 309.22)" d="M 0 0 L 17.0576171875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jbkp9b =
    '<svg viewBox="100.3 312.2 17.1 1.0" ><path transform="translate(100.29, 312.2)" d="M 0 0 L 17.0576171875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_q1f7r =
    '<svg viewBox="180.7 112.2 1.0 13.0" ><path transform="translate(180.72, 112.19)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yx0wj8 =
    '<svg viewBox="182.7 112.2 1.0 13.0" ><path transform="translate(182.71, 112.19)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i4edzk =
    '<svg viewBox="184.7 112.2 1.0 13.0" ><path transform="translate(184.71, 112.19)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wg6e1 =
    '<svg viewBox="186.7 112.2 1.0 13.0" ><path transform="translate(186.7, 112.19)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b3kdkb =
    '<svg viewBox="188.7 112.2 1.0 13.0" ><path transform="translate(188.7, 112.19)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vwngiv =
    '<svg viewBox="190.7 112.2 1.0 13.0" ><path transform="translate(190.7, 112.19)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ce9 =
    '<svg viewBox="192.7 112.2 1.0 13.0" ><path transform="translate(192.69, 112.19)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bunf23 =
    '<svg viewBox="194.7 112.2 1.0 13.0" ><path transform="translate(194.69, 112.19)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mjn1rn =
    '<svg viewBox="180.7 112.7 1.0 13.0" ><path transform="translate(180.72, 112.71)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_blxpf2 =
    '<svg viewBox="182.7 112.7 1.0 13.0" ><path transform="translate(182.71, 112.71)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n2wmc6 =
    '<svg viewBox="184.7 112.7 1.0 13.0" ><path transform="translate(184.71, 112.71)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_whisr =
    '<svg viewBox="186.7 112.7 1.0 13.0" ><path transform="translate(186.7, 112.71)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c378nl =
    '<svg viewBox="188.7 112.7 1.0 13.0" ><path transform="translate(188.7, 112.71)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kmal =
    '<svg viewBox="190.7 112.7 1.0 13.0" ><path transform="translate(190.7, 112.71)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_l4l1fr =
    '<svg viewBox="192.7 112.7 1.0 13.0" ><path transform="translate(192.69, 112.71)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f7oos5 =
    '<svg viewBox="194.7 112.7 1.0 13.0" ><path transform="translate(194.69, 112.71)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_orxul =
    '<svg viewBox="180.7 128.4 1.0 13.0" ><path transform="translate(180.72, 128.42)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wyadwe =
    '<svg viewBox="182.7 128.4 1.0 13.0" ><path transform="translate(182.71, 128.42)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_k34wme =
    '<svg viewBox="184.7 128.4 1.0 13.0" ><path transform="translate(184.71, 128.42)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uoin =
    '<svg viewBox="186.7 128.4 1.0 13.0" ><path transform="translate(186.7, 128.42)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_k3v8gz =
    '<svg viewBox="188.7 128.4 1.0 13.0" ><path transform="translate(188.7, 128.42)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mwclm7 =
    '<svg viewBox="190.7 128.4 1.0 13.0" ><path transform="translate(190.7, 128.42)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rv13 =
    '<svg viewBox="192.7 128.4 1.0 13.0" ><path transform="translate(192.69, 128.42)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vwwf9 =
    '<svg viewBox="194.7 128.4 1.0 13.0" ><path transform="translate(194.69, 128.42)" d="M 0 0 L 0 13.02978515625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qfi3yw =
    '<svg viewBox="180.7 128.9 1.0 13.0" ><path transform="translate(180.72, 128.94)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xnwlnn =
    '<svg viewBox="182.7 128.9 1.0 13.0" ><path transform="translate(182.71, 128.94)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xq3l =
    '<svg viewBox="184.7 128.9 1.0 13.0" ><path transform="translate(184.71, 128.94)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ip9x0u =
    '<svg viewBox="186.7 128.9 1.0 13.0" ><path transform="translate(186.7, 128.94)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pl5ki =
    '<svg viewBox="188.7 128.9 1.0 13.0" ><path transform="translate(188.7, 128.94)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jtd0io =
    '<svg viewBox="190.7 128.9 1.0 13.0" ><path transform="translate(190.7, 128.94)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xdusu =
    '<svg viewBox="192.7 128.9 1.0 13.0" ><path transform="translate(192.69, 128.94)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xrggye =
    '<svg viewBox="194.7 128.9 1.0 13.0" ><path transform="translate(194.69, 128.94)" d="M 0 0 L 0 12.970947265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ola6l =
    '<svg viewBox="160.7 126.4 17.0 1.0" ><path transform="translate(160.7, 126.45)" d="M 0 0 L 17 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rmkt =
    '<svg viewBox="160.7 127.4 17.0 1.0" ><path transform="translate(160.7, 127.45)" d="M 0 0 L 17 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_duy9hk =
    '<svg viewBox="160.5 125.4 17.0 1.0" ><path transform="translate(160.5, 125.44)" d="M 0 0 L 17 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_txybe =
    '<svg viewBox="341.4 546.1 1.0 17.8" ><path transform="translate(341.37, 546.11)" d="M 0 0 L 0 17.77197265625" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_huonf3 =
    '<svg viewBox="338.7 546.1 1.0 17.8" ><path transform="translate(338.68, 546.11)" d="M 0 0 L 0 17.77197265625" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_olshmi =
    '<svg viewBox="336.0 546.1 1.0 17.8" ><path transform="translate(335.98, 546.11)" d="M 0 0 L 0 17.77197265625" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pybd6k =
    '<svg viewBox="333.3 546.1 1.0 17.8" ><path transform="translate(333.29, 546.11)" d="M 0 0 L 0 17.77197265625" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cildt2 =
    '<svg viewBox="329.7 546.1 1.0 17.8" ><path transform="translate(329.72, 546.11)" d="M 0 0 L 0 17.77197265625" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lq0udj =
    '<svg viewBox="354.0 545.3 1.0 59.3" ><path transform="translate(354.05, 545.33)" d="M 0 0 L 0 59.27197265625" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
