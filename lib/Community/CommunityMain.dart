import 'package:intl/intl.dart';
import '../api/communityData.dart';
import 'package:flutter/material.dart';

import '../hive/communityData.dart';
import 'widgets.dart';
import '../hive/community.dart';

class CommunityMain extends StatefulWidget {
  const CommunityMain({super.key});

  @override
  State<CommunityMain> createState() => _CommunityMainState();
}

class _CommunityMainState extends State<CommunityMain> {
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
  TextEditingController bagsController7 = TextEditingController();
  TextEditingController kgController7 = TextEditingController();

  String? selectedDropdownValue;
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String formattedDate1 = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formattedDay = DateFormat('EEEE').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final Community community =
        ModalRoute.of(context)?.settings.arguments as Community;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Color.fromARGB(255, 140, 201, 143)),
        title: const Text(
          'ECO Service',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xff204e22),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 140, 201, 143),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                buildNamedCards(
                  "Community",
                  "Location_Area_Zone",
                  community.name,
                  community.location,
                ),
                const SizedBox(height: 10),
                
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    childAspectRatio: 1 / .6,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [
                      buildCategoryCard(
                        1,
                        bagsController1,
                        kgController1,
                      ),
                      buildCategoryCard(
                        2,
                        bagsController2,
                        kgController2,
                      ),
                      buildCategoryCard(
                        3,
                        bagsController3,
                        kgController3,
                      ),
                      buildCategoryCard(
                        4,
                        bagsController4,
                        kgController4,
                      ),
                      buildCategoryCard(
                        5,
                        bagsController5,
                        kgController5,
                      ),
                      buildCategoryCard(
                        6,
                        bagsController6,
                        kgController6,
                      ),
                      buildCategoryCard(
                        7,
                        bagsController6,
                        kgController6,
                      ),
                    ],
                  ),
                ),
                buildCategoryCard(
                        7,
                        bagsController7,
                        kgController7,
                      ),
                buildRemarksCard(remarksController),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        CommunityData communityData = CommunityData(
                          date: formattedDate1,
                          communityId: community.id,
                          mixedBags: int.parse(bagsController1.text),
                          kgOfMixed: double.tryParse(kgController1.text) ?? 0,
                          glassBags: int.parse(bagsController2.text),
                          kgOfGlass: double.tryParse(kgController2.text) ?? 0,
                          plasticBags: int.parse(bagsController3.text),
                          kgOfPlastic: double.tryParse(kgController3.text) ?? 0,
                          paperBags: int.parse(bagsController4.text),
                          kgOfPaper: double.tryParse(kgController4.text) ?? 0,
                          segLfBags: int.parse(bagsController5.text),
                          kgOfSegLf: double.tryParse(kgController5.text) ?? 0,
                          sanitoryBags: int.parse(bagsController6.text),
                          kgOfSanitory:
                              double.tryParse(kgController6.text) ?? 0,
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
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
