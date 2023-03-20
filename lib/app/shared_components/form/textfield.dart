import 'package:flutter/material.dart';

class CustomInputTextField extends StatelessWidget {
  const CustomInputTextField({
    Key? key,
    required this.hintText,
    this.color = Colors.grey,  this.expand = false,
  }) : super(
          key: key,
        );

  final String hintText;
  final Color color;
  final bool expand;


  const CustomInputTextField.expand({
    Key? key,
    required this.hintText,
    this.color = Colors.grey,
    this.expand = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        // style: kTextFormFieldStyle(),
        maxLines: expand ? null: 1,
        expands:  expand ? true : false,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxHeight: 100),
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.all(0),
          label: Text(hintText),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        controller: TextEditingController(),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter username';
          } else if (value.length < 4) {
            return 'at least enter 4 characters';
          } else if (value.length > 13) {
            return 'maximum character is 13';
          }
          return null;
        },
      ),
    );
  }
}
