import 'package:flutter/material.dart';


import '../hive/community.dart';

Widget buildDateAndDayCards(
    String date, String day, String formattedDate, String formattedDay) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 125,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formattedDate.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 125,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formattedDay.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildCommunityTile(BuildContext context, Community community) {
  return Card(
    child: ListTile(
      title: Text(community.name),
      trailing: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 94, 160, 98),
          borderRadius: BorderRadius.circular(15), 
        ),
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/communityMain',
                arguments: community);
          },
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
        ),
      ),
    ),
  );
}

Widget buildListTile(BuildContext context, List<Community> communities) {
  return ListView.builder(
    itemCount: communities.length,
    itemBuilder: (context, index) {
      return buildCommunityTile(context, communities[index]);
    },
  );
}

