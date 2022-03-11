import 'package:chat_screen_ui/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MsgWidget extends StatelessWidget {

  String _text = "", _date = "";
  bool _isUserMsg = false;

  MsgWidget({Key? key, required String text, required String date, required bool isUserMsg}) : super(key: key){
    _text = text;
    _date = date;
    _isUserMsg = isUserMsg;
  }


  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: _isUserMsg?Alignment.topRight:Alignment.topLeft,
        child: Stack(
          children: <Widget>[
            Material(
              // elevation: 2,
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _isUserMsg?userMsgBg:otherMsgBg,
                  borderRadius: _isUserMsg?
                  BorderRadius.only(
                      topLeft:Radius.circular(20.0),
                      topRight:Radius.circular(20.0),
                      bottomLeft:Radius.circular(20.0),
                      bottomRight:Radius.circular(0.0)
                  ):
                  BorderRadius.only(
                      topLeft:Radius.circular(0.0),
                      topRight:Radius.circular(20.0),
                      bottomLeft:Radius.circular(20.0),
                      bottomRight:Radius.circular(20.0)
                  ),
                ),
                child: Text(
                  _text,
                  style: TextStyle(
                    color: _isUserMsg?Colors.white:Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
