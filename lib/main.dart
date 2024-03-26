import 'package:flutter/material.dart';
import 'widgets.dart'; // Import other dependencies as needed
import 'dropdown.dart'; // Import other dependencies as needed
import 'communityList.dart'; // Import the CommunityListBuilder widget
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'communityData.dart';

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
  String formattedDate1 = DateFormat('yyyy-MM-dd').format(DateTime.now()); // F
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

  Future<CommunityData> createCommunityData(CommunityData communityData) async {
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
print(response.statusCode);
    if (response.statusCode == 201) {
      final responseBody = await utf8.decodeStream(response.stream);
      print(responseBody);
      final decodedData = jsonDecode(responseBody);
      return CommunityData.fromJson(decodedData as Map<String, dynamic>);
    } else {
      throw Exception(
          'Failed to create community data: ${response.reasonPhrase}');
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
                  onDropdownChanged: (community) {
                    if (community != null) {
                      // Check if community is not null
                      setState(() {
                        selectedDropdownValue = community.id;
                      });
                    }
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        CommunityData communityData = CommunityData(
                          date: "~D[2024-12-31]",
                          communityId: selectedDropdownValue ?? "",
                          mixedBags: int.parse(bagsController1.text),
                          kgOfMixed: double.parse(kgController1.text),
                          glassBags: int.parse(bagsController2.text),
                          kgOfGlass: double.parse(kgController2.text),
                          plasticBags: int.parse(bagsController3.text),
                          kgOfPlastic: double.parse(kgController3.text),
                          paperBags: int.parse(bagsController4.text),
                          kgOfPaper: double.parse(kgController4.text),
                          segLfBags: int.parse(bagsController5.text),
                          kgOfSegLf: double.parse(kgController5.text),
                          sanitoryBags: int.parse(bagsController6.text),
                          kgOfSanitory: double.parse(kgController6.text),
                          comments: remarksController.text,
                        );
                        print('date: ${communityData.date}');
                        print('community_id: ${communityData.communityId}');
                        print('mixed_bags: ${communityData.mixedBags}');
                        print('glass_bags: ${communityData.glassBags}');
                        print('plastic_bags: ${communityData.plasticBags}');
                        print('paper_bags: ${communityData.paperBags}');
                        print('seg_lf_bags: ${communityData.segLfBags}');
                        print('sanitory_bags: ${communityData.sanitoryBags}');
                        print('kg_of_glass: ${communityData.kgOfGlass}');
                        print('kg_of_mixed: ${communityData.kgOfMixed}');
                        print('kg_of_plastic: ${communityData.kgOfPlastic}');
                        print('kg_of_paper: ${communityData.kgOfPaper}');
                        print('kg_of_seg_lf: ${communityData.kgOfSegLf}');
                        print('kg_of_sanitory: ${communityData.kgOfSanitory}');
                        print('comments: ${communityData.comments}');
                        CommunityData createdData = await createCommunityData(
                          communityData, /* pass community object here */
                        );

                        print(
                            "Community data created successfully: $createdData");
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
