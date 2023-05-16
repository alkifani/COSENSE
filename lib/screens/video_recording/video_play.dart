import 'package:chewie/chewie.dart';
import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

class VideoInfo {
  String url;
  DateTime date;

  VideoInfo({required this.url, required this.date});
}

class VideoPlayerWidget extends StatefulWidget {
  static String routeName = "/video_play";
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  List<VideoInfo> videoInfos = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Ambil semua video dari Firebase Storage dan simpan URL-nya ke dalam list videoInfos
    FirebaseStorage.instance.ref('videofile/').listAll().then((result) {
      for (var ref in result.items) {
        ref.getMetadata().then((metadata) {
          final date = metadata.updated ?? metadata.timeCreated!;
          ref.getDownloadURL().then((url) {
            setState(() {
              videoInfos.add(VideoInfo(url: url, date: date));
              videoInfos.sort((a, b) => b.date.compareTo(a.date));
            });
          }).catchError((error) {
            debugPrint(error.toString());
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
              'Full Video History Data',
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
        child: videoInfos.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
          itemCount: videoInfos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (_) {
                    return ChewieDialog(
                      videoUrl: videoInfos[index].url,
                    );
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
                        'Video ${index + 1} - ${videoInfos[index].date.toIso8601String()}',
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
      looping: true,
      aspectRatio: 16 / 9,
      allowFullScreen: true,
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
