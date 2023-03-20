part of productdetail;

class Form3 extends StatelessWidget {
  const Form3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SplitInto(
            first: AllergyAdviceForm(),
            second: PickHeroImageForm(),
          ),
          const HeadText(title: "Other Details"),
          SplitInto(
            first: Column(
              children: const [
                OtherDetailsForm(
                  title: "clams",
                ),
                SizedBox(
                  height: 12,
                ),
                OtherDetailsForm(
                  title: "waraning",
                ),
              ],
            ),
            second: OtherDetailsForm.custom(
              title: "Net Weigth",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Net Weigth"),
                  Text("drop down here"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OtherDetailsForm extends StatelessWidget {
  const OtherDetailsForm({
    Key? key,
    required this.title,
    this.child,
  })  : assert(child == null),
        super(key: key);

  final String title;
  final Widget? child;

  const OtherDetailsForm.custom({
    Key? key,
    required this.title,
    this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplitInto.form(
        first: ApiImagePicker(),
        second: child ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const CustomInputTextField.expand(
                  hintText: "test",
                ),
              ],
            ));
  }
}

class PickHeroImageForm extends StatelessWidget {
  const PickHeroImageForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadText(title: "Product Details"),
        SplitInto.form(first: ApiImagePicker(), second: const Text("asdasd")),
      ],
    );
  }
}

class AllergyAdviceForm extends StatelessWidget {
  const AllergyAdviceForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadText(title: "Allergy Advice"),
        SplitInto.form(first: ApiImagePicker(), second: const Text("asdasd")),
      ],
    );
  }
}
