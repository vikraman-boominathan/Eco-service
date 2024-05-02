// ElevatedButton(
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return AlertDialog(
            //           title: const Text('Add Community'),
            //           content: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               CommunityListBuilder(
            //                 communities: communityBox.values.toList(),
            //                 onDropdownChanged: (community) {
            //                   if (community != null) {
            //                     setState(() {
            //                       selectedValue = community.id;
            //                     });
            //                   }
            //                 },
            //               ),
            //               const SizedBox(height: 20),
            //               ElevatedButton(
            //                 onPressed: () async {
            //                    scheduleData = ScheduleData(
            //                     communityId: selectedValue,
            //                     schedule_id: scheduleId,
            //                   );

            //                   await createScheduleData(scheduleData);
            //                   print('selected Value: $selectedValue');
            //                   Navigator.of(context).pop();
            //                   ScaffoldMessenger.of(context).showSnackBar(
            //                     const SnackBar(
            //                       content: Text('Community Added'),
            //                     ),
            //                   );
            //                 },
            //                 child: const Text('Submit'),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     );
            //   },
            //   child: const Text('Add Community'),
            // ),