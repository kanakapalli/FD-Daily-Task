part of productdetail;

class BarcodeForm extends StatelessWidget {
  const BarcodeForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplitInto.form(
        // first: Container(
        //   color: Colors.red,
        //   height: 120,
        //   child: const Icon(Icons.add),
        // ),
        first: ApiImagePicker(
          // pickedImage: {},
          // picker: ImagePicker(),
          // title: 'testing',
        ),
        second: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'ProductDetailForm is working',
              style: TextStyle(fontSize: 20),
            ),
            CustomInputTextField(
              hintText: 'hello',
            ),
          ],
        ));
  }
}
