import 'package:flutter/material.dart';
import 'package:ielts_application/Database/database.dart';
import 'package:ielts_application/Widgets/widget.dart';

class AddTestQuestions extends StatefulWidget {
  final String testID;

  AddTestQuestions(this.testID);

  @override
  _AddTestQuestionsState createState() => _AddTestQuestionsState();
}

class _AddTestQuestionsState extends State<AddTestQuestions> {
  DatabaseServices databaseServices = new DatabaseServices();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  String testQuestion,
      option1,
      option2,
      option3,
      option4;

  createTestQuestion() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> questionMap = {
        "testQuestion": testQuestion,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      databaseServices.addQuestion(questionMap, widget.testID).then((value) {
        setState(() {
          _isLoading = false;
        });
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
                          value.isEmpty ? "Enter Test Question" : null,
                      decoration: InputDecoration(
                        hintText: "Test Question",
                      ),
                      onChanged: (value) {
                        testQuestion = value;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Enter Option 1" : null,
                      decoration: InputDecoration(
                          hintText: "Option 1 (Correct Answer)"),
                      onChanged: (value) {
                        option1 = value;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Enter Option 2" : null,
                      decoration: InputDecoration(
                        hintText: "Option 2",
                      ),
                      onChanged: (value) {
                        option2 = value;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Enter Option 3" : null,
                      decoration: InputDecoration(
                        hintText: "Option 3",
                      ),
                      onChanged: (value) {
                        option3 = value;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Enter Option 4" : null,
                      decoration: InputDecoration(
                        hintText: "Option 4",
                      ),
                      onChanged: (value) {
                        option4 = value;
                      },
                    ),
                    Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: greyButton(
                                context: context,
                                labelButton: "Submit",
                                buttonWidth:
                                    MediaQuery.of(context).size.width / 2 -
                                        36)),
                        SizedBox(
                          width: 24,
                        ),
                        GestureDetector(
                            onTap: () {
                              createTestQuestion();
                            },
                            child: greyButton(
                                context: context,
                                labelButton: "Add Question",
                                buttonWidth:
                                    MediaQuery.of(context).size.width / 2 -
                                        36)),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
