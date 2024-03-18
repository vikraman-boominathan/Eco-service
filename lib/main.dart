import 'package:flutter/material.dart';
import 'widgets.dart';
import 'dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedCommunity = 'Aspiration';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController remarksController = TextEditingController();

  @override
  void dispose() {
    remarksController.dispose();
    super.dispose();
  }

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
        backgroundColor: Colors.lightGreen[300],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    buildDateAndDayCards("Date", "Day"),
                    CustomDropdown(),
                    SizedBox(height: 10),
                    for (int i = 1; i <= 6; i++)
                      Flexible(child: buildCategoryCard(i)),
                    Flexible(child: buildRemarksCard(remarksController)),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Form is validated, print the data
                            print('Community: $selectedCommunity');
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
        ),
      ),
    );
  }
}
