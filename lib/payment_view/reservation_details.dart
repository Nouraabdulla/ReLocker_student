import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:relocker_sa/bloc/cubit/payment_cubit.dart';
import 'package:relocker_sa/bloc/states/payment_states.dart';
import 'package:relocker_sa/payment_view/payment_method.dart';
import 'package:relocker_sa/widgets/custom_button.dart';
import 'package:relocker_sa/widgets/input_field.dart';
import 'package:relocker_sa/widgets/relocker_logo_widget.dart';

import '../controller_view_screen.dart';

class ReservationDetails extends StatelessWidget {
  final int? totalPrice;
  final String? resId;
  final String? lockerName;
  ReservationDetails({Key? key, this.resId, this.totalPrice, this.lockerName})
      : super(key: key);

  String relockerName = '6-G-53';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PaymentCubit _cubit = PaymentCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xFF89d8bb),
          appBar: AppBar(
            backgroundColor: const Color(0xff88d8bb),
            elevation: 0.0,
            title: Text("Reservation Details"),
            centerTitle: true,
            foregroundColor: Colors.black,
            leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ControllerViewScreen()));
                  },
                  child: Text("Cancle", style: TextStyle(color: Colors.black)))
            ], /* textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 20,
                  color: Colors.black,
                ))*/
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
                state is! GetReservationDataLoadingState,
            widgetBuilder: (BuildContext context) => ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.16,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, bottom: 30),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Locker Number',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              //'${_cubit.resserv['locker_name']}',
                              '$lockerName',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: InputField(
                                      title: 'Start Date',
                                      hint:
                                          '${_cubit.resserv['Start Date'].toString()}',
                                      widget: Container()),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: InputField(
                                    title: 'End Date',
                                    hint:
                                        '${_cubit.resserv['End Date'].toString()}',
                                    widget: Container(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            InputField(
                              title: 'Price',
                              hint: '${totalPrice!} \SR',
                              widget: Container(),
                            ),
                            const SizedBox(height: 40),
                            CustomButton(
                              text: 'Confirm',
                              color: const Color(0xFF89d8bb),
                              onPressed: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PaymentMethod(
                                            resId: resId,
                                            lockerName: lockerName,
                                          ))),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.06,
                        left: MediaQuery.of(context).size.width * 0.25,
                        child: RelockerLogoWidget()),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.06,
                        right: MediaQuery.of(context).size.width * 0.25,
                        child: RelockerLogoWidget()),
                  ],
                ),
              ],
            ),
            fallbackBuilder: (BuildContext context) => const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFffffff),
              ),
            ),
          ),
        );
      },
    );
  }
}
