// ignore_for_file: prefer_const_constructors, unused_import

import 'package:cosmofly/logic/logic_provider.dart';
import 'package:cosmofly/logic/song_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';
import '/route.dart' as route;
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final songProvider =
        Provider.of<SongProvider>(context, listen: false).loadAllSongs();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 8, 23, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(child: Image.asset('assets/Cosmofly.png')),
                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: const DecorationImage(
                          image: AssetImage('assets/banner_image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Songs',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  //!   ===================================
                  Consumer<SongList>(
                    builder: (context, songList, child) {
                      print(songList.songs);
                      if (songList.songs.isEmpty) {
                        return Center(
                          child: Text(
                            "No songs found.",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: songList.songs.length,
                          itemBuilder: (context, index) {
                            final song = songList.songs[index];
                            return ListTile(
                              title: Text(song.title),
                              subtitle: Text(song.artist),
                              trailing: Text(song.album),
                            );
                          },
                        );
                      }
                    },
                  ),

                  // const SongItem(),
                ],
              ),
            ),
            const CurrentSongPlayingBottomBar(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.house,
                color: Colors.white,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.microphone,
                color: Colors.white,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.playstation,
                color: Colors.white,
              ),
            ),
            IconButton(
              enableFeedback: false,
              splashRadius: 25,
              splashColor: const Color.fromARGB(0, 159, 159, 159),
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentSongPlayingBottomBar extends StatelessWidget {
  const CurrentSongPlayingBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  route.musicScreen,
                );
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(100, 47, 19, 112),
                        image: const DecorationImage(
                          image: AssetImage('assets/onboard_bg.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Manavalan Thug',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'khalid Rahman, Ashiq Usman',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(right: 10),
                      enableFeedback: false,
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.play,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SongItem extends StatelessWidget {
  const SongItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(100, 47, 19, 112),
              image: const DecorationImage(
                image: AssetImage('assets/banner_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Manavalan Thug',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text(
                'khalid Rahman, Ashiq Usman',
                style: TextStyle(
                    color: Color.fromARGB(183, 255, 255, 255), fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            '30:00',
            style: TextStyle(
                color: Color.fromRGBO(117, 106, 142, 1), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
