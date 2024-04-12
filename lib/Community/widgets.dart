import 'package:flutter/material.dart';


Widget buildNamedCards(
    String name1, String name2, String value1, String value2) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name1,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 125,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value1,
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
            name2,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 125,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                 value2,
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

Widget buildCategoryCard(int index, TextEditingController bagsController,
    TextEditingController kgController) {
  List<String> categories = [
    "Glass",
    "Mixed",
    "Sef Lg",
    "Sanitary",
    "Plastic",
    "Paper"
  ];
  String category = categories[index - 1];

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: bagsController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'No. of bags',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            ),
          ),
          // SizedBox(height: 5),
          // // TextField(
          // //   controller: kgController,
          // //   keyboardType: TextInputType.number,
          // //   decoration: InputDecoration(
          // //     hintText: 'Kg of Waste',
          // //     hintStyle: TextStyle(fontSize: 16),
          // //     border: OutlineInputBorder(),
          // //     contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 8.0),
          // //   ),
          // // ),
          // SizedBox(height: 5),
        ],
      ),
    ),
  );
}

Widget buildRemarksCard(TextEditingController remarksController) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Remarks',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: remarksController,
            decoration: const InputDecoration(
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

Widget buildButtons() {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                
              },
              icon: const Icon(Icons.location_on),
              label: const Text('Location'),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                
              },
              icon: const Icon(Icons.image),
              label: const Text('Image'),
            ),
          ),
        ],
      ),
    );
  }

