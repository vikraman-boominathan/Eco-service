import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Community/dropdown.dart';
import 'package:http/http.dart' as http;
import '../hive/community.dart';

class CommunityListBuilder extends StatelessWidget {
  final List<Community> communities;
  final Function(Community?)? onDropdownChanged;

  const CommunityListBuilder({
    Key? key,
    required this.communities,
    required this.onDropdownChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomDropdown(
        dropdownItems: communities,
        onChange: onDropdownChanged,
      ),
    );
  }
}

Future<List<Community>> fetchCommunities() async {
  await Hive.initFlutter();
  await Hive.openBox<Community>('communities');

  final Box<Community> box = Hive.box('communities');

  if (box.isNotEmpty) {
    List<Community> communities = List<Community>.from(box.values);

    return communities;
  } else {
    final response = await http
        .get(Uri.parse('http://localhost:4000/api/list_of_communities'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Community> communities =
          jsonResponse.map((json) => Community.fromJson(json)).toList();

      await box.addAll(communities);

      return communities;
    } else {
      throw Exception('Failed to load communities');
    }
  }
}

