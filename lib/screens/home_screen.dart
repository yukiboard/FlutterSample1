import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final String _defaultTextHeader = "あなたの名前を教えてください。";
  String _textHeader = _defaultTextHeader;
  TextEditingController _textEditingController = TextEditingController();
  Widget _imageWidget = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("はじめてのアプリ"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  _textHeader,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  controller: _textEditingController // TODO:入力した文字を管理するTextIn,
                  ),
              Expanded(child: _imageWidget),
              SizedBox(
                child: RaisedButton(
                  onPressed: () => _onClick(), // TODO: ボタンのクリック処理
                  child: Text(
                    "押してね！！",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                width: double.infinity,
              ),
            ],
          ),
        ));
  }

  _onClick() {
    setState(() {
      var inputText = _textEditingController.text;
      if(inputText=="") {
        _textHeader = _defaultTextHeader;
        _imageWidget = Container();
      }else {
        _textHeader = "こんにちわ！$inputTextさん";
        _imageWidget = Image.asset("assets/images/original.png");
      }
    });
  }
}
