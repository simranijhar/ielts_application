import 'package:flutter/material.dart';
import 'package:ielts_application/Widgets/widget.dart';
import 'package:ielts_application/Screens/AdminMenu.dart';
import 'package:ielts_application/Screens/TestTakerMenu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMenu()
                  ));
                },
                child: greyButton(context: context,
                    labelButton: "Admin"),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TestTakerMenu()
                  ));
                },
                child: greyButton(context: context,
                    labelButton: "Test Taker"),
              ),
              SizedBox(
                height: 275,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
