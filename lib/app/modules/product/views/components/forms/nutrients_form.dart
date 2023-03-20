part of productdetail;

class NutrientsForm extends StatelessWidget {
  const NutrientsForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadText(title: "Nutrients"),
        SplitInto.form(
          first:ApiImagePicker(),
          second: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomInputTextField(
                hintText: 'hello',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: kSpacing,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text("data"),
            SizedBox(
              width: 6,
            ),
            CustomInputTextField(
              hintText: 'hello',
            ),
          ],
        ),
        const IndividualNutrientsComponent.heading(),
        const IndividualNutrientsComponent()
      ],
    );
  }
}

class IndividualNutrientsComponent extends StatelessWidget {
  const IndividualNutrientsComponent({
    Key? key,
    this.isHeading = false,
  }) : super(key: key);

  const IndividualNutrientsComponent.heading({Key? key, this.isHeading = true})
      : super(key: key);
  final bool isHeading;

  @override
  Widget build(BuildContext context) {
    if (isHeading) {
      var row = Row(
        children: const [
          Expanded(flex: 2, child: Text("nutrients")),
          SizedBox(
            width: 12,
          ),
          Expanded(flex: 1, child: Text("value")),
          SizedBox(
            width: 12,
          ),
          Expanded(flex: 1, child: Text("units")),
        ],
      );
      return row;
    } else {
      return Row(
        children: const [
          Expanded(
              flex: 2,
              child: CustomInputTextField(
                hintText: 'hello',
              )),
          SizedBox(
            width: 12,
          ),
          Expanded(
              flex: 1,
              child: CustomInputTextField(
                hintText: 'hello',
              )),
          SizedBox(
            width: 12,
          ),
          Expanded(
              flex: 1,
              child: CustomInputTextField(
                hintText: 'hello',
              )),
        ],
      );
    }
  }
}
