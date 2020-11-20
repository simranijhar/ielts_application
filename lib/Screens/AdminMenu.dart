import 'package:flutter/material.dart';
import 'package:ielts_application/Screens/AdminOverallResult.dart';
import 'package:ielts_application/Screens/TakingTest.dart';
//mport 'package:ielts_application/Screens/TestTakerResults.dart';
import 'package:ielts_application/Widgets/widget.dart';
import 'package:ielts_application/Screens/CreateTestModule.dart';

class AdminMenu extends StatefulWidget {
  @override
  _AdminMenuState createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTestModule()
                  ));
                },
                child: greyButton(
                  context: context,
                  labelButton: "Create Test Module"
                ),
              ),
              SizedBox(
                height: 50
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminOverallResult(
                    correctOption: correct,
                    incorrectOption: incorrect,
                    total: total,
                  )
                  ));
                },
                child: greyButton(
                    context: context,
                    labelButton: "Overall Result"
                ),
              ),
              SizedBox(
                height: 275,
              )
            ],
          ),
        ),
      ),
    );
  }
}
