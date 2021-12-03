import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class lockerset1_FGL extends StatelessWidget {
  lockerset1_FGL({
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
                  height: 880.0,
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
                      // // ),
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

                      //-------------------------- map -------------
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
                        Pin(size: 103.0, end: 29.0),
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
                        Pin(size: 98.0, middle: 0.4416),
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
                        Pin(size: 150.0, end: 29.0),
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
                          _svg_co67m9,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 26.7, middle: 0.7796),
                        Pin(size: 1.0, start: 274), // stairs2 line
                        child: SvgPicture.string(
                          _svg_zan6zu,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7804),
                        Pin(size: 1.0, start: 275), // stairs2 line
                        child: SvgPicture.string(
                          _svg_so97s,
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
                          _svg_ecu,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ea22zy,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_xp5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_rm3jvr,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_fjj2mn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_g90z,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 33.7),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_haivz2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.0),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_nb5hd2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_fjj2mn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 250), // stairs2 line
                        child: SvgPicture.string(
                          _svg_h9pi,
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
                          _svg_vn1f2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_aemh0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_gerrt,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_c1muet,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_v3zs3l,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_d0gfz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 33.7),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_wuzlg0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.0),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_w5hv54,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 276), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ezfrg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, start: 31.0),
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

                      // ------------------------ map ------------
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
                          _svg_ndxdyq,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, middle: 0.5432),
                        Pin(size: 26.7, start: 438), // stairs line
                        child: SvgPicture.string(
                          _svg_inin3v,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, middle: 0.5528),
                        Pin(size: 27.0, start: 438), // stairs line
                        child: SvgPicture.string(
                          _svg_if9bag,
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
                          _svg_pa14i,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 469), // stairs line
                        child: SvgPicture.string(
                          _svg_e9l6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 473), // stairs line
                        child: SvgPicture.string(
                          _svg_feiliz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 477), // stairs line
                        child: SvgPicture.string(
                          _svg_sohgwp,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 481), // stairs line
                        child: SvgPicture.string(
                          _svg_yxplo,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 485), // stairs line
                        child: SvgPicture.string(
                          _svg_x33p3l,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 489), // stairs line
                        child: SvgPicture.string(
                          _svg_b2nwt4,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 493), // stairs line
                        child: SvgPicture.string(
                          _svg_unqi3,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 497), // stairs line
                        child: SvgPicture.string(
                          _svg_fdv8qi,
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
                          _svg_o6swbu,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 467), // stairs line2
                        child: SvgPicture.string(
                          _svg_jg4lm6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 473), // stairs line4
                        child: SvgPicture.string(
                          _svg_z52l8t,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 480), // stairs line6
                        child: SvgPicture.string(
                          _svg_ylpd,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 464), // stairs line1
                        child: SvgPicture.string(
                          _svg_cil5lo,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 483), // stairs line7
                        child: SvgPicture.string(
                          _svg_clktw9,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 491), // stairs line9
                        child: SvgPicture.string(
                          _svg_euye8,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 495), // stairs line10
                        child: SvgPicture.string(
                          _svg_bmv4p9,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5034),
                        Pin(size: 1.0, start: 487), // stairs line8
                        child: SvgPicture.string(
                          _svg_z5py1a,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 477), // stairs line5
                        child: SvgPicture.string(
                          _svg_kp61nv,
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

                      //---------------------

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
const String _svg_co67m9 =
    '<svg viewBox="241.0 277.5 26.7 1.0" ><path transform="translate(241.0, 277.55)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zan6zu =
    '<svg viewBox="241.0 279.1 26.7 1.0" ><path transform="translate(241.0, 279.09)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_so97s =
    '<svg viewBox="241.0 276.0 27.0 1.0" ><path transform="translate(241.0, 276.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qs7urw =
    '<svg viewBox="271.4 253.6 1.0 20.3" ><path transform="translate(271.4, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g77jpq =
    '<svg viewBox="275.2 253.6 1.0 20.3" ><path transform="translate(275.17, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o0dmv =
    '<svg viewBox="279.6 253.6 1.0 20.3" ><path transform="translate(279.63, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y4j9qf =
    '<svg viewBox="283.7 253.6 1.0 20.3" ><path transform="translate(283.75, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vj2m0f =
    '<svg viewBox="291.3 253.6 1.0 20.3" ><path transform="translate(291.31, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m9naz7 =
    '<svg viewBox="294.3 253.6 1.0 20.3" ><path transform="translate(294.28, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ecu =
    '<svg viewBox="271.4 254.3 1.0 20.2" ><path transform="translate(271.4, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ea22zy =
    '<svg viewBox="275.2 254.3 1.0 20.2" ><path transform="translate(275.17, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xp5 =
    '<svg viewBox="279.6 254.3 1.0 20.2" ><path transform="translate(279.63, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rm3jvr =
    '<svg viewBox="283.7 254.3 1.0 20.2" ><path transform="translate(283.75, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fjj2mn =
    '<svg viewBox="291.3 254.3 1.0 20.2" ><path transform="translate(291.31, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g90z =
    '<svg viewBox="294.3 254.3 1.0 20.2" ><path transform="translate(294.28, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_haivz2 =
    '<svg viewBox="298.3 254.7 1.0 20.2" ><path transform="translate(298.28, 254.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nb5hd2 =
    '<svg viewBox="301.0 254.7 1.0 20.2" ><path transform="translate(300.99, 254.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h9pi =
    '<svg viewBox="288.1 254.3 1.0 20.2" ><path transform="translate(288.12, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vn1f2 =
    '<svg viewBox="271.4 280.3 1.0 20.2" ><path transform="translate(271.4, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aemh0 =
    '<svg viewBox="275.2 280.3 1.0 20.2" ><path transform="translate(275.17, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gerrt =
    '<svg viewBox="279.6 280.3 1.0 20.2" ><path transform="translate(279.63, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c1muet =
    '<svg viewBox="283.7 280.3 1.0 20.2" ><path transform="translate(283.75, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v3zs3l =
    '<svg viewBox="291.3 280.3 1.0 20.2" ><path transform="translate(291.31, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d0gfz =
    '<svg viewBox="294.3 280.3 1.0 20.2" ><path transform="translate(294.28, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wuzlg0 =
    '<svg viewBox="298.3 280.7 1.0 20.2" ><path transform="translate(298.28, 280.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w5hv54 =
    '<svg viewBox="301.0 280.7 1.0 20.2" ><path transform="translate(300.99, 280.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ezfrg =
    '<svg viewBox="288.1 280.3 1.0 20.2" ><path transform="translate(288.12, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ndxdyq =
    '<svg viewBox="186.5 445.0 1.0 26.7" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 186.45, 445.0)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_inin3v =
    '<svg viewBox="184.9 445.0 1.0 26.7" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 184.91, 445.0)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_if9bag =
    '<svg viewBox="188.0 445.0 1.0 27.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 188.0, 445.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pa14i =
    '<svg viewBox="190.6 477.2 22.4 1.0" ><path transform="translate(190.61, 477.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e9l6 =
    '<svg viewBox="190.6 473.0 22.4 1.0" ><path transform="translate(190.61, 472.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_feiliz =
    '<svg viewBox="190.6 481.4 22.4 1.0" ><path transform="translate(190.61, 481.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sohgwp =
    '<svg viewBox="190.6 489.5 22.4 1.0" ><path transform="translate(190.61, 489.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yxplo =
    '<svg viewBox="190.6 468.8 22.4 1.0" ><path transform="translate(190.61, 468.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x33p3l =
    '<svg viewBox="190.6 493.7 22.4 1.0" ><path transform="translate(190.61, 493.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b2nwt4 =
    '<svg viewBox="190.6 500.5 22.4 1.0" ><path transform="translate(190.61, 500.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_unqi3 =
    '<svg viewBox="190.6 503.9 22.4 1.0" ><path transform="translate(190.61, 503.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fdv8qi =
    '<svg viewBox="190.3 497.0 22.4 1.0" ><path transform="translate(190.32, 496.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n6gj =
    '<svg viewBox="190.6 485.4 22.4 1.0" ><path transform="translate(190.61, 485.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o6swbu =
    '<svg viewBox="161.6 477.2 22.4 1.0" ><path transform="translate(161.61, 477.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jg4lm6 =
    '<svg viewBox="161.6 473.0 22.4 1.0" ><path transform="translate(161.61, 472.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z52l8t =
    '<svg viewBox="161.6 481.4 22.4 1.0" ><path transform="translate(161.61, 481.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ylpd =
    '<svg viewBox="161.6 489.5 22.4 1.0" ><path transform="translate(161.61, 489.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cil5lo =
    '<svg viewBox="161.6 468.8 22.4 1.0" ><path transform="translate(161.61, 468.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_clktw9 =
    '<svg viewBox="161.6 493.7 22.4 1.0" ><path transform="translate(161.61, 493.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_euye8 =
    '<svg viewBox="161.6 500.5 22.4 1.0" ><path transform="translate(161.61, 500.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bmv4p9 =
    '<svg viewBox="161.6 503.9 22.4 1.0" ><path transform="translate(161.61, 503.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z5py1a =
    '<svg viewBox="161.3 497.0 22.4 1.0" ><path transform="translate(161.32, 496.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kp61nv =
    '<svg viewBox="161.6 485.4 22.4 1.0" ><path transform="translate(161.61, 485.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
