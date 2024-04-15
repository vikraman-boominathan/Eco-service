import 'package:eco_service/main.dart';
import 'package:flutter/material.dart';

import '../api/communityList.dart';
import '../hive/community.dart';

void main() {
  runApp(const CustomDropdown());
}

class CustomDropdown extends StatefulWidget {
  final List<Community>? dropdownItems;
  final Function(Community?)? onChange;
  const CustomDropdown({Key? key, this.dropdownItems, this.onChange})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final TextEditingController _controller = TextEditingController();
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _controller.text = 'Please select';
    _selectedOption = _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text(
        //   'Community',
        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        // ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: DropdownMenu<Community>(
              menuHeight: 200,
              width: 200,
              controller: _controller,
              onSelected: widget.onChange,
              dropdownMenuEntries: widget.dropdownItems
                      ?.map<DropdownMenuEntry<Community>>(
                        (item) => DropdownMenuEntry<Community>(
                          value: item,
                          label: item.name,
                        ),
                      )
                      ?.toList() ??
                  [],
            ),
          ),
        ),
      ],
    );
  }
}

 // CommunityListBuilder(
                //   communities: communities,
                //   onDropdownChanged: (community) {
                //     if (community != null) {
                //       setState(() {
                //         selectedDropdownValue = community.id;
                //       });
                //     }
                //   },
                // ),