import 'package:flutter/material.dart';


class MastercardWidget extends StatelessWidget {
  const MastercardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.width / 3,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF3a4960)
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            right: 1,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Color(0xFFeca040)
              ),
            ),
          ),
          Positioned(
            left: 1,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: Color(0xFFc13332)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
