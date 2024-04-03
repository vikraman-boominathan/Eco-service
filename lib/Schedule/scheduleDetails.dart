import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'scheduleWidgets.dart';



class ScheduleDetails extends StatelessWidget {
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String formattedDate1 = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formattedDay = DateFormat('EEEE').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'ECO Service',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff204e22),
            ),
          ),
          backgroundColor: Colors.white,
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Schedule of the Day',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            buildDateAndDayCards("Date", "Day", formattedDate, formattedDay),
            SizedBox(height: 20),
            Text(
              'List of Community',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildCommunityTile(context, 'Aspiration'),
                  buildCommunityTile(context, 'Celebration'),
                  buildCommunityTile(context, 'Shakthi'),
                  buildCommunityTile(context, 'New Creation'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle add community
              },
              child: Text('Add Community'),
            ),
          ],
        ),
      ),
    );
  }

  
}