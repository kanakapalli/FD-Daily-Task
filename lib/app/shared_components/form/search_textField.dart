import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, required this.typeAheadController}) : super(key: key);

  final TextEditingController typeAheadController;

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: typeAheadController,
            decoration: const InputDecoration(
              labelText: 'City'
            )
          ),          
          suggestionsCallback: (pattern) {
            // return CitiesService.getSuggestions(pattern);
            return [];
          },
          itemBuilder: (context, suggestion) {
            return const ListTile(
              title: Text("suggestion"),
            );
          },
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          onSuggestionSelected: (suggestion) {
            typeAheadController.text = "suggestion";
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please select a city';
            }
            return null;
          },
          onSaved: (value) => typeAheadController.text = value.toString(),
        );
  }
}