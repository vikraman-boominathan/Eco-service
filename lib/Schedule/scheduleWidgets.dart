import 'package:eco_service/Schedule/scheduleList.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../Community/communityList.dart';
import 'scheduleList.dart';

Widget buildDateAndDayCards(
    String date, String day, String formattedDate, String formattedDay) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$date',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Container(
            width: 125,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formattedDate.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$day',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Container(
            width: 125,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formattedDay.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildCommunityTile(BuildContext context, String communityName) {
  return Card(
    child: ListTile(
      title: Text(communityName),
      trailing: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 94, 160, 98),
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/communityMain',
                arguments: communityName);
          },
          padding: EdgeInsets.zero,
          alignment: Alignment.center
        ),
      ),
    ),
  );
}


  Widget buildListTile(BuildContext context) {
  return ValueListenableBuilder<Box>(
    valueListenable: Hive.box('communitiesBox').listenable(),
    builder: (context, box, _) {
      if (box.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        final List<Community> communities = box.get('communities', defaultValue: []);
        return ListView.builder(
          itemCount: communities.length,
          itemBuilder: (context, index) {
            return buildCommunityTile(context, communities[index].name);
          },
        );
      }
    },
  );
}

