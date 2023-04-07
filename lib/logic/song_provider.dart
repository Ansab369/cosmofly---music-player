import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';
// import 'package:on_audio_query/on_audio_query.dart';

class SongList with ChangeNotifier {
  final List _songs = [];

  SongList() {
    _loadSongs();
  }

  List get songs => _songs;

  Future<void> _loadSongs() async {
    try {
      final FlutterAudioQuery audioQuery = FlutterAudioQuery();
      List<SongInfo> _songs = await audioQuery.getSongs();
      notifyListeners();
      print(_songs[1]);
    } catch (e) {
      print('Error loading songs: $e');
    }
  }
}

// !


// class GetAllSongController {
//   static AudioPlayer audioPlayer = AudioPlayer();
//   static List<SongModel> songscopy = [];
//   static List<SongModel> playingSong = [];
//   static int currentIndexes = -1;
//   static ConcatenatingAudioSource createSongList(List<SongModel> elements) {
//     List<AudioSource> songList = [];
//     playingSong = elements;
//     for (var element in elements) {
//       songList.add(
//         AudioSource.uri(
//           Uri.parse(element.uri!),
//           tag: MediaItem(
//             id: element.id.toString(),
//             album: element.album ?? "No Album",
//             title: element.title,
//             artist: element.artist,
//             artUri: Uri.parse(element.id.toString()),
//           ),
//         ),
//       );
//     }
//     return ConcatenatingAudioSource(children: songList);
//   }
// }
