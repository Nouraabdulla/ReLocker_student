import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class reservation_details extends StatelessWidget {
  reservation_details({Key? key}) : super(key: key);
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
            Pin(start: 0.0, end: 0.0),
            Pin(start: 192.0, end: 0.0),
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
            Pin(size: 61.0, middle: 0.7417),
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
            Pin(size: 109.0, middle: 0.5281),
            Pin(size: 18.0, middle: 0.3908),
            child: Text(
              'Locker Number',
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
            Pin(size: 45.0, middle: 0.6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: const Color(0xfff6f4f4),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 71.0, start: 45.0),
            Pin(size: 18.0, middle: 0.5458),
            child: Text(
              'Start Date',
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
            Pin(size: 45.0, middle: 0.6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: const Color(0xfff6f4f4),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 73.0, middle: 0.4012),
            Pin(size: 167.0, start: 114.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xff51796b),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.4057),
            Pin(size: 7.0, start: 129.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xc6ffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.4057),
            Pin(size: 7.0, start: 141.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xc6ffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.4057),
            Pin(size: 7.0, start: 153.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xc6ffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.4057),
            Pin(size: 7.0, middle: 0.3082),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xc6ffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 20.0, middle: 0.3546),
            Pin(size: 7.0, middle: 0.2329),
            child: Transform.rotate(
              angle: 1.5708,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xc6ffffff),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 73.0, middle: 0.649),
            Pin(size: 167.0, start: 114.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xff51796b),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.6457),
            Pin(size: 7.0, start: 129.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xc6ffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.6457),
            Pin(size: 7.0, start: 141.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xc6ffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.6457),
            Pin(size: 7.0, start: 153.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xc6ffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 62.0, middle: 0.6457),
            Pin(size: 7.0, middle: 0.3082),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xc6ffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 20.0, middle: 0.5689),
            Pin(size: 7.0, middle: 0.2329),
            child: Transform.rotate(
              angle: 1.5708,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xc6ffffff),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 71.0, middle: 0.6804),
            Pin(size: 18.0, middle: 0.5458),
            child: Text(
              'End Date',
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
            Pin(size: 167.0, middle: 0.5347),
            Pin(size: 47.0, middle: 0.4447),
            child: Text(
              '6-G-53',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 35,
                color: const Color(0xff4d4b4b),
                fontWeight: FontWeight.w500,
                height: 1.2571428571428571,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 86.0, middle: 0.5245),
            Pin(size: 28.0, middle: 0.7328),
            child: Text(
              'Confirm',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 24,
                color: const Color(0xffffffff),
                height: 1.8333333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 157.0, middle: 0.5333),
            Pin(size: 21.0, start: 36.0),
            child: Text(
              'Reservation details',
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
        ],
      ),
    );
  }
}
