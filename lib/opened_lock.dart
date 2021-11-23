import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class opened_lock extends StatelessWidget {
  opened_lock({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 455.0, start: 0.0),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                  color: const Color(0xffff7272),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 138.1, middle: 0.5292),
            Pin(size: 142.1, middle: 0.5275),
            child: SvgPicture.string(
              _svg_rusrft,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 44.0, end: 28.0),
            Pin(size: 53.0, middle: 0.7809),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 71.0, end: 64.0),
            Pin(size: 18.0, end: 153.0),
            child: Text(
              'The password will appear for 20 sec',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 12,
                color: const Color(0xfff20e0e),
                fontWeight: FontWeight.w700,
                height: 3.6666666666666665,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 74.0, start: 59.0),
            Pin(size: 24.0, middle: 0.7719),
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
            Pin(size: 74.0, end: 34.0),
            Pin(size: 24.0, middle: 0.7719),
            child: Text(
              'Show',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff000000),
                decoration: TextDecoration.underline,
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 55.0, middle: 0.5215),
            Pin(size: 71.0, middle: 0.5213),
            child:
                // Adobe XD layer: 'ic_lock_open_24px' (shape)
                SvgPicture.string(
              _svg_ip0uo0,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 167.0, middle: 0.5347),
            Pin(size: 47.0, middle: 0.1896),
            child: Text(
              '6-G-53',
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
          Pinned.fromPins(
            Pin(size: 84.0, start: 61.0),
            Pin(size: 21.0, start: 36.0),
            child: Text(
              'Back',
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
          Container(),
        ],
      ),
    );
  }
}

const String _svg_rusrft =
    '<svg viewBox="144.9 383.9 138.1 142.1" ><path transform="translate(144.94, 383.93)" d="M 69.05736541748047 0 C 107.1966857910156 0 138.1147308349609 31.81909942626953 138.1147308349609 71.0699462890625 C 138.1147308349609 110.3207931518555 107.1966857910156 142.139892578125 69.05736541748047 142.139892578125 C 30.91803741455078 142.139892578125 0 110.3207931518555 0 71.0699462890625 C 0 31.81909942626953 30.91803741455078 0 69.05736541748047 0 Z" fill="#ffffff" stroke="#707070" stroke-width="1" stroke-opacity="0.13" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ip0uo0 =
    '<svg viewBox="186.2 416.5 55.0 71.0" ><path transform="translate(182.17, 415.5)" d="M 31.5229320526123 55.09143447875977 C 35.30733871459961 55.09143447875977 38.40366744995117 52.04878616333008 38.40366744995117 48.33000183105469 C 38.40366744995117 44.61121368408203 35.30733871459961 41.56856918334961 31.5229320526123 41.56856918334961 C 27.73852920532227 41.56856918334961 24.64219665527344 44.61121368408203 24.64219665527344 48.33000183105469 C 24.64219665527344 52.04878616333008 27.73852920532227 55.09143447875977 31.5229320526123 55.09143447875977 Z M 52.16513061523438 24.66500473022461 L 48.72476196289062 24.66500473022461 L 48.72476196289062 17.9035758972168 C 48.72476196289062 8.572799682617188 41.01834869384766 1.00000011920929 31.5229320526123 1.00000011920929 C 22.02751922607422 1.00000011920929 14.32109832763672 8.572799682617188 14.32109832763672 17.9035758972168 L 20.8577938079834 17.9035758972168 C 20.8577938079834 12.12255096435547 25.63990592956543 7.423357963562012 31.5229320526123 7.423357963562012 C 37.40596008300781 7.423357963562012 42.18807220458984 12.12255096435547 42.18807220458984 17.9035758972168 L 42.18807220458984 24.66500473022461 L 10.88073444366455 24.66500473022461 C 7.096329689025879 24.66500473022461 4 27.70764350891113 4 31.42642402648926 L 4 65.23357391357422 C 4 68.95236206054688 7.096329689025879 71.9949951171875 10.88073444366455 71.9949951171875 L 52.16513061523438 71.9949951171875 C 55.94953536987305 71.9949951171875 59.04587173461914 68.95236206054688 59.04587173461914 65.23357391357422 L 59.04587173461914 31.42642402648926 C 59.04587173461914 27.70764350891113 55.94953536987305 24.66500473022461 52.16513061523438 24.66500473022461 Z M 52.16513061523438 65.23357391357422 L 10.88073444366455 65.23357391357422 L 10.88073444366455 31.42642402648926 L 52.16513061523438 31.42642402648926 L 52.16513061523438 65.23357391357422 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
