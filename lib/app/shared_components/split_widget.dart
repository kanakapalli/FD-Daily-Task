import 'package:flutter/material.dart';

class SplitInto extends StatelessWidget {
  const SplitInto(
      {Key? key,
      required this.first,
      required this.second,
      this.flex1 = 1,
      this.flex2 = 1})
      : super(key: key);
  final Widget first;
  final Widget second;
  final int flex1;
  final int flex2;

  const SplitInto.form(
      {Key? key,
      required this.first,
      required this.second,
      this.flex1 = 2,
      this.flex2 = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: flex1, child: first),
        const SizedBox(
          width: 12,
        ),
        Expanded(flex: flex2, child: second),
      ],
    );
  }
}
