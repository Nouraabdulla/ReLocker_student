import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class add_mastercard extends StatelessWidget {
  add_mastercard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: -16.0),
            Pin(start: 0.0, end: -56.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff88d8bb),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 157.0, middle: 0.5333),
            Pin(size: 21.0, start: 36.0),
            child: Text(
              'Payment method ',
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
            Pin(start: 0.0, end: 0.0),
            Pin(start: 197.0, end: -56.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48.0),
                  topRight: Radius.circular(48.0),
                ),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 42.0, end: 25.0),
            Pin(size: 61.0, end: 128.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(43.0),
                color: const Color(0xff88d8bb),
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
            Pin(start: 42.0, end: 31.0),
            Pin(size: 45.0, middle: 0.4412),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: const Color(0xfff6f4f4),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 94.0, start: 42.0),
            Pin(size: 18.0, middle: 0.392),
            child: Text(
              'Card Number',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff4d4b4b),
                fontWeight: FontWeight.w500,
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Container(),
          Pinned.fromPins(
            Pin(size: 149.0, start: 45.0),
            Pin(size: 45.0, middle: 0.5527),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: const Color(0xfff6f4f4),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 81.0, start: 45.0),
            Pin(size: 18.0, middle: 0.5),
            child: Text(
              'Expiry Date',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff4d4b4b),
                fontWeight: FontWeight.w500,
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 149.0, end: 31.0),
            Pin(size: 45.0, middle: 0.5527),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: const Color(0xfff6f4f4),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 33.0, middle: 0.6121),
            Pin(size: 18.0, middle: 0.5),
            child: Text(
              'CVV',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff4d4b4b),
                fontWeight: FontWeight.w500,
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 45.0, end: 28.0),
            Pin(size: 45.0, middle: 0.6642),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: const Color(0xfff6f4f4),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, start: 45.0),
            Pin(size: 18.0, middle: 0.608),
            child: Text(
              'Name',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff4d4b4b),
                fontWeight: FontWeight.w500,
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Container(),
          Pinned.fromPins(
            Pin(size: 127.0, middle: 0.2702),
            Pin(size: 18.0, middle: 0.7359),
            child: Text(
              'Save Card Details',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff4d4b4b),
                fontWeight: FontWeight.w500,
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 100.0, middle: 0.5256),
            Pin(size: 24.0, end: 146.0),
            child: Text(
              'Add Card',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                height: 2.2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 158.0, middle: 0.5315),
            Pin(size: 167.0, start: 114.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23.0),
                color: const Color(0xff3a495f),
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
            Pin(size: 61.0, middle: 0.5755),
            Pin(size: 60.0, middle: 0.2074),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffeca040),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 61.0, middle: 0.4672),
            Pin(size: 60.0, middle: 0.2074),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffbf3432),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
