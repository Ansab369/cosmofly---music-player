import 'dart:ui';
import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 8, 23, 1),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              image: const DecorationImage(
                image: AssetImage(
                  "assets/demo_song_profile.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(6.123234262925839e-17, 1),
                    end: Alignment(-1, 6.123234262925839e-17),
                    colors: [
                      Color.fromRGBO(15, 8, 23, 1),
                      Color.fromRGBO(15, 8, 23, 1),
                      Color.fromRGBO(15, 8, 23, 0.7599999904632568),
                    ]),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 22, right: 22),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Now Playing",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          //! MORE OPTIONS
                        },
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15.0),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/demo_song_profile.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Thallumala",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "khalid Rahman, Ashiq Usman",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4.0,
                      trackShape: CustomTrackShape(),
                    ),
                    child: Slider(
                      onChanged: (double value) {},
                      value: 50,
                      min: 0.0,
                      max: 100.0,
                      activeColor: const Color.fromRGBO(122, 79, 225, 1),
                      inactiveColor: const Color.fromRGBO(117, 106, 142, 1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "10:00",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "17:00",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.shuffle_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      const Icon(
                        Icons.skip_previous_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(122, 79, 225, 1)
                                  .withOpacity(0.6),
                              blurRadius: 30.0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          // Icons.play_circle_filled_rounded,
                          Icons.pause_circle_filled_rounded,
                          color: Color.fromRGBO(122, 79, 225, 1),
                          size: 60,
                        ),
                      ),
                      const Icon(
                        Icons.skip_next_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      const Icon(
                        Icons.repeat_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
