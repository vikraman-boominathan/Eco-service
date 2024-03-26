import 'package:flutter/material.dart';
import 'widgets.dart'; // Import other dependencies as needed
import 'dropdown.dart'; // Import other dependencies as needed
import 'communityList.dart'; // Import the CommunityListBuilder widget
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Community>> communities;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController remarksController = TextEditingController();
  TextEditingController bagsController1 = TextEditingController();
  TextEditingController kgController1 = TextEditingController();
  TextEditingController bagsController2 = TextEditingController();
  TextEditingController kgController2 = TextEditingController();
  TextEditingController bagsController3 = TextEditingController();
  TextEditingController kgController3 = TextEditingController();
  TextEditingController bagsController4 = TextEditingController();
  TextEditingController kgController4 = TextEditingController();
  TextEditingController bagsController5 = TextEditingController();
  TextEditingController kgController5 = TextEditingController();
  TextEditingController bagsController6 = TextEditingController();
  TextEditingController kgController6 = TextEditingController();

  String? selectedDropdownValue;
  String formattedDate =
      DateFormat('dd-MM-yyyy').format(DateTime.now()); // Format current date
  String formattedDay = DateFormat('EEEE').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    communities = fetchCommunities();
  }

  Future<List<Community>> fetchCommunities() async {
    final response = await http
        .get(Uri.parse('http://localhost:4000/api/list_of_communities'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Community> communities =
          jsonResponse.map((json) => Community.fromJson(json)).toList();
      return communities;
    } else {
      throw Exception('Failed to load communities');
    }
  }

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
      backgroundColor: Colors.lightGreen[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                buildDateAndDayCards(
                    "Date", "Day", formattedDate, formattedDay),
                SizedBox(height: 10),
                CommunityListBuilder(
                  communities: communities,
                  onDropdownChanged: (selectedValue) {
                    setState(() {
                      selectedDropdownValue = selectedValue;
                    });
                  },
                ),
                SizedBox(height: 10),
                buildCategoryCard(1, bagsController1, kgController1),
                buildCategoryCard(2, bagsController2, kgController2),
                buildCategoryCard(3, bagsController3, kgController3),
                buildCategoryCard(4, bagsController4, kgController4),
                buildCategoryCard(5, bagsController5, kgController5),
                buildCategoryCard(6, bagsController6, kgController6),
                buildRemarksCard(remarksController),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is validated, print the data
                        print('Selected Date: $formattedDate');
                        print('Selected Community: $selectedDropdownValue');

                        print(
                            'Category 1 - Bags: ${bagsController1.text}, Kg of Waste: ${kgController1.text}');
                        print(
                            'Category 2 - Bags: ${bagsController2.text}, Kg of Waste: ${kgController2.text}');
                        print(
                            'Category 3 - Bags: ${bagsController3.text}, Kg of Waste: ${kgController3.text}');
                        print(
                            'Category 4 - Bags: ${bagsController4.text}, Kg of Waste: ${kgController4.text}');
                        print(
                            'Category 5 - Bags: ${bagsController5.text}, Kg of Waste: ${kgController5.text}');
                        print(
                            'Category 6 - Bags: ${bagsController6.text}, Kg of Waste: ${kgController6.text}');

                        print('Remarks: ${remarksController.text}');
                      }
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
