// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String selectedCommunity = 'Aspiration'; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
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
        backgroundColor:
            Colors.lightGreen[300],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                buildRowWithCard('Date:', '13-03-2024'),
                SizedBox(height: 10),
                buildRowWithCard('Day:', 'Wednesday'),
                SizedBox(height: 10),
                buildRowWithDropdown(
                  'Community',
                  selectedCommunity,
                  (String? selectedItem) {
                   
                    print('Selected item: $selectedItem');
                    if (selectedItem != null) {
                      selectedCommunity = selectedItem;
                    }
                  },
                ),
                SizedBox(height: 10),
                for (int i = 1; i <= 6; i++) buildCategoryCard(i),
                buildRemarksCard(),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 20), 
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



Widget buildRowWithCard(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 10),
      SizedBox(
        width: 200,
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
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
                value: selectedValue, 
                onChanged: onChanged,
                icon: Icon(Icons.keyboard_arrow_down),
                items: <String>[
                  'Aspiration',
                  'Option 1',
                  'Option 2',
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
      categories[index - 1]; 

  return Card(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$category', 
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'No. of bags',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                },
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Kg of Waste',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                },
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    ),
  );
}




Widget buildRemarksCard() {
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
