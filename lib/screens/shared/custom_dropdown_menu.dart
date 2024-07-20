import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List<String> list;
  final TextEditingController controller;
  final String label;

  const CustomDropdownMenu({
    super.key,
    required this.list,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: list
          .map(
            (item) => DropdownMenuEntry(
              value: item,
              label: item,
            ),
          )
          .toList(),
      width: MediaQuery.of(context).size.width - 32,
      label: Text(label),
      initialSelection: list.first,
    );
  }
}
