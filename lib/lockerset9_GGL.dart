import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class lockerset9_GGL extends StatelessWidget {
  lockerset9_GGL({
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
            Pin(size: 328.0, middle: 0.4762),
            Pin(start: 103.0, end: 0.5),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 328.0,
                  height: 870.0,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 4.0),
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
                        Pin(size: 23.0, end: 305),
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
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, end: 0.0),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_jx3xp,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, end: 0.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_o73xbw,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      Pinned.fromPins(
                        Pin(size: 78.9, end: 0.0),
                        Pin(size: 125.7, end: 24.5),
                        child: SvgPicture.string(
                          _svg_ct53v6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, end: 0.0),
                        Pin(size: 122.4, end: 100),
                        child: SvgPicture.string(
                          _svg_f2vz4y,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.6868),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_ehjdeq,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.6868),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_i06p,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.6868),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_ehjdeq,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.6868),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_i06p,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.6868),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_ehjdeq,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.6868),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_i06p,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.6868),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_ehjdeq,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.6868),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_i06p,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.6868),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_ehjdeq,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.6868),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_i06p,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      Pinned.fromPins(
                        Pin(size: 78.9, middle: 0.6868),
                        Pin(size: 125.7, end: 24.5),
                        child: SvgPicture.string(
                          _svg_fn5nh9,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.6868),
                        Pin(size: 122.4, end: 100),
                        child: SvgPicture.string(
                          _svg_nn2c3,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, middle: 0.3696),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_iye8o,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, middle: 0.3695),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_lcdqx,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      Pinned.fromPins(
                        Pin(size: 78.9, middle: 0.3696),
                        Pin(size: 125.7, end: 24.5),
                        child: SvgPicture.string(
                          _svg_aongdj,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, middle: 0.3695),
                        Pin(size: 122.4, end: 100),
                        child: SvgPicture.string(
                          _svg_dida0n,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, start: 14.1),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_u8p0r6,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, start: 14.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_plkc3n,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, start: 14.1),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_u8p0r6,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, start: 14.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_plkc3n,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, start: 14.1),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_u8p0r6,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, start: 14.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_plkc3n,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, start: 14.1),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_u8p0r6,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, start: 14.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_plkc3n,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 78.9, start: 14.1),
                      //   Pin(size: 125.7, end: -49.5),
                      //   child: SvgPicture.string(
                      //     _svg_u8p0r6,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      // Pinned.fromPins(
                      //   Pin(size: 79.0, start: 14.0),
                      //   Pin(size: 122.4, end: 26.1),
                      //   child: SvgPicture.string(
                      //     _svg_plkc3n,
                      //     allowDrawingOutsideViewBox: true,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      Pinned.fromPins(
                        Pin(size: 78.9, start: 14.1),
                        Pin(size: 125.7, end: 24.5),
                        child: SvgPicture.string(
                          _svg_aa0bz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 79.0, start: 14.0),
                        Pin(size: 122.4, end: 100),
                        child: SvgPicture.string(
                          _svg_gxlwbj,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, start: 37.0),
                        Pin(size: 18.0, end: 265), // available locker
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
                        Pin(size: 21.0, end: 265), // available locker
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
                        Pin(size: 21.0, end: 265), // not available locker
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
                        Pin(size: 18.0, end: 265), //not available locker
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: const Color(0xffff0000),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      //---------------- map -----------------
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
                          _svg_pc5jsn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 454), // stairs line
                        child: SvgPicture.string(
                          _svg_dq9,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 457), //stairs line
                        child: SvgPicture.string(
                          _svg_y6uku0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 460), // stairs line
                        child: SvgPicture.string(
                          _svg_rikeey,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 463), // stairs line
                        child: SvgPicture.string(
                          _svg_t2m7ez,
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
                          _svg_ijztxg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 470), // stairs line
                        child: SvgPicture.string(
                          _svg_g42d5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 473), // stairs line
                        child: SvgPicture.string(
                          _svg_vt7bb2,
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
                      //   Pin(size: 19.0, middle: 0.7799),
                      //   Pin(size: 14.0, middle: 0.3216),
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
                        Pin(size: 148.0, end: 29.5),
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
                          _svg_ufvtd,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 26.7, middle: 0.7818),
                        Pin(size: 1.0, start: 265), //stairs2 line
                        child: SvgPicture.string(
                          _svg_owqj6e,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7826),
                        Pin(size: 1.0, start: 264), //stairs2 line
                        child: SvgPicture.string(
                          _svg_cdt27c,
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
                          _svg_g30pb,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 481), //stairs line
                        child: SvgPicture.string(
                          _svg_rvf94,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5092),
                        Pin(size: 1.0, start: 485), //stairs line
                        child: SvgPicture.string(
                          _svg_rvf94,
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
                          _svg_dg14j8,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_czms0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_ki8akl,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_labcsp,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_qntj0z,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_ffe1h,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 34.5),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_r6og0c,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.8),
                        Pin(size: 20.3, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_jvsgsj,
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
                          _svg_y3ii6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_i2rrg0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_cwrm57,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_vet8bt,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_bqte6l,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_a05xh1,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 34.5),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_cw4x1w,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.8),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_p496xv,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_bqte6l,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 240), //stairs2 line
                        child: SvgPicture.string(
                          _svg_cy6y5k,
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
                          _svg_kfm6ml,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_lqekyz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.5),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_m6oo0q,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.5),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_t15mqk,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_rcgh3,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_z0s900,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 34.5),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_iokmfr,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.8),
                        Pin(size: 19.4, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ozvlnn,
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
                          _svg_dpab2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_h3fom0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_m9ftwt,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_re7q7,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_o437qj,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_p61ikz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 34.5),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_myrov8,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.8),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_a1y945,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_o437qj,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 267), // stairs2 line
                        child: SvgPicture.string(
                          _svg_m80hwg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      //-----------------------------------

                      Pinned.fromPins(
                        Pin(size: 18.0, start: 43.0),
                        Pin(size: 18.0, start: 37.0),
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
                        Pin(size: 106.0, start: 49.0),
                        Pin(size: 21.0, start: 38.0),
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
                        Pin(size: 127.0, end: 27.0),
                        Pin(size: 21.0, start: 38.0),
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
                        Pin(size: 18.0, middle: 0.5226),
                        Pin(size: 18.0, start: 37.0),
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
                        Pin(size: 47.0, start: 39.0),
                        Pin(size: 14.0, end: 197),
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
                        Pin(size: 47.0, middle: 0.4164),
                        Pin(size: 14.0, end: 197),
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
                        Pin(size: 47.0, middle: 0.6975),
                        Pin(size: 14.0, end: 197),
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
                        Pin(size: 47.0, end: 6.0),
                        Pin(size: 14.0, end: 197),
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
                        Pin(size: 47.0, start: 39.0),
                        Pin(size: 14.0, end: 77),
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
                        Pin(size: 47.0, middle: 0.4164),
                        Pin(size: 14.0, end: 77),
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
                        Pin(size: 47.0, middle: 0.6975),
                        Pin(size: 14.0, end: 77),
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
                        Pin(size: 47.0, end: 6.0),
                        Pin(size: 14.0, end: 77),
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

const String _svg_jx3xp =
    '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o73xbw =
    '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ct53v6 =
    '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f2vz4y =
    '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ehjdeq =
    '<svg viewBox="171.1 690.3 78.9 125.7" ><path transform="translate(-2272.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i06p =
    '<svg viewBox="171.0 618.1 79.0 122.4" ><path transform="translate(-2272.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fn5nh9 =
    '<svg viewBox="171.1 690.3 78.9 125.7" ><path transform="translate(-2272.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nn2c3 =
    '<svg viewBox="171.0 618.1 79.0 122.4" ><path transform="translate(-2272.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iye8o =
    '<svg viewBox="92.1 690.3 78.9 125.7" ><path transform="translate(-2351.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lcdqx =
    '<svg viewBox="92.0 618.1 79.0 122.4" ><path transform="translate(-2351.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aongdj =
    '<svg viewBox="92.1 690.3 78.9 125.7" ><path transform="translate(-2351.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dida0n =
    '<svg viewBox="92.0 618.1 79.0 122.4" ><path transform="translate(-2351.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u8p0r6 =
    '<svg viewBox="14.1 690.3 78.9 125.7" ><path transform="translate(-2429.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_plkc3n =
    '<svg viewBox="14.0 618.1 79.0 122.4" ><path transform="translate(-2429.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aa0bz =
    '<svg viewBox="14.1 690.3 78.9 125.7" ><path transform="translate(-2429.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gxlwbj =
    '<svg viewBox="14.0 618.1 79.0 122.4" ><path transform="translate(-2429.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uhgxe1 =
    '<svg viewBox="161.6 464.2 22.4 1.0" ><path transform="translate(161.6, 464.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mfyvgh =
    '<svg viewBox="161.6 459.0 22.4 1.0" ><path transform="translate(161.6, 458.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rjibc =
    '<svg viewBox="161.6 469.4 22.4 1.0" ><path transform="translate(161.6, 469.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d3khza =
    '<svg viewBox="161.6 474.5 22.4 1.0" ><path transform="translate(161.6, 474.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mthb3r =
    '<svg viewBox="161.6 478.0 22.4 1.0" ><path transform="translate(161.6, 478.0)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pc5jsn =
    '<svg viewBox="161.6 466.2 22.4 1.0" ><path transform="translate(161.6, 466.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dq9 =
    '<svg viewBox="161.6 462.0 22.4 1.0" ><path transform="translate(161.6, 461.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y6uku0 =
    '<svg viewBox="161.6 470.4 22.4 1.0" ><path transform="translate(161.6, 470.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rikeey =
    '<svg viewBox="161.6 478.5 22.4 1.0" ><path transform="translate(161.6, 478.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t2m7ez =
    '<svg viewBox="161.6 457.8 22.4 1.0" ><path transform="translate(161.6, 457.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ijztxg =
    '<svg viewBox="161.6 482.7 22.4 1.0" ><path transform="translate(161.6, 482.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g42d5 =
    '<svg viewBox="161.6 489.5 22.4 1.0" ><path transform="translate(161.6, 489.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vt7bb2 =
    '<svg viewBox="161.6 492.9 22.4 1.0" ><path transform="translate(161.6, 492.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ufvtd =
    '<svg viewBox="241.0 265.5 26.7 1.0" ><path transform="translate(241.0, 265.55)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_owqj6e =
    '<svg viewBox="241.0 267.1 26.7 1.0" ><path transform="translate(241.0, 267.09)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cdt27c =
    '<svg viewBox="241.0 264.0 27.0 1.0" ><path transform="translate(241.0, 264.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g30pb =
    '<svg viewBox="161.3 486.0 22.4 1.0" ><path transform="translate(161.31, 485.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rvf94 =
    '<svg viewBox="161.6 474.4 22.4 1.0" ><path transform="translate(161.6, 474.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dg14j8 =
    '<svg viewBox="271.4 241.6 1.0 20.3" ><path transform="translate(271.4, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_czms0 =
    '<svg viewBox="275.2 241.6 1.0 20.3" ><path transform="translate(275.17, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ki8akl =
    '<svg viewBox="279.6 241.6 1.0 20.3" ><path transform="translate(279.63, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_labcsp =
    '<svg viewBox="283.7 241.6 1.0 20.3" ><path transform="translate(283.75, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qntj0z =
    '<svg viewBox="291.3 241.6 1.0 20.3" ><path transform="translate(291.31, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ffe1h =
    '<svg viewBox="294.3 241.6 1.0 20.3" ><path transform="translate(294.28, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r6og0c =
    '<svg viewBox="297.5 241.6 1.0 20.3" ><path transform="translate(297.49, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jvsgsj =
    '<svg viewBox="300.2 241.6 1.0 20.3" ><path transform="translate(300.21, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y3ii6 =
    '<svg viewBox="271.4 242.3 1.0 20.2" ><path transform="translate(271.4, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i2rrg0 =
    '<svg viewBox="275.2 242.3 1.0 20.2" ><path transform="translate(275.17, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cwrm57 =
    '<svg viewBox="279.6 242.3 1.0 20.2" ><path transform="translate(279.63, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vet8bt =
    '<svg viewBox="283.7 242.3 1.0 20.2" ><path transform="translate(283.75, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bqte6l =
    '<svg viewBox="291.3 242.3 1.0 20.2" ><path transform="translate(291.31, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a05xh1 =
    '<svg viewBox="294.3 242.3 1.0 20.2" ><path transform="translate(294.28, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cw4x1w =
    '<svg viewBox="297.5 242.3 1.0 20.2" ><path transform="translate(297.49, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p496xv =
    '<svg viewBox="300.2 242.3 1.0 20.2" ><path transform="translate(300.21, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cy6y5k =
    '<svg viewBox="288.1 242.3 1.0 20.2" ><path transform="translate(288.12, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kfm6ml =
    '<svg viewBox="271.4 268.5 1.0 19.4" ><path transform="translate(271.4, 268.5)" d="M 0.09765625 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lqekyz =
    '<svg viewBox="275.2 268.5 1.0 19.4" ><path transform="translate(275.17, 268.5)" d="M 0.3310546875 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m6oo0q =
    '<svg viewBox="279.5 268.5 1.0 19.4" ><path transform="translate(279.5, 268.5)" d="M 0 0 L 0.1318359375 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t15mqk =
    '<svg viewBox="283.5 268.5 1.0 19.4" ><path transform="translate(283.5, 268.5)" d="M 0 0 L 0.2490234375 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rcgh3 =
    '<svg viewBox="291.3 268.5 1.0 19.4" ><path transform="translate(291.31, 268.5)" d="M 0.1904296875 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z0s900 =
    '<svg viewBox="294.3 268.5 1.0 19.4" ><path transform="translate(294.28, 268.5)" d="M 0.2236328125 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iokmfr =
    '<svg viewBox="297.5 268.5 1.0 19.4" ><path transform="translate(297.49, 268.5)" d="M 0.0068359375 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ozvlnn =
    '<svg viewBox="300.2 268.5 1.0 19.4" ><path transform="translate(300.21, 268.5)" d="M 0.291015625 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dpab2 =
    '<svg viewBox="271.4 268.3 1.0 20.2" ><path transform="translate(271.4, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h3fom0 =
    '<svg viewBox="275.2 268.3 1.0 20.2" ><path transform="translate(275.17, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m9ftwt =
    '<svg viewBox="279.6 268.3 1.0 20.2" ><path transform="translate(279.63, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_re7q7 =
    '<svg viewBox="283.7 268.3 1.0 20.2" ><path transform="translate(283.75, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o437qj =
    '<svg viewBox="291.3 268.3 1.0 20.2" ><path transform="translate(291.31, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p61ikz =
    '<svg viewBox="294.3 268.3 1.0 20.2" ><path transform="translate(294.28, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_myrov8 =
    '<svg viewBox="297.5 268.3 1.0 20.2" ><path transform="translate(297.49, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a1y945 =
    '<svg viewBox="300.2 268.3 1.0 20.2" ><path transform="translate(300.21, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m80hwg =
    '<svg viewBox="288.1 268.3 1.0 20.2" ><path transform="translate(288.12, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
