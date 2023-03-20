part of productdetail;

class Form1 extends StatelessWidget {
  const Form1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplitInto(
      first: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            HeadText(title: "Barcode"),
            BarcodeForm(),
            HeadText(title: "Ingredients"),
            IngredientsForm()
          ],
        ),
      ),
      second: const Padding(
        padding: EdgeInsets.all(12.0),
        child: NutrientsForm(),
      ),
    );
  }
}
