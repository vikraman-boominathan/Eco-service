import 'package:flutter/material.dart';

void main() {
  runApp(const CustomDropdown());
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final TextEditingController _controller = TextEditingController();
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _controller.text = 'Blue'; // Set initial value
    _selectedOption = _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownItems = [
      'Blue',
      'Pink',
      'Green',
      'Orange',
      'Grey',
    ];

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200), // Adjust as needed
      child: DropdownMenu<String>(
        controller: _controller,
        label: const Text('Select Option'),
        onSelected: (String? option) {
          setState(() {
            _selectedOption = option;
          });
        },
        dropdownMenuEntries: dropdownItems
            .map<DropdownMenuEntry<String>>(
              (item) => DropdownMenuEntry<String>(
                value: item,
                label: item,
              ),
            )
            .toList(),
      ),
    );
  }
}
