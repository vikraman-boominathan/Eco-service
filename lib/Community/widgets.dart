import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
    TextEditingController kgController, BuildContext context) {
  List<String> categories = [
    AppLocalizations.of(context)!.glass,
    AppLocalizations.of(context)!.mixed,
    AppLocalizations.of(context)!.seglf,
    AppLocalizations.of(context)!.sanitary,
    AppLocalizations.of(context)!.plastic,
    AppLocalizations.of(context)!.paper,
    AppLocalizations.of(context)!.miscellaneous
  ];

  
  if (index < 1 || index > categories.length) {
    throw ArgumentError('Index is out of bounds');
  }

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
            decoration:  InputDecoration(
              hintText: AppLocalizations.of(context)!.noofbags,
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            ),
          ),
          // SizedBox(height: 5),
          // TextField(
          //   controller: kgController,
          //   keyboardType: TextInputType.number,
          //   decoration: InputDecoration(
          //     hintText: 'Kg of Waste',
          //     hintStyle: TextStyle(fontSize: 16),
          //     border: OutlineInputBorder(),
          //     contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 8.0),
          //   ),
          // ),
          // SizedBox(height: 5),
        ],
      ),
    ),
  );
}

Widget buildRemarksCard(TextEditingController remarksController, BuildContext context) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            AppLocalizations.of(context)!.remarks,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: remarksController,
            decoration:  InputDecoration(
              hintText: AppLocalizations.of(context)!.remarks,
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(),
             contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            ),
          ),
        ],
      ),
    ),
  );
}




