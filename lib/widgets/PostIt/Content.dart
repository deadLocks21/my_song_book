import 'package:flutter/material.dart';

import 'PostItTextManager.dart';

class Content extends StatefulWidget {
  Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final postItTextManager = PostItTextManager.instance;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = postItTextManager.text;
    postItTextManager.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    postItTextManager
        .removeListener(refresh); // rose &tim &flo=famille !!!! : )
  }

  refresh() {
    if (_controller.text != postItTextManager.text) _controller.text = postItTextManager.text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.yellow[300],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(20, 40),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 5,
              spreadRadius: 1)
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                postItTextManager.text = value;
              },
              maxLines: 14,
              decoration: InputDecoration.collapsed(
                  hintText: "Saisis ton texte ici ^^"),
            ),
          ),
        ],
      ),
    );
  }
}
