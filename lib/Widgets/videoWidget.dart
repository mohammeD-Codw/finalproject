// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:final_project/Models/lessonModel.dart';
import 'package:final_project/Providers/MainProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoWidget extends StatefulWidget {
String videoUrl;
VideoWidget(this.videoUrl);
  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();

}

class _YoutubeAppDemoState extends State<VideoWidget> {
  YoutubePlayerController _controller;
void runYoutubePlayer(){
  _controller = YoutubePlayerController(
    initialVideoId:widget.videoUrl,
    params: const YoutubePlayerParams(
      //   playlist: [
      //     'nPt8bK2gbaU',
      //     'K18cpp_-gP8',
      //     'iLnmTe5Q2Qw',
      //     '_WoCV4c6XOE',
      //     'KmzdUe0RSJo',
      //     '6jZDSSZZxjQ',
      //     'p2lYr3vM_1w',
      //     '7QUtEmBT_-w',
      //     '34_PXCzGw1M',
      //   ],
      startAt:  Duration.zero,
      showControls: true,
      showFullscreenButton: true,
      desktopMode: false,
      privacyEnhanced: true,
      useHybridComposition: true,

    ),

  );

  _controller.onEnterFullscreen = () {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    log('Entered Fullscreen');
  };
  _controller.onExitFullscreen = () {
    log('Exited Fullscreen');
  };

}
  @override
  void initState() {
    super.initState();
   runYoutubePlayer();

  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();

    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (kIsWeb && constraints.maxWidth > 800) {
              return const Expanded(child: player);
            }
            return ListView(
              children: [
                Stack(
                  children: [
                    player,
                    Positioned.fill(
                      child: YoutubeValueBuilder(
                        controller: _controller,
                        builder: (context, value) {
                          return AnimatedCrossFade(
                            firstChild: const SizedBox.shrink(),
                            secondChild: Material(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      YoutubePlayerController.getThumbnail(

                                        videoId:  widget.videoUrl,
                                        quality: ThumbnailQuality.medium,
                                      ),
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            crossFadeState: value.isReady
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
