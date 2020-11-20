import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ielts_application/Class/Questions.dart';
import 'package:ielts_application/Database/database.dart';
import 'package:ielts_application/Screens/TestTakerResults.dart';
import 'package:ielts_application/Widgets/TakingTestOptionTile.dart';
import 'package:ielts_application/Widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audioplayers/audioplayers.dart';

class TakingTest extends StatefulWidget {

  final String testID;
  final String audioURL;
  TakingTest(this.testID, this.audioURL);

  @override
  _TakingTestState createState() => _TakingTestState();
}

int total = 0;
int correct = 0;
int incorrect = 0;
int notAttempted = 0;
AudioPlayer audioPlayer = AudioPlayer();

class _TakingTestState extends State<TakingTest> {

  DatabaseServices databaseServices = new DatabaseServices();
  QuerySnapshot questionSnapshot;
  bool isLoading = true;

  Questions getQuestionFromDataSnapshot(
      DocumentSnapshot questionSnapshot){

    Questions questions = new Questions();

    questions.question = questionSnapshot.data()['testQuestion'];

    List<String> options =
        [
          questionSnapshot.data()['option1'],
          questionSnapshot.data()['option2'],
          questionSnapshot.data()['option3'],
          questionSnapshot.data()['option4'],
        ];

    options.shuffle();

    questions.option1 = options[0];
    questions.option2 = options[1];
    questions.option3 = options[2];
    questions.option4 = options[3];
    questions.correctOption = questionSnapshot.data()['option1'];
    questions.answered = false;

    return questions;

  }

  @override
  void initState() {
    print("${widget.testID}, audio: ${widget.audioURL}");
    databaseServices.getTestQuestion(widget.testID).then((value){
      questionSnapshot = value;
      notAttempted = 0;
      correct = 0;
      incorrect = 0;
      isLoading = false;
      total = questionSnapshot.docs.length;
      setState(() {
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator(),),
      )
      : SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                  onTap: (){
                    audioPlayer.play("${widget.audioURL}");
                  },
                  child: greyButton(context: context, labelButton: "Play Audio", buttonWidth: MediaQuery.of(context).size.width / 2 -
                      36),
                ),
              SizedBox(
                height: 15,
              ),
              questionSnapshot == null ?
                  Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                  : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: questionSnapshot.docs.length,
                      itemBuilder: (context, index){
                        return TakingTestTile(
                            questions: getQuestionFromDataSnapshot(questionSnapshot.docs[index]), index: index,
                        );
                      }
                  )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => TestTakerResults(
              correctOption: correct,
              incorrectOption: incorrect,
              total: total,
            )
          ));
        },
      ),
    );
  }
}

class TakingTestTile extends StatefulWidget {

  final Questions questions;
  final int index;
  TakingTestTile({this.questions, this.index});

  @override
  _TakingTestTileState createState() => _TakingTestTileState();
}

class _TakingTestTileState extends State<TakingTestTile> {

  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Q${widget.index+1} ${widget.questions.question}", style: TextStyle(fontSize: 18, color: Colors.black87),),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: (){
              if(!widget.questions.answered){
                if(widget.questions.option1 == widget.questions.correctOption){
                  optionSelected = widget.questions.option1;
                  widget.questions.answered = true;
                  correct = correct +1;
                  notAttempted = notAttempted -1;
                  setState(() {});
                }else{
                  optionSelected = widget.questions.option1;
                  widget.questions.answered = true;
                  incorrect = incorrect +1;
                  notAttempted = notAttempted -1;
                  setState(() {});
                }
              }
            },
            child: TakingTestOptionTile(
              correctOption: widget.questions.correctOption,
              optionDescription: widget.questions.option1,
              option: 'A',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: (){
              if(!widget.questions.answered){
                if(widget.questions.option2 == widget.questions.correctOption){
                  optionSelected = widget.questions.option2;
                  widget.questions.answered = true;
                  correct = correct +1;
                  notAttempted = notAttempted -1;
                  print("${widget.questions.correctOption}");
                  setState(() {});
                }else{
                  optionSelected = widget.questions.option2;
                  widget.questions.answered = true;
                  incorrect = incorrect +1;
                  notAttempted = notAttempted -1;
                  setState(() {});
                }
              }
            },
            child: TakingTestOptionTile(
              correctOption: widget.questions.correctOption,
              optionDescription: widget.questions.option2,
              option: 'B',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: (){
              if(!widget.questions.answered){
                if(widget.questions.option3 == widget.questions.correctOption){
                  optionSelected = widget.questions.option3;
                  widget.questions.answered = true;
                  correct = correct +1;
                  notAttempted = notAttempted -1;
                  setState(() {});
                }else{
                  optionSelected = widget.questions.option3;
                  widget.questions.answered = true;
                  incorrect = incorrect +1;
                  notAttempted = notAttempted -1;
                  setState(() {});
                }
              }
            },
            child: TakingTestOptionTile(
              correctOption: widget.questions.correctOption,
              optionDescription: widget.questions.option3,
              option: 'C',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: (){
              if(!widget.questions.answered){
                if(widget.questions.option4 == widget.questions.correctOption){
                  optionSelected = widget.questions.option4;
                  widget.questions.answered = true;
                  correct = correct +1;
                  notAttempted = notAttempted -1;
                  setState(() {});
                }else{
                  optionSelected = widget.questions.option4;
                  widget.questions.answered = true;
                  incorrect = incorrect +1;
                  notAttempted = notAttempted -1;
                  setState(() {});
                }
              }
            },
            child: TakingTestOptionTile(
              correctOption: widget.questions.correctOption,
              optionDescription: widget.questions.option4,
              option: 'D',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

