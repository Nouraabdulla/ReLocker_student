import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class lockerset1_GPL extends StatelessWidget {
  lockerset1_GPL({
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
                      //------------------- map ---------------
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 92.3, start: 397), //49
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 95.1, middle: 0.4598),
                        Pin(size: 69.4, start: 420), //50
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 61.7, start: 316), //48
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 82.5, start: 180), //46
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 74.0, start: 107.5), // 44
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 142.0, end: 35.9),
                        Pin(size: 203.8, start: 193), // 53,52
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 61.6, middle: 0.5636),
                        Pin(size: 85.8, start: 108), // above 53,52
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 93.3, end: 35.7),
                        Pin(size: 69.4, start: 420), //51
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.8045),
                        Pin(size: 16.0, start: 450),
                        child: Text(
                          '6G51',
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
                        Pin(size: 53.0, middle: 0.4823),
                        Pin(size: 16.0, start: 450),
                        child: Text(
                          '6G50',
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
                        Pin(size: 53.0, start: 45.7),
                        Pin(size: 16.0, start: 450),
                        child: Text(
                          '6G49',
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
                        Pin(size: 65.0, start: 42.1),
                        Pin(size: 16.0, start: 340),
                        child: Text(
                          '6G48',
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
                        Pin(size: 65.0, start: 41.1),
                        Pin(size: 16.0, start: 215),
                        child: Text(
                          '6G46',
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
                        Pin(size: 65.0, start: 39.7),
                        Pin(size: 16.0, start: 135.0),
                        child: Text(
                          '6G44',
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
                        Pin(size: 53.0, middle: 0.6818),
                        Pin(size: 16.0, start: 300),
                        child: Text(
                          '6G52',
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
                        Pin(size: 53.0, end: 41.6),
                        Pin(size: 16.0, start: 220),
                        child: Text(
                          '6G53',
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
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 55.4, start: 262), // 47
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 41.1),
                        Pin(size: 16.0, start: 280),
                        child: Text(
                          '6G47',
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
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 20.3, start: 377), // Exit
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff7dd871),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 42.0, middle: 0.1789),
                        Pin(size: 14.0, start: 380),
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
                        Pin(size: 71.0, middle: 0.5842),
                        Pin(size: 60.7, start: 193), // grey area
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
                        Pin(size: 53.0, middle: 0.5459),
                        Pin(size: 19.0, start: 378), //wc
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, middle: 0.5408),
                        Pin(size: 15.0, start: 381),
                        child: Text(
                          'WC',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 20.5, end: 35.7),
                        Pin(size: 47.0, start: 350), // small grey
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
                        Pin(size: 21.1, middle: 0.3417),
                        Pin(size: 16.0, start: 122.0), // locker
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
                        Pin(size: 21.1, middle: 0.3417),
                        Pin(size: 16.0, start: 142),
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
                        Pin(size: 21.1, middle: 0.3417),
                        Pin(size: 16.0, start: 162),
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
                        Pin(size: 21.1, middle: 0.1667),
                        Pin(size: 16.0, start: 91.4),
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
                        Pin(size: 21.1, middle: 0.2351),
                        Pin(size: 16.0, start: 91.4),
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
