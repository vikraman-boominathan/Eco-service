import 'package:flutter/material.dart';

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
              width: 200,
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
              width: 200,
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

  Widget buildCommunityTile(BuildContext context,String communityName) {
    return Card(
      child: ListTile(
        title: Text(communityName),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/communityMain');
          },
        ),
      ),
    );
  }
