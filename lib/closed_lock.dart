import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class closed_lock extends StatefulWidget {
  closed_lock({Key? key}) : super(key: key);

  @override
  State<closed_lock> createState() => _closed_lockState();
}

final random = Random();
int randomNumber = random.nextInt(10) * 1000;

class _closed_lockState extends State<closed_lock> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 452.0, start: 0.0),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                  color:
                      (click == false) ? Color(0xffff7272) : Color(0xff88d8bb),
                ),
              ),
            ),
          ),

          /* // locker key button
          Pinned.fromPins(
            Pin(size: 138.1, middle: 0.5292),
            Pin(size: 142.1, middle: 0.674),
            child: SvgPicture.string(
              _svg_ki240n,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
           */

          // box for the PIN code
          Pinned.fromPins(
            Pin(start: 44.0, end: 28.0),
            Pin(size: 53.0, middle: 0.8919),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),

          /*Container(
            child: Center(
              child: Text(
                'The password will appear for 20 sec',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12,
                  color: const Color(0xfff20e0e),
                  fontWeight: FontWeight.w700,
                  height: 70.0,
                ),
              ),
            ),
          ),*/

          Pinned.fromPins(
            Pin(size: 74.0, start: 59.0),
            Pin(size: 24.0, middle: 0.8819),
            child: Text(
              'PIN Code',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff000000),
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),

          Pinned.fromPins(
            Pin(size: 77.0, end: 30.0),
            Pin(size: 40.0, middle: 0.8919),
            child: TextButton(
              child: Text(
                'Show',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 15,
                  color: const Color(0xff000000),
                  decoration: TextDecoration.underline,
                  height: 3.933333333333333,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: AlertDialog(
                          title: Text(
                            'The password will appear for 20 sec',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),

                          actions: [
                            /*SizedBox(
                              child: ElevatedButton(
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF9AD6BD),
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),*/
                            SizedBox(
                              child: ElevatedButton(
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF9AD6BD),
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        Future.delayed(Duration(seconds: 20),
                                            () {
                                          Navigator.of(context).pop(true);
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      closed_lock()));
                                        });
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              '$randomNumber',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 13,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                child: ElevatedButton(
                                                  child: const Text(
                                                    'Done',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        closed_lock()));
                                                  },
                                                ),
                                              ),
                                            ], // action
                                          ),
                                        );
                                      });
                                },
                              ),
                            ),
                          ], // action
                        ),
                      );
                    });
              }, // onPressed
            ),
          ),

          Pinned.fromPins(
            Pin(size: 135.1, middle: 0.5324),
            Pin(size: 133.9, middle: 0.671),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click = !click;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const StadiumBorder(),
                ),
                child: Icon(
                  (click == false)
                      ? Icons.lock_open_rounded
                      : Icons.lock_outline_rounded,
                  size: 60,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 167.0, middle: 0.5347),
            Pin(size: 47.0, middle: 0.2971),
            child: Text(
              '',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 35,
                color: const Color(0xff000000),
                height: 1.2571428571428571,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),

          /*Pinned.fromPins(
            Pin(size: 84.0, start: -15.0),
            Pin(size: 21.0, middle: 0.0859),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 23,
                color: Colors.black,
              ),
            ),
          ),

          Pinned.fromPins(
            Pin(size: 84.0, start: 15.0),
            Pin(size: 21.0, middle: 0.0999),
            child: Text(
              'Back',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff1c0000),
                height: 2.44444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),*/

          Container(),
          Container(),
        ],
      ),
    );
  }
}

const String _svg_ki240n =
    '<svg viewBox="144.9 380.9 138.1 142.1" ><path transform="translate(144.94, 380.93)" d="M 69.05736541748047 0 C 107.1966857910156 0 138.1147308349609 31.81909942626953 138.1147308349609 71.0699462890625 C 138.1147308349609 110.3207931518555 107.1966857910156 142.139892578125 69.05736541748047 142.139892578125 C 30.91803741455078 142.139892578125 0 110.3207931518555 0 71.0699462890625 C 0 31.81909942626953 30.91803741455078 0 69.05736541748047 0 Z" fill="#ffffff" stroke="#707070" stroke-width="1" stroke-opacity="0.13" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_atgq2 =
    '<svg viewBox="186.9 416.5 54.1 71.0" ><path transform="translate(182.93, 415.5)" d="M 31.07467651367188 55.09142303466797 C 34.79744720458984 55.09142303466797 37.84334564208984 52.04878234863281 37.84334564208984 48.32999420166016 C 37.84334564208984 44.61120986938477 34.79744720458984 41.56856536865234 31.07467651367188 41.56856536865234 C 27.35190582275391 41.56856536865234 24.30600738525391 44.61120986938477 24.30600738525391 48.32999420166016 C 24.30600738525391 52.04878234863281 27.35190582275391 55.09142303466797 31.07467651367188 55.09142303466797 Z M 51.38068389892578 24.66499710083008 L 47.9963493347168 24.66499710083008 L 47.9963493347168 17.90356826782227 C 47.9963493347168 8.572799682617188 40.41543960571289 1 31.07467651367188 1 C 21.73391151428223 1 14.15300369262695 8.572799682617188 14.15300369262695 17.90356826782227 L 14.15300369262695 24.66499710083008 L 10.76866912841797 24.66499710083008 C 7.045902252197266 24.66499710083008 4 27.70763778686523 4 31.42642593383789 L 4 65.23356628417969 C 4 68.95235443115234 7.045902252197266 71.9949951171875 10.76866912841797 71.9949951171875 L 51.38068389892578 71.9949951171875 C 55.10345458984375 71.9949951171875 58.14935302734375 68.95235443115234 58.14935302734375 65.23356628417969 L 58.14935302734375 31.42642593383789 C 58.14935302734375 27.70763778686523 55.10345458984375 24.66499710083008 51.38068389892578 24.66499710083008 Z M 20.58323860168457 17.90356826782227 C 20.58323860168457 12.12254905700684 25.2874641418457 7.423356533050537 31.07467651367188 7.423356533050537 C 36.86188888549805 7.423356533050537 41.56611633300781 12.12254905700684 41.56611633300781 17.90356826782227 L 41.56611633300781 24.66499710083008 L 20.58323860168457 24.66499710083008 L 20.58323860168457 17.90356826782227 Z M 51.38068389892578 65.23356628417969 L 10.76866912841797 65.23356628417969 L 10.76866912841797 31.42642593383789 L 51.38068389892578 31.42642593383789 L 51.38068389892578 65.23356628417969 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
