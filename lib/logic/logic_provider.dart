import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class OnboardingProvider with ChangeNotifier {
  bool isOnboarded = false;

  void setOnboarded() {
    isOnboarded = true;
    notifyListeners();
    saveStateToStorage();
  }

  Future<void> loadStateFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isOnboarded = prefs.getBool('isOnboarded')!;
    notifyListeners();
  }

  Future<void> saveStateToStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboarded', isOnboarded);
    notifyListeners();
  }
}

class SongProvider with ChangeNotifier {
  List songs = [];
  Future<void> loadAllSongs() async {
    final FlutterAudioQuery audioQuery = FlutterAudioQuery();
    List<SongInfo> songs = await audioQuery.getSongs();
    // notifyListeners();
    // print(songs);
  }
}
