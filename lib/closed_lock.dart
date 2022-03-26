import 'package:flutter/material.dart';
import 'package:relocker_sa/Receipt.dart';

class closed_lock extends StatefulWidget {
  closed_lock({
    Key? key,
  }) : super(key: key);

  @override
  State<closed_lock> createState() => _closed_lockState();
}


class _closed_lockState extends State<closed_lock> {
  bool click = true;
  TextEditingController emailCont = new TextEditingController();
  TextEditingController otpCont = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
                  color:
                      (click == false) ? Color(0xffff7272) : Color(0xff88d8bb),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 1.0,
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Receipt()));
                    },
                    icon: Icon(
                      Icons.receipt_long_outlined,
                      size: 40,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 2.8,
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          child: Icon(
                            (click == false)
                                ? Icons.lock_open_rounded
                                : Icons.lock_outline_rounded,
                            size: 70,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).size.width / -6,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: ListTile(
                    tileColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Text(
                      "7382",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                   
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "code will showen withing 8 seconds",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Text(
                  'Locker Key',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 28,
                    color: const Color(0xff000000),
                    height: -22,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: true),
                  textAlign: TextAlign.center,
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }

}
