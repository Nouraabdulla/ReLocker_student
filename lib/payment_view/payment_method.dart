import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:relocker_sa/bloc/cubit/payment_cubit.dart';
import 'package:relocker_sa/bloc/states/payment_states.dart';
import 'package:relocker_sa/payment_view/add_cart.dart';

class PaymentMethod extends StatelessWidget {
  final String? resId;
  final String? lockerName;

  PaymentMethod({
    Key? key,
    this.resId,
    required this.lockerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF89d8bb),
      appBar: AppBar(
        title: const Text(
          'Payment Method',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFF89d8bb),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
          splashRadius: 24,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          BlocConsumer<PaymentCubit, PaymentStates>(
            listener: (context, state) {},
            builder: (context, state) {
              PaymentCubit _cubit = PaymentCubit.get(context);
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          top: 50, right: 16, left: 16, bottom: 24),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: MediaQuery.of(context).size.width / 2.2,
                              width: MediaQuery.of(context).size.width * 0.9,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xFFe4e4e4),
                              ),
                              child: SvgPicture.asset(
                                'assets/images/mada.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            onTap: () {
                              _cubit.index = 1;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddCard(
                                        resId: resId!,
                                        lockerName: lockerName!,
                                      )));
                            },
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            child: Container(
                              height: MediaQuery.of(context).size.width / 2.2,
                              width: MediaQuery.of(context).size.width * 0.9,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color(0xFF000000)),
                              child: Image.asset(
                                'assets/images/mastercard.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            onTap: () {
                              _cubit.index = 2;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddCard(
                                        resId: resId!,
                                        lockerName: lockerName!,
                                      )));
                            },
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
