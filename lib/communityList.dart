import 'package:flutter/material.dart';
import 'dropdown.dart'; // Make sure to import required dependencies
import 'widgets.dart'; // Make sure to import required dependencies

class CommunityListBuilder extends StatelessWidget {
  final Future<List<Community>> communities;
  final Function(String?) onDropdownChanged;

  const CommunityListBuilder({
    Key? key,
    required this.communities,
    required this.onDropdownChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Community>>(
      future: communities,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Community> communityList = snapshot.data!;
          return SingleChildScrollView(
            child: CustomDropdown(
              dropdownItems: communityList,
              onChange: (String? option) {
                onDropdownChanged(option);
              },
            ),
          );
        }
      },
    );
  }
}

class Community {
  final String id;
  final String location;
  final String name;

  Community({
    required this.id,
    required this.location,
    required this.name,
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json['community_id'] as String,
      location: json['community_location'] as String,
      name: json['community_name'] as String,
    );
  }

  @override
  String toString() {
    return name; // or any other representation you prefer
  }
}
