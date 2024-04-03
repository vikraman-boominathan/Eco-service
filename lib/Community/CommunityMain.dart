import 'package:intl/intl.dart';
import 'communityData.dart';
import 'communityList.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'widgets.dart';

class CommunityMain extends StatefulWidget {
  @override
  _CommunityMainState createState() => _CommunityMainState();
}

class _CommunityMainState extends State<CommunityMain> {
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
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String formattedDate1 = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formattedDay = DateFormat('EEEE').format(DateTime.now());

  @override
  void initState() {
    super.initState();

    communities = fetchCommunities();
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
                      setState(() {
                        selectedDropdownValue = community.id;
                      });
                    }
                  },
                ),
                SizedBox(height: 10),
                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    buildCategoryCard(1, bagsController1, kgController1),
                    buildCategoryCard(2, bagsController2, kgController2),
                    buildCategoryCard(3, bagsController3, kgController3),
                    buildCategoryCard(4, bagsController4, kgController4),
                    buildCategoryCard(5, bagsController5, kgController5),
                    buildCategoryCard(6, bagsController6, kgController6),
                  ],
                ),
                buildRemarksCard(remarksController),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        CommunityData communityData = CommunityData(
                          date: "~D[$formattedDate1]",
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

                        CommunityData? createdData =
                            await createCommunityData(communityData, context);
                        remarksController.clear();
                        bagsController1.clear();
                        kgController1.clear();
                        bagsController2.clear();
                        kgController2.clear();
                        bagsController3.clear();
                        kgController3.clear();
                        bagsController4.clear();
                        kgController4.clear();
                        bagsController5.clear();
                        kgController5.clear();
                        bagsController6.clear();
                        kgController6.clear();
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
