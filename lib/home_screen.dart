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
  late FocusNode _focusNode;
  // final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    _focusNode = FocusNode(debugLabel: "Movie_list_focus_node");
    _focusNode.addListener(_onFocusChanged);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  int selectedIndex = -1;
  int selectedIndex2 = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter TV'),
      ),
      body: SingleChildScrollView(
        child: sampleVideoGrid(),
      ),
    );
  }

  Widget sampleVideoGrid() {
    return Padding(
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
            child: ListView.builder(
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Focus(
                  onFocusChange: (value) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: InkWell(
                    onFocusChange: (value) {
                      setState(() {
                        selectedIndex = value ? index : -1;
                      });
                    },
                    radius: 0.0,
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            url: links[index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        // key: _key,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        height: 100,
                        width: (index == selectedIndex) ? 200 : 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                images[index],
                              ),
                              fit: BoxFit.cover),
                          border: (index == selectedIndex)
                              ? Border.all(color: Colors.blue[900]!, width: 2)
                              : null,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("TV Series"),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onFocusChange: (value) {
                    setState(() {
                      selectedIndex2 = value ? index : -1;
                    });
                  },
                  radius: 0.0,
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => VideoPlayerScreen(
                          url: links[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      // key: _key,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      height: 100,
                      width: (index == selectedIndex2) ? 200 : 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                              images[index],
                            ),
                            fit: BoxFit.cover),
                        border: (index == selectedIndex2)
                            ? Border.all(color: Colors.blue[900]!, width: 2)
                            : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onFocusChanged() => setState(() {});
}
