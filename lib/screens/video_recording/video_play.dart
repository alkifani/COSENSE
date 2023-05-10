import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  List<String> videoUrls = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Ambil semua video dari Firebase Storage dan simpan URL-nya ke dalam list videoUrls
    FirebaseStorage.instance.ref('videofile/').listAll().then((result) {
      for (var ref in result.items) {
        ref.getDownloadURL().then((url) {
          setState(() {
            videoUrls.add(url);
          });
        }).catchError((error) {
          debugPrint(error.toString());
        });
      }
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
            const Icon(Icons.history, color: Colors.black),
          ],
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: videoUrls.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
          itemCount: videoUrls.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (_) {
                    return VideoDialog(videoUrl: videoUrls[index]);
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                color: currentIndex == index
                    ? Colors.grey.withOpacity(0.5)
                    : null,
                child: Row(
                  children: [
                    const Icon(MyFlutterApp.play_button,
                        color: Colors.black),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Video ${index + 1}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class VideoDialog extends StatefulWidget {
  final String videoUrl;

  const VideoDialog({required this.videoUrl});

  @override
  _VideoDialogState createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            VideoPlayer(_controller),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                child: Icon(
                  _controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
