import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class saved_creditcards extends StatelessWidget {
  saved_creditcards({Key? key}) : super(key: key);
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
            Pin(start: 190.0, end: -56.0),
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
            Pin(start: 42.0, end: 31.0),
            Pin(size: 75.0, middle: 0.4277),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xfff6f4f4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 1.5),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 158.0, start: 42.0),
            Pin(size: 167.0, start: 114.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23.0),
                color: const Color(0xffe4e4e4),
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
            Pin(size: 58.0, middle: 0.1893),
            Pin(size: 18.0, middle: 0.2124),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff3e93c7),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 58.0, middle: 0.1893),
            Pin(size: 18.0, middle: 0.2383),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff87b848),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 87.0, middle: 0.3446),
            Pin(size: 27.0, middle: 0.2337),
            child: Text(
              'mada',
              style: TextStyle(
                fontFamily: 'Baloo Bhaijaan',
                fontSize: 18,
                color: const Color(0xff000000),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 38.0, middle: 0.3636),
            Pin(size: 27.0, middle: 0.2052),
            child: Text(
              'مدى',
              style: TextStyle(
                fontFamily: 'Baloo Bhaijaan',
                fontSize: 18,
                color: const Color(0xff000000),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 158.0, end: 25.0),
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
            Pin(size: 61.0, end: 55.0),
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
            Pin(size: 61.0, middle: 0.735),
            Pin(size: 60.0, middle: 0.2074),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffbf3432),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 42.0, end: 25.0),
            Pin(size: 61.0, end: 129.0),
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
            Pin(size: 96.0, middle: 0.5253),
            Pin(size: 39.0, middle: 0.8315),
            child: Text(
              '30\$',
              style: TextStyle(
                fontFamily: 'Baloo Bhaijaan',
                fontSize: 26,
                color: const Color(0xffffffff),
                height: 1.6923076923076923,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 24.0, middle: 0.1856),
            Pin(size: 16.0, middle: 0.4461),
            child:
                // Adobe XD layer: 'mastercard-outline' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'card_bg' (shape)
                      Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'card_bg-2' (shape)
                      SvgPicture.string(
                    _svg_km3o,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 2.3, end: 2.3),
                  Pin(start: 1.6, end: 1.6),
                  child:
                      // Adobe XD layer: 'mastercard' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Group' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child:
                                  // Adobe XD layer: 'Rectangle' (shape)
                                  Container(
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 7.7, start: 1.1),
                        Pin(start: 1.1, end: 1.1),
                        child:
                            // Adobe XD layer: 'Path' (shape)
                            SvgPicture.string(
                          _svg_qle34g,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 0.7),
                        Pin(size: 1.0, middle: 0.8068),
                        child:
                            // Adobe XD layer: 'Path' (shape)
                            SvgPicture.string(
                          _svg_tkgosx,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 0.5),
                        Pin(size: 1.0, middle: 0.8034),
                        child:
                            // Adobe XD layer: 'Path' (shape)
                            SvgPicture.string(
                          _svg_uqlh,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 7.7, end: 1.1),
                        Pin(start: 1.1, end: 1.1),
                        child:
                            // Adobe XD layer: 'Path' (shape)
                            SvgPicture.string(
                          _svg_m58gw,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 4.1, middle: 0.5001),
                        Pin(start: 2.2, end: 2.2),
                        child:
                            // Adobe XD layer: 'Path' (shape)
                            SvgPicture.string(
                          _svg_m13qev,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 111.0, start: 55.0),
            Pin(size: 18.0, middle: 0.4155),
            child: Text(
              'Mastercard',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 42.0, end: 31.0),
            Pin(size: 75.0, middle: 0.566),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xfff6f4f4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 1.5),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 24.0, middle: 0.1856),
            Pin(size: 16.0, middle: 0.5714),
            child:
                // Adobe XD layer: 'visa-outline' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'card_bg' (shape)
                      Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'card_bg-2' (shape)
                      SvgPicture.string(
                    _svg_km3o,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 4.6, end: 4.6),
                  Pin(size: 4.8, middle: 0.4982),
                  child:
                      // Adobe XD layer: 'visa-logo' (shape)
                      SvgPicture.string(
                    _svg_hors,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 66.0, start: 55.0),
            Pin(size: 18.0, middle: 0.5387),
            child: Text(
              'Visa',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                height: 2.933333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 54.0, middle: 0.3128),
            Pin(size: 22.0, middle: 0.4493),
            child: Text(
              '1222',
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
            Pin(size: 54.0, middle: 0.3128),
            Pin(size: 22.0, middle: 0.5731),
            child: Text(
              '1222',
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
          Container(),
          Container(),
        ],
      ),
    );
  }
}

const String _svg_qle34g =
    '<svg viewBox="1.4 1.7 7.7 10.6" ><path transform="translate(1.42, 1.7)" d="M 7.691045761108398 10.0303316116333 C 5.461517810821533 11.15737247467041 2.747676610946655 10.57448196411133 1.177575707435608 8.631340026855469 C -0.3925252258777618 6.688198566436768 -0.3925252258777618 3.91246509552002 1.177575707435608 1.96932327747345 C 2.747676610946655 0.02618145383894444 5.461517810821533 -0.5567091703414917 7.691045761108398 0.5703318119049072 C 6.334607124328613 1.766074657440186 5.564616203308105 3.492167949676514 5.581045627593994 5.300331592559814 C 5.57765531539917 7.105756759643555 6.345356464385986 8.826716423034668 7.691045761108398 10.0303316116333 L 7.691045761108398 10.0303316116333 Z" fill="#212b36" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_tkgosx =
    '<svg viewBox="18.0 10.1 1.0 1.0" ><path transform="translate(17.58, 9.7)" d="M 0.4950000047683716 0.5849999785423279 L 0.4950000047683716 0.4149999916553497 L 0.574999988079071 0.4149999916553497 L 0.574999988079071 0.4149999916553497 L 0.425000011920929 0.4149999916553497 L 0.425000011920929 0.4149999916553497 L 0.425000011920929 0.4149999916553497 L 0.425000011920929 0.5849999785423279 L 0.4950000047683716 0.5849999785423279 Z" fill="#212b36" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_uqlh =
    '<svg viewBox="18.2 10.1 1.0 1.0" ><path transform="translate(17.79, 9.68)" d="M 0.6150000095367432 0.6050000190734863 L 0.6150000095367432 0.3950000107288361 L 0.5649999976158142 0.3950000107288361 L 0.5049999952316284 0.5450000166893005 L 0.4449999928474426 0.3950000107288361 L 0.3849999904632568 0.3950000107288361 L 0.3849999904632568 0.6050000190734863 L 0.3849999904632568 0.6050000190734863 L 0.3849999904632568 0.4449999928474426 L 0.4449999928474426 0.574999988079071 L 0.4449999928474426 0.574999988079071 L 0.5049999952316284 0.4449999928474426 L 0.5049999952316284 0.6050000190734863 L 0.6150000095367432 0.6050000190734863 Z" fill="#212b36" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_m58gw =
    '<svg viewBox="10.9 1.7 7.7 10.6" ><path transform="translate(10.88, 1.7)" d="M 7.699999809265137 5.304542541503906 C 7.699816226959229 7.145246982574463 6.744595050811768 8.85404109954834 5.176733493804932 9.818408012390137 C 3.608872652053833 10.78277492523193 1.652925372123718 10.86459636688232 0.009999999776482582 10.03454303741455 C 2.514630317687988 7.819705963134766 2.860875129699707 4.037310600280762 0.800000011920929 1.404542684555054 C 0.5619638562202454 1.10164201259613 0.2939364016056061 0.8235635757446289 0 0.5745427012443542 C 1.643749117851257 -0.2602965235710144 3.60322904586792 -0.1809726357460022 5.174118041992188 0.784001886844635 C 6.745006561279297 1.748976469039917 7.701578617095947 3.460941553115845 7.699999809265137 5.304542541503906 L 7.699999809265137 5.304542541503906 Z" fill="#212b36" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_m13qev =
    '<svg viewBox="8.0 2.8 4.1 8.3" ><path transform="translate(7.97, 2.83)" d="M 2.028746366500854 8.340000152587891 C 0.7480124831199646 7.335298538208008 0 5.797791481018066 0 4.170000076293945 C 0 2.542208671569824 0.7480124831199646 1.004701495170593 2.028746366500854 0 C 3.305972337722778 1.006904363632202 4.051315784454346 2.543604612350464 4.051315784454346 4.170000076293945 C 4.051315784454346 5.796395301818848 3.305972337722778 7.333095550537109 2.028746366500854 8.340000152587891 L 2.028746366500854 8.340000152587891 Z" fill="#212b36" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_km3o =
    '<svg viewBox="0.0 0.0 24.0 16.0" ><path  d="M 21.99960136413574 16.00020027160645 L 1.999800682067871 16.00020027160645 C 0.8971107006072998 16.00020027160645 6.805419729971618e-07 15.10309028625488 6.805419729971618e-07 14.00040054321289 L 6.805419729971618e-07 1.999800086021423 C 6.805419729971618e-07 0.8971101641654968 0.8971107006072998 1.358032193365943e-07 1.999800682067871 1.358032193365943e-07 L 21.99960136413574 1.358032193365943e-07 C 23.10279083251953 1.358032193365943e-07 24.00030136108398 0.8971101641654968 24.00030136108398 1.999800086021423 L 24.00030136108398 14.00040054321289 C 24.00030136108398 15.10309028625488 23.10279083251953 16.00020027160645 21.99960136413574 16.00020027160645 Z M 1.999800682067871 0.9999001622200012 C 1.448450684547424 0.9999001622200012 0.9999006986618042 1.448450088500977 0.9999006986618042 1.999800086021423 L 0.9999006986618042 14.00040054321289 C 0.9999006986618042 14.55175018310547 1.448450684547424 15.00030040740967 1.999800682067871 15.00030040740967 L 21.99960136413574 15.00030040740967 C 22.55144119262695 15.00030040740967 23.00040054321289 14.55175018310547 23.00040054321289 14.00040054321289 L 23.00040054321289 1.999800086021423 C 23.00040054321289 1.448450088500977 22.55144119262695 0.9999001622200012 21.99960136413574 0.9999001622200012 L 1.999800682067871 0.9999001622200012 Z" fill="#212b36" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_hors =
    '<svg viewBox="4.6 5.6 14.8 4.8" ><path transform="translate(4.6, 5.59)" d="M 8.51039981842041 4.779900074005127 C 8.054729461669922 4.776289939880371 7.607189655303955 4.69543981552124 7.18019962310791 4.539599895477295 L 7.399799346923828 3.539690017700195 C 7.747839450836182 3.717800140380859 8.137109756469727 3.812299966812134 8.526969909667969 3.812299966812134 C 8.564609527587891 3.812299966812134 8.602269172668457 3.811439990997314 8.639999389648438 3.809700012207031 C 8.97184944152832 3.809700012207031 9.350099563598633 3.569980144500732 9.350099563598633 3.359699964523315 C 9.350099563598633 3.156520128250122 9.171099662780762 3.044950008392334 8.729999542236328 2.789999961853027 L 8.716419219970703 2.782150030136108 C 8.278899192810059 2.529340028762817 7.679699420928955 2.183099985122681 7.679699420928955 1.53000009059906 C 7.679699420928955 0.6291600465774536 8.502419471740723 3.700256456795614e-08 9.680399894714355 3.700256456795614e-08 C 10.05803966522217 0.0009000370046123862 10.43139934539795 0.06812003999948502 10.79009914398193 0.199800044298172 L 10.58039951324463 1.199699997901917 C 10.28141975402832 1.062610030174255 9.948579788208008 0.9897800087928772 9.616439819335938 0.9897800087928772 C 9.544399261474609 0.9897800087928772 9.471449851989746 0.9931800365447998 9.399599075317383 0.9999000430107117 C 9.054559707641602 1.04109001159668 8.900099754333496 1.225310087203979 8.900099754333496 1.389600038528442 C 8.896129608154297 1.605939984321594 9.169009208679199 1.749890089035034 9.484989166259766 1.916570067405701 C 9.968219757080078 2.171489953994751 10.56959915161133 2.488729953765869 10.56959915161133 3.220200061798096 L 10.59033966064453 3.200360059738159 C 10.59029960632324 4.160190105438232 9.773229598999023 4.779900074005127 8.51039981842041 4.779900074005127 Z M 11.71955966949463 4.740960121154785 L 11.71885967254639 4.740960121154785 L 10.45979976654053 4.740300178527832 L 12.25979900360107 0.4500000476837158 C 12.34552955627441 0.2433400303125381 12.54495906829834 0.1098000407218933 12.76787948608398 0.1098000407218933 L 13.76999950408936 0.1098000407218933 L 14.76963901519775 4.739089965820312 L 13.67009925842285 4.740300178527832 L 13.49999904632568 4.050000190734863 L 11.96999931335449 4.050000190734863 L 11.71979904174805 4.740300178527832 L 11.71955966949463 4.740960121154785 Z M 12.95999908447266 1.359899997711182 L 12.32999992370605 3.099600076675415 L 13.4000997543335 3.089699983596802 L 12.95999908447266 1.359899997711182 Z M 6.329699516296387 4.730400085449219 L 6.3288893699646 4.730400085449219 L 5.139899253845215 4.730400085449219 L 6.13979959487915 0.09990003705024719 L 7.329599380493164 0.09990003705024719 L 6.329869270324707 4.729609966278076 L 6.329699516296387 4.730400085449219 Z M 3.68010950088501 4.730400085449219 L 3.679439544677734 4.730400085449219 L 2.400299549102783 4.730400085449219 L 1.400399446487427 1.04040002822876 C 1.38055944442749 0.8654200434684753 1.275599479675293 0.7120500206947327 1.119599461555481 0.6300000548362732 C 0.763479471206665 0.458670049905777 0.3867794573307037 0.3275500237941742 -5.316161946211651e-07 0.2403000444173813 L -5.316161946211651e-07 0.09989003837108612 L 1.999799489974976 0.09990003705024719 C 2.278469562530518 0.1017100363969803 2.509729385375977 0.3034500479698181 2.549699544906616 0.5796000361442566 L 3.059999465942383 3.249900102615356 L 4.400099277496338 0.09990003705024719 L 5.619599342346191 0.09990003705024719 L 3.680359363555908 4.729790210723877 L 3.68010950088501 4.730400085449219 Z" fill="#212b36" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
