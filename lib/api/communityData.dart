import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../hive/communityData.dart';

Future<CommunityData?> createCommunityData(
    CommunityData communityData, BuildContext context) async {
  try {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://localhost:4000/api/add_waste'));
    request.body = json.encode({
      'date': communityData.date,
      'community_id': communityData.communityId,
      'mixed_bags': communityData.mixedBags,
      'glass_bags': communityData.glassBags,
      'plastic_bags': communityData.plasticBags,
      'paper_bags': communityData.paperBags,
      'seg_lf_bags': communityData.segLfBags,
      'sanitory_bags': communityData.sanitoryBags,
      'kg_of_glass': communityData.kgOfGlass,
      'kg_of_mixed': communityData.kgOfMixed,
      'kg_of_plastic': communityData.kgOfPlastic,
      'kg_of_paper': communityData.kgOfPaper,
      'kg_of_seg_lf': communityData.kgOfSegLf,
      'kg_of_sanitory': communityData.kgOfSanitory,
      'comments': communityData.comments,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.reasonPhrase);

    if (response.statusCode == 201) {
      final responseBody = await utf8.decodeStream(response.stream);
      print(responseBody);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("$responseBody"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(
                "Failed to create community data: ${response.reasonPhrase}"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  } catch (e) {
    print('Error: $e');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("An error occurred: $e"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
