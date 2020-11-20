import 'package:flutter/material.dart';
import 'package:ielts_application/Database/database.dart';
import 'package:ielts_application/Screens/AddTestQuestions.dart';
import 'package:ielts_application/Widgets/widget.dart';
import 'package:random_string/random_string.dart';

class CreateTestModule extends StatefulWidget {
  @override
  _CreateTestModuleState createState() => _CreateTestModuleState();
}

class _CreateTestModuleState extends State<CreateTestModule> {
  DatabaseServices databaseServices = new DatabaseServices();

  final _formKey = GlobalKey<FormState>();
  String testID, testTitle, testDescription, audioURL;
  bool _isLoading = false;

  createModuleFirebase() {
    testID = randomAlphaNumeric(16);
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> testMap = {
        "testID": testID,
        "audioURL" : audioURL,
        "testTitle": testTitle,
        "testDescription": testDescription
      };

      databaseServices.addTest(testMap, testID).then((value) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AddTestQuestions(testID)
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBar(context),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        body: _isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) =>
                        value.isEmpty ? "Enter Audio URL" : null,
                        decoration: InputDecoration(
                          hintText: "Audio URL",
                        ),
                        onChanged: (value) {
                          audioURL = value;
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value.isEmpty ? "Enter Test Title" : null,
                        decoration: InputDecoration(
                          hintText: "Test Title",
                        ),
                        onChanged: (value) {
                          testTitle = value;
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value.isEmpty ? "Enter Test Description" : null,
                        decoration: InputDecoration(
                          hintText: "Test Description",
                        ),
                        onChanged: (value) {
                          testDescription = value;
                        },
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          createModuleFirebase();
                        },
                        child: greyButton(context: context,
                            labelButton: "Create Module"),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
