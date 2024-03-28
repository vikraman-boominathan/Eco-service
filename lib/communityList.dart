import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dropdown.dart'; // Make sure to import required dependencies
import 'widgets.dart'; // Make sure to import required dependencies
import 'package:http/http.dart' as http;

class CommunityListBuilder extends StatelessWidget {
  final Future<List<Community>> communities;
  final Function(Community?)?
      onDropdownChanged; // Adjusted the type of onDropdownChanged

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
              onChange: onDropdownChanged,
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
Future<List<Community>> fetchCommunities() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
  // Check if data exists locally
  final String? storedData = prefs.getString('community_data');
  if (storedData != null) {
    List<dynamic> jsonResponse = jsonDecode(storedData);
    List<Community> communities =
        jsonResponse.map((json) => Community.fromJson(json)).toList();
    return communities;
  } else {
    final response = await http
        .get(Uri.parse('http://localhost:4000/api/list_of_communities'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Community> communities =
          jsonResponse.map((json) => Community.fromJson(json)).toList();
      
      // Store data locally
      await prefs.setString('community_data', jsonEncode(jsonResponse));

      return communities;
    } else {
      throw Exception('Failed to load communities');
    }
  }
}
