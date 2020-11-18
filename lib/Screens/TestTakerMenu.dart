import 'package:flutter/material.dart';
import 'package:ielts_application/Database/database.dart';
import 'package:ielts_application/Widgets/widget.dart';

class TestTakerMenu extends StatefulWidget {
  @override
  _TestTakerMenuState createState() => _TestTakerMenuState();
}

class _TestTakerMenuState extends State<TestTakerMenu> {

  Stream testStream;

  DatabaseServices databaseServices = new DatabaseServices();

  Widget testModuleList(){
    return Container(
      child: StreamBuilder(
        stream: testStream,
        builder: (context, snapshot){
          return snapshot.data == null ? Container(): ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
            return TestModuleTile(testTitle: snapshot.data.documents[index].data['testTitle'],
                testDescription: snapshot.data.documents[index].data['testDescription']);
          });
        },
      ),
    );
  }

  @override
  void initState(){
    databaseServices.getTest().then((value){
      setState(() {
        testStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: testModuleList()
    );
  }
}

class TestModuleTile extends StatelessWidget {
  final String testTitle;
  final String testDescription;

  TestModuleTile({@required this.testTitle, @required this.testDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [Text(testTitle), Text(testDescription)],
            ),
          )
        ],
      ),
    );
  }
}

