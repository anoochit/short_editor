import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ShortEditor(
        child: Image.network(
          'https://raw.githubusercontent.com/anoochit/ytThumbnail/master/assets/base/facebook_post.png',
        ),
      ),
    );
  }
}

class ShortEditor extends StatefulWidget {
  const ShortEditor({super.key, required this.child});

  final Widget child;

  @override
  State<ShortEditor> createState() => _ShortEditorState();
}

class _ShortEditorState extends State<ShortEditor> {
  bool showToolBar = false;
  double fontSize = 30.0;
  int currentStyle = 0;
  TextAlign textAlign = TextAlign.center;
  bool fontWeight = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('toolbar roggle ');
        setState(() {
          showToolBar = !showToolBar;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            // base widget
            Center(child: widget.child),

            // text
            Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width - 16.0,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Nisi ut veniam cillum sunt culpa eiusmod consectetur.',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight:
                        (fontWeight) ? FontWeight.w500 : FontWeight.normal,
                  ),
                  textAlign: textAlign,
                ),
              ),
            ),

            // toolbars
            Visibility(
              visible: showToolBar,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 64,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.outlined(
                        onPressed: () {
                          //
                          setState(() {
                            fontWeight = !fontWeight;
                          });
                        },
                        icon: const Icon(Icons.format_bold),
                      ),
                      IconButton.outlined(
                        onPressed: () {
                          //
                          setState(() {
                            textAlign = TextAlign.left;
                          });
                        },
                        icon: const Icon(Icons.format_align_left),
                      ),
                      IconButton.outlined(
                        onPressed: () {
                          //
                          setState(() {
                            textAlign = TextAlign.center;
                          });
                        },
                        icon: const Icon(Icons.format_align_center),
                      ),
                      IconButton.outlined(
                        onPressed: () {
                          //
                          setState(() {
                            textAlign = TextAlign.right;
                          });
                        },
                        icon: const Icon(Icons.format_align_right_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showToolBar,
              child: Positioned(
                right: 8,
                child: SizedBox(
                  width: 64.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 48,
                        height: MediaQuery.sizeOf(context).width,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Slider(
                            value: (fontSize / 50),
                            onChanged: (value) =>
                                setState(() => fontSize = (value * 50)),
                          ),
                        ),
                      ),
                    ],
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
