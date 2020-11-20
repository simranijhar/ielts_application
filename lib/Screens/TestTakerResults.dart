import 'package:flutter/material.dart';
import 'package:ielts_application/Widgets/widget.dart';

class TestTakerResults extends StatefulWidget {
  final int correctOption, incorrectOption, total;
  TestTakerResults({@required this.correctOption, @required this.incorrectOption, @required this.total});

  @override
  _TestTakerResultsState createState() => _TestTakerResultsState();
}

class _TestTakerResultsState extends State<TestTakerResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Results : ${widget.correctOption}/${widget.total}", style: TextStyle(fontSize: 25),),
            SizedBox(
              height: 25,
            ),
            Text("You answered ${widget.correctOption} questions correctly"
                " and ${widget.incorrectOption} questions incorrectly", style: TextStyle(fontSize: 15, color: Colors.black45),
            textAlign: TextAlign.center,),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: greyButton(context: context, labelButton: "Go To Main Screen", buttonWidth: MediaQuery.of(context).size.width/2))
          ],),
        ),
      )
    );
  }
}
