import 'package:flutter/material.dart';

class TakingTestOptionTile extends StatefulWidget {

  final String option, optionDescription, correctOption, optionSelected;
  TakingTestOptionTile({@required this.option, @required this.optionDescription, @required this.correctOption, @required this.optionSelected});

  @override
  _TakingTestOptionTileState createState() => _TakingTestOptionTileState();
}

class _TakingTestOptionTileState extends State<TakingTestOptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.optionDescription == widget.optionSelected
                  ? widget.optionDescription == widget.correctOption
                      ? Colors.green.withOpacity(0.7)
                      : Colors.red.withOpacity(0.7)
                      : Colors.grey, width: 1.4),
              borderRadius: BorderRadius.circular(30)
            ),
            alignment: Alignment.center,
            child: Text("${widget.option}", style: TextStyle(
              color: widget.optionSelected == widget.optionDescription
                  ? widget.correctOption == widget.optionSelected
                  ? Colors.green.withOpacity(0.7)
                  : Colors.red
                  : Colors.black54
            ),),
          ),
          SizedBox(width: 8,),
          Text(widget.optionDescription, style: TextStyle(fontSize: 17, color: Colors.black54),)
        ],
      ),
    );
  }
}
