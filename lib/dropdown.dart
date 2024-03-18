import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String selectedValue;
  final List<String> items;
  final void Function(String?) onChanged;

  const CustomDropdown({
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          widget.label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20), // Spacer between label and dropdown
        // Dropdown
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // White background
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isOpen = !_isOpen;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.selectedValue,
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(_isOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
                if (_isOpen)
                  Container(
                    constraints: BoxConstraints(maxHeight: 200),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.items.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(widget.items[index]),
                                onTap: () {
                                  widget.onChanged(widget.items[index]);
                                  setState(() {
                                    _isOpen = false;
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
