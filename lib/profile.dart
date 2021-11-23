import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class profile extends StatelessWidget {
  profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 146.0, middle: 0.5301),
            Pin(size: 143.0, middle: 0.249),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  color: const Color(0xfff6f4f4),
                  border:
                      Border.all(width: 1.0, color: const Color(0xffc9c3c3)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 52.0, middle: 0.2167),
            Pin(size: 21.0, middle: 0.5595),
            child: Text(
              'Email:',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff707070),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 126.0, middle: 0.2727),
            Pin(size: 21.0, middle: 0.6302),
            child: Text(
              'Phone number: ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff707070),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 311.0, end: 22.0),
            Pin(size: 21.0, middle: 0.5901),
            child: Text(
              'Email@student.ksu.edu.sa ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff000000),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 311.0, end: 21.0),
            Pin(size: 21.0, middle: 0.662),
            child: Text(
              '0500000000',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff000000),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 106.0, middle: 0.2288),
            Pin(size: 21.0, middle: 0.4888),
            child: Text(
              'Username:',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff707070),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 311.0, end: 22.0),
            Pin(size: 21.0, middle: 0.5206),
            child: Text(
              'Student123',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff000000),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 67.8, middle: 0.5232),
            Pin(size: 69.0, middle: 0.2722),
            child:
                // Adobe XD layer: 'ic_person_24px' (shape)
                SvgPicture.string(
              _svg_sne3h7,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 24.0, end: 22.0),
            Pin(size: 24.0, start: 118.0),
            child:
                // Adobe XD layer: 'ic_border_color_24px' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 17.0, end: 3.0),
                  Pin(size: 17.0, start: 0.0),
                  child: SvgPicture.string(
                    _svg_ll7b0,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 4.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_rkwe5,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: -16.0),
            Pin(size: 90.0, start: 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff88d8bb),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 125.0, middle: 0.5296),
            Pin(size: 21.0, start: 35.0),
            child: Text(
              'Profile',
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
          Container(),
        ],
      ),
    );
  }
}

const String _svg_ll7b0 =
    '<svg viewBox="4.0 0.0 17.0 17.0" ><path  d="M 17.75 7 L 14 3.25 L 4 13.25 L 4 17 L 7.75 17 L 17.75 7 Z M 20.70999908447266 4.039999961853027 C 21.09999847412109 3.650000095367432 21.09999847412109 3.019999980926514 20.70999908447266 2.630000114440918 L 18.3700008392334 0.2899999916553497 C 17.98000144958496 -0.09999999403953552 17.35000038146973 -0.09999999403953552 16.96000099182129 0.2899999916553497 L 15 2.25 L 18.75 6 L 20.70999908447266 4.039999961853027 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rkwe5 =
    '<svg viewBox="0.0 20.0 24.0 4.0" ><path  d="M 0 20 L 24 20 L 24 24 L 0 24 L 0 20 Z" fill="#000000" fill-opacity="0.36" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sne3h7 =
    '<svg viewBox="180.1 218.0 67.8 69.0" ><path transform="translate(176.1, 213.99)" d="M 37.89861679077148 38.51004028320312 C 47.26311111450195 38.51004028320312 54.84792709350586 30.78841972351074 54.84792709350586 21.25502014160156 C 54.84792709350586 11.72162246704102 47.26311111450195 4 37.89861679077148 4 C 28.53412437438965 4 20.94930839538574 11.72162246704102 20.94930839538574 21.25502014160156 C 20.94930839538574 30.78841972351074 28.53412437438965 38.51004028320312 37.89861679077148 38.51004028320312 Z M 37.89861679077148 47.13755035400391 C 26.58495330810547 47.13755035400391 3.999999761581421 52.9179801940918 3.999999761581421 64.392578125 L 3.999999761581421 73.02008819580078 L 71.7972412109375 73.02008819580078 L 71.7972412109375 64.392578125 C 71.7972412109375 52.9179801940918 49.21228408813477 47.13755035400391 37.89861679077148 47.13755035400391 Z" fill="#000000" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
