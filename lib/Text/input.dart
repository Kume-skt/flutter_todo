import 'package:flutter/material.dart';

class TitleText extends StatefulWidget {
  final String title;
  Function(String) onChenge;
  TitleText(this.title, this.onChenge);
  @override
  _TitleText createState() => _TitleText();
}

class _TitleText extends State<TitleText> {
  late String _text = "";
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(text: widget.title);
  }

  void setText(String val) {
    widget.onChenge(val);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: _textEditingController,
        style: TextStyle(fontSize: 20),
        onChanged: setText,
        decoration: InputDecoration(
          hintText: "タイトル",
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
