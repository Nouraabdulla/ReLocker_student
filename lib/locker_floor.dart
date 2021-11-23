import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';

class locker_floor extends StatelessWidget {
  locker_floor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 26.0, end: 25.0),
            Pin(size: 273.0, middle: 0.2395),
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
            Pin(size: 220.0, end: 25.0),
            Pin(size: 273.0, middle: 0.2395),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffbff1e1),
                  border:
                      Border.all(width: 1.0, color: const Color(0xffbff1e1)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 124.0, middle: 0.7465),
            Pin(size: 60.0, middle: 0.3074),
            child: Text(
              'Floor',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 50,
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
            Pin(start: 27.0, end: 27.0),
            Pin(size: 274.0, end: 123.0),
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
            Pin(size: 220.0, end: 27.0),
            Pin(size: 274.0, end: 123.0),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: const Color(0xffbff1e1),
                  border:
                      Border.all(width: 1.0, color: const Color(0xffbff1e1)),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 124.0, middle: 0.7396),
            Pin(size: 60.0, middle: 0.716),
            child: Text(
              'Floor',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 50,
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
            Pin(size: 38.0, middle: 0.2139),
            Pin(size: 60.0, middle: 0.716),
            child: Text(
              'G',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 50,
                color: const Color(0xff3a3a3a),
                fontWeight: FontWeight.w700,
                height: 2.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, middle: 0.2057),
            Pin(size: 60.0, middle: 0.3074),
            child: Text(
              '1',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 50,
                color: const Color(0xff3a3a3a),
                fontWeight: FontWeight.w700,
                height: 2.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 22.0, middle: 0.2564),
            Pin(size: 25.0, middle: 0.329),
            child: Text(
              'St',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 21,
                color: const Color(0xff3a3a3a),
                fontWeight: FontWeight.w700,
                height: 0.8571428571428571,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 125.0, middle: 0.5052),
            Pin(size: 21.0, start: 38.0),
            child: Text(
              'Choose floor',
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
