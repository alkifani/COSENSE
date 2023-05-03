import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _controller = VideoPlayerController.network('');

  @override
  void initState() {
    super.initState();
    FirebaseStorage.instance.ref('videofile/20230504000359.mp4').getDownloadURL().then((url) {
      setState(() {
        _controller = VideoPlayerController.network(url);
        _controller.initialize().then((_) {
          setState(() {});
        });
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller?.value?.isInitialized ?? false
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(_controller?.value?.isPlaying ?? false ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
