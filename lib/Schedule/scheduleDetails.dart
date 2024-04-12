import 'package:eco_service/Schedule/scheduleList.dart';
import 'package:eco_service/Schedule/scheduledata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Community/community.g.dart';
import '../Community/communityList.dart';
import 'scheduleWidgets.dart';

class ScheduleDetailScreen extends StatefulWidget {
  const ScheduleDetailScreen({super.key});

  @override
  State<ScheduleDetailScreen> createState() => _ScheduleDetailScreenState();
}

class _ScheduleDetailScreenState extends State<ScheduleDetailScreen> {
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  String formattedDate1 = DateFormat('yyyy-MM-dd').format(DateTime.now());

  String formattedDay = DateFormat('EEEE').format(DateTime.now());

  String? selectedValue;

  late Future<List<Community>> communities;

  @override
  void initState() {
    super.initState();

    communities = fetchCommunities();
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Schedule of the Day',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            buildDateAndDayCards("Date", "Day", formattedDate, formattedDay),
            const SizedBox(height: 20),
            const Text(
              'List of Community',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Expanded(
              child:buildListTile(context,)
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Add Community'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommunityListBuilder(
                            communities: communities,
                            onDropdownChanged: (community) {
                              if (community != null) {
                                setState(() {
                                  selectedValue = community.id;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                               ScheduleDetails details = await getDetails();
                              ScheduleData scheduleData = ScheduleData(
                          
                          communityId: selectedValue ?? "",
                          schedule_id: details.scheduleId,
                          
                        );

                        ScheduleData? createdData =
                            await createScheduleData(scheduleData);
                              print('selected Value: $selectedValue');
                              Navigator.of(context).pop();
                              setState(() {
                                
                              });
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Add Community'),
            ),
          ],
        ),
      ),
    );
  }
}
