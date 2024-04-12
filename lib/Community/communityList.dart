import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'community.g.dart';
import 'dropdown.dart';
import 'package:http/http.dart' as http;

class CommunityListBuilder extends StatelessWidget {
  final Future<List<Community>> communities;
  final Function(Community?)? onDropdownChanged;

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
          return const Center(child: CircularProgressIndicator());
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

// class Community {
//   final String id;
//   final String location;
//   final String name;
//   final String gate_photo_file_name;
//   final double lat;
//   final double long;

//   Community({
//     required this.id,
//     required this.location,
//     required this.name,
//     required this.gate_photo_file_name,
//     required this.lat,
//     required this.long,
//   });

//   factory Community.fromJson(Map<String, dynamic> json) {
//   return Community(
//     id: json['community_id'] as String? ?? '',
//     location: json['community_location'] as String? ?? '',
//     name: json['community_name'] as String? ?? '',
//     gate_photo_file_name: json['gate_photo_file_name'] as String? ?? '',
//     lat: json['latitude']as double? ?? 0.0,
//     long: json['longtitude']as double? ?? 0.0, 
//   );
// }

//   @override
//   String toString() {
//     return name;
//   }
// }

Future<List<Community>> fetchCommunities() async {
  final Box<Community> box = await Hive.openBox<Community>('community_box');

  if (box.isNotEmpty) {
    List<Community> communities = box.values.toList();
    await box.close();
    return communities;
  }

  final response = await http.get(Uri.parse('http://localhost:4000/api/list_of_communities'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    List<Community> communities = jsonResponse.map((json) => Community(
      id: json['community_id'] as String? ?? '',
      location: json['community_location'] as String? ?? '',
      name: json['community_name'] as String? ?? '',
      gatePhotoFileName: json['gate_photo_file_name'] as String? ?? '',
      lat: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      long: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    )).toList();

    for (var community in communities) {
      await box.add(community);
    }

    await box.close();
    return communities;
  } else {
    await box.close();
    throw Exception('Failed to load communities');
  }
}


