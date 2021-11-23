import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class edit_profile extends StatelessWidget {
  edit_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 146.0, middle: 0.5301),
            Pin(size: 143.0, middle: 0.249),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xfff6f4f4),
                border: Border.all(width: 1.0, color: const Color(0xffc9c3c3)),
              ),
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
            Pin(size: 241.0, middle: 0.4386),
            Pin(size: 1.0, middle: 0.6697),
            child: SvgPicture.string(
              _svg_ql3pe8,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 241.0, middle: 0.4386),
            Pin(size: 1.0, middle: 0.5316),
            child: SvgPicture.string(
              _svg_n4j2eo,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 94.0, middle: 0.2642),
            Pin(size: 32.0, middle: 0.7578),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xffbff1e1),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 94.0, middle: 0.7547),
            Pin(size: 32.0, middle: 0.7578),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xfff6f4f4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.2829),
            Pin(size: 17.0, middle: 0.7538),
            child: Text(
              'Save ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff707070),
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.7314),
            Pin(size: 17.0, middle: 0.7538),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff707070),
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
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
            Pin(size: 125.0, middle: 0.5052),
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
          Pinned.fromPins(
            Pin(start: 0.0, end: -16.0),
            Pin(size: 90.0, start: -1.0),
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
        ],
      ),
    );
  }
}

const String _svg_ql3pe8 =
    '<svg viewBox="75.0 582.0 241.0 1.0" ><path transform="translate(75.0, 582.0)" d="M 0 0 L 241 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n4j2eo =
    '<svg viewBox="75.0 462.0 241.0 1.0" ><path transform="translate(75.0, 462.0)" d="M 0 0 L 241 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sne3h7 =
    '<svg viewBox="180.1 218.0 67.8 69.0" ><path transform="translate(176.1, 213.99)" d="M 37.89861679077148 38.51004028320312 C 47.26311111450195 38.51004028320312 54.84792709350586 30.78841972351074 54.84792709350586 21.25502014160156 C 54.84792709350586 11.72162246704102 47.26311111450195 4 37.89861679077148 4 C 28.53412437438965 4 20.94930839538574 11.72162246704102 20.94930839538574 21.25502014160156 C 20.94930839538574 30.78841972351074 28.53412437438965 38.51004028320312 37.89861679077148 38.51004028320312 Z M 37.89861679077148 47.13755035400391 C 26.58495330810547 47.13755035400391 3.999999761581421 52.9179801940918 3.999999761581421 64.392578125 L 3.999999761581421 73.02008819580078 L 71.7972412109375 73.02008819580078 L 71.7972412109375 64.392578125 C 71.7972412109375 52.9179801940918 49.21228408813477 47.13755035400391 37.89861679077148 47.13755035400391 Z" fill="#000000" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
