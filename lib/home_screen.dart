import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tv/list_view.dart';
import 'package:flutter_tv/raw_data.dart';
import 'package:flutter_tv/video_player_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FocusScopeNode _screenFocusNode;

  @override
  void initState() {
    _screenFocusNode = FocusScopeNode(debugLabel: "Screen_focus_node");
    super.initState();
  }

  @override
  void dispose() {
    _screenFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter TV'),
      ),
      body: SingleChildScrollView(
        child: FocusScope(
          autofocus: true,
          node: _screenFocusNode,
          child: sampleVideoGrid(),
        ),
      ),
    );
  }

  Widget sampleVideoGrid() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Movies"),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: images
                    .map(
                      (url) => VideoList(
                        url: url,
                        autoFocus: images.indexOf(url) == 0,
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("TV Series"),
            SizedBox(
              height: 16,
            ),
            // SizedBox(
            //   height: 100,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     children: images
            //         .map((url) => VideoList(
            //               url: url,
            //               autoFocus: images.indexOf(url) == 0,
            //             ))
            //         .toList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
