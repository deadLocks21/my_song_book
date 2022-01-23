import 'package:flutter/material.dart';

import 'Content.dart';
import 'OpenedPostItManager.dart';

class PostItWidget extends StatefulWidget {
  final double top;
  final double left;

  PostItWidget({Key? key, this.top = 0, this.left = 0}) : super(key: key);

  @override
  _PostItWidgetState createState() => _PostItWidgetState();
}

class _PostItWidgetState extends State<PostItWidget> {
  final openedPostItManager = OpenedPostItManager.instance;
  GlobalKey _key = GlobalKey();
  late double top = 0, left = 0;
  late double xOff = 0, yOff = 0;

  @override
  void initState() {
    openedPostItManager.addListener(refresh);
    WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
    top = widget.top;
    left = widget.left;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    openedPostItManager.removeListener(refresh);
  }

  refresh() {
    setState(() {});
  }

  void _getRenderOffsets() {
    final RenderBox renderBoxWidget =
        _key.currentContext?.findRenderObject() as RenderBox;
    final offset = renderBoxWidget.localToGlobal(Offset.zero);

    yOff = offset.dy - this.top;
    xOff = offset.dx - this.left;
  }

  void _afterLayout(_) {
    _getRenderOffsets();
  }

  @override
  Widget build(BuildContext context) {
    return openedPostItManager.opened
        ? Positioned(
            key: _key,
            top: top,
            left: left,
            child: Draggable(
              child: Content(),
              feedback: Container(
                width: 300,
                height: 300,
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
              ),
              childWhenDragging: Container(),
              onDragEnd: (drag) {
                setState(() {
                  top = drag.offset.dy - yOff;
                  left = drag.offset.dx - xOff;
                });
              },
            ),
          )
        : Container();
  }
}
