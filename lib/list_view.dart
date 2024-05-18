import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tv/raw_data.dart';
import 'package:flutter_tv/video_player_screen.dart';

class VideoList extends StatefulWidget {
  final String url;
  final bool autoFocus;
  const VideoList({super.key, required this.url, required this.autoFocus});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  late FocusNode _focusNode;
  final GlobalKey _key = GlobalKey();

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 0.0,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        print("hello");
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => VideoPlayerScreen(
              url: links[images.indexOf(widget.url)],
            ),
          ),
        );
      },
      child: Focus(
        focusNode: _focusNode,
        autofocus: widget.autoFocus,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            key: _key,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: 100,
            width: _focusNode.hasFocus ? 200 : 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(
                    widget.url,
                  ),
                  fit: BoxFit.cover),
              border: _focusNode.hasFocus
                  ? Border.all(color: Colors.blue[900]!, width: 2)
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  void _onFocusChanged() => setState(() {});
}
