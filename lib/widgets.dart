import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting

Widget buildDateAndDayCards(String date, String day) {
  String formattedDate =
      DateFormat('dd-MM-yyyy').format(DateTime.now()); // Format current date
  String formattedDay =
      DateFormat('EEEE').format(DateTime.now()); // Format current day

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
                  formattedDate,
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
                  formattedDay,
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

Widget buildRowWithDropdown(
    String label, String selectedValue, void Function(String?) onChanged) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 10),
      Container(
        width: 200,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue, // Set the value to the selected value
                onChanged: onChanged,
                icon: Icon(Icons.keyboard_arrow_down),
                items: <String>[
                  'Aspiration',
                  'Option 1',
                  'Option 2',
                  // Add more items as needed
                ].map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildCategoryCard(int index) {
  List<String> categories = [
    "Glass",
    "Mixed",
    "Sef Lg",
    "Sanitary",
    "Plastic",
    "Paper"
  ];
  String category =
      categories[index - 1]; // Adjust index to access correct category

  return Card(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$category', // Display category from list
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: 'No. of bags',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 5.0),
            ),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: 'Kg of Waste',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 5.0),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    ),
  );
}

Widget buildRemarksCard(TextEditingController remarksController) {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Remarks',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TextField(
            controller: remarksController, // Use remarksController here
            decoration: InputDecoration(
              hintText: 'Remarks',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 5.0),
            ),
          ),
        ],
      ),
    ),
  );
}
