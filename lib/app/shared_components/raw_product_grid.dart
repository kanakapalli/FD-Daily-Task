import 'package:daily_task/app/constans/app_constants.dart';
import 'package:flutter/material.dart';

class RawProductGrid extends StatelessWidget {
  const RawProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width ~/ 230).toInt(),
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.1),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              Image.asset(
                ImagePath.jam,
                // width: double.infinity,
                height: 180,
              ),
              const Text("Title of the product"),
            ],
          ),
        );
      },
    );
  }
}
