part of productdetail;

class Form2 extends StatelessWidget {
  const Form2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(
        children: [
          const HeadText(title: "Product Details"),
          const ProductTitleComponent(),
          ...List.generate(10, (int index) => index, growable: true).map((e) {
            return ExtractTextFromOCR(index: e);
          })
        ],
      ),
    );
  }
}
