import 'package:flutter/material.dart';
import 'package:my_song_book/components/InitializationPage.dart';
import 'package:window_size/window_size.dart' as window_size;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  window_size.getWindowInfo().then((window) {
    final screen = window.screen;
    if (screen != null) {
      final screenFrame = screen.visibleFrame;
      final width = screenFrame.width;
      final height = screenFrame.height;
      final left = 0.0;
      final top = 0.0;
      final frame = Rect.fromLTWH(left, top, width, height);
      window_size.setWindowFrame(frame);
      window_size.setWindowMinSize(Size(0.3 * width, 0.3 * height));
      window_size.setWindowMaxSize(Size(1.2 * width, 1.2 * height));
    }
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InitializationPage(),
    );
  }
}