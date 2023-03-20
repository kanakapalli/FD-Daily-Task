import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  const HeadText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        const Expanded(
            child: Divider(
          color: Colors.black,
          thickness: 3,
          height: 4,
        )),
      ],
    );
  }
}
