part of productdetail;

class IngredientsForm extends StatelessWidget {
  const IngredientsForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SplitInto.form(first: ApiImagePicker(), second: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                const CustomInputTextField(
                  hintText: 'Search',
                ),
                const SizedBox(
                  height: 12,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: List<Widget>.generate(
                    5,
                    (int index) {
                      return InputChip(
                        label: Text('world of ${index + 1}'),
                        selected: false,
                        onSelected: (bool selected) {
                          // setState(() {
                          //   if (selectedIndex == index) {
                          //     selectedIndex = null;
                          //   } else {
                          //     selectedIndex = index;
                          //   }
                          // });
                        },
                        onDeleted: () {
                          // setState(() {
                          //   inputs = inputs - 1;
                          // });
                        },
                      );
                    },
                  ).toList(),
                ),

                // Spacer()
              ],
            ));
  }
}
