import 'package:flutter/material.dart';
import 'package:ielts_application/Database/database.dart';
import 'package:ielts_application/Screens/TakingTest.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15,),
      child: StreamBuilder(
        stream: testStream,
        builder: (context, snapshot){
          return snapshot.data == null ? Container(): ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
            return TestModuleTile(testTitle: snapshot.data.documents[index].data()['testTitle'],
                testDescription: snapshot.data.documents[index].data()['testDescription'],
            testID: snapshot.data.documents[index].data()['testID'],);
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
  final String testID;

  TestModuleTile({@required this.testTitle, @required this.testDescription, @required this.testID});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TakingTest(testID)
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black45
        ),
        height: 150,
        width: MediaQuery.of(context).size.width - 48,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(testTitle, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                  SizedBox(
                    height: 6,
                  ),
                  Text(testDescription, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

