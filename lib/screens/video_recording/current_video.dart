import 'package:chewie/chewie.dart';
import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:co_sense/screens/video_recording/video_play.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CurrentVideoPlayer extends StatefulWidget {
  const CurrentVideoPlayer({Key? key}) : super(key: key);

  @override
  _CurrentVideoPlayerState createState() => _CurrentVideoPlayerState();
}

class _CurrentVideoPlayerState extends State<CurrentVideoPlayer> {
  String latestVideoUrl = '';

  @override
  void initState() {
    super.initState();
    // Ambil daftar video dari Firebase Storage
    FirebaseStorage.instance.ref('videofile/').listAll().then((result) async {
      // Ambil video terbaru
      final latestVideoRef = result.items.last;
      latestVideoUrl = await latestVideoRef.getDownloadURL();
      setState(() {});
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // const SizedBox(width: 8),
            const Text(
              'Video History Data',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 10),
            const Icon(MyFlutterApp.play_button, color: Colors.black),
          ],
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Center(
          child: latestVideoUrl.isEmpty
              ? const CircularProgressIndicator()
              : GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return ChewieDialog(videoUrl: latestVideoUrl);
                },
              );
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    MyFlutterApp.play_button,
                    color: Colors.black,
                    size: 50,
                  ),
                  Text(
                    'Latest Video',
                    style: const TextStyle(
                      color: Colors.black,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, VideoPlayerWidget.routeName);
                    },
                    child: const Text("Full Data Video History"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChewieDialog extends StatefulWidget {
  final String videoUrl;

  const ChewieDialog({required this.videoUrl});

  @override
  _ChewieDialogState createState() => _ChewieDialogState();
}

class _ChewieDialogState extends State<ChewieDialog> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),
      autoInitialize: true,
      aspectRatio: 16 / 9,
      allowedScreenSleep: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
