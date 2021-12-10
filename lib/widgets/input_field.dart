import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 24,
            ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 8, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xFFf6f4f5)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                  ),
                  controller: controller,
                  autofocus: false,
                  readOnly: widget == null? false :true,
                  validator: (val){
                    if(val!.isEmpty){
                      return "Pleas enter data";
                    }
                  },
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              widget?? Container(),
            ],
          ),
        ),
      ],
    );
  }
}

class InputFieldNum extends StatelessWidget {
  const InputFieldNum({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 8, right: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFf6f4f5)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                  ),
                  controller: controller,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  readOnly: widget == null? false :true,
                  validator: (val){
                    if(val!.isEmpty){
                      return "Pleas enter data";
                    }
                  },
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              widget?? Container(),
            ],
          ),
        ),
      ],
    );
  }
}

class InputFieldWithoutValidate extends StatelessWidget {
  const InputFieldWithoutValidate({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 8, right: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFf6f4f5)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                  ),
                  controller: controller,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  readOnly: widget == null? false :true,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              widget?? Container(),
            ],
          ),
        ),
      ],
    );
  }
}