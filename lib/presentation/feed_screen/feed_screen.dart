// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        allowImplicitScrolling: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/bg.jpg'), // Replace with your image path
                fit: BoxFit
                    .cover, // Adjust the fit as needed (cover, contain, etc.)
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints.expand(width: 50, height: 270),
                      child: Column(
                        children: <Widget>[
                          LikeButton(
                            animationDuration: const Duration(seconds: 0),
                            likeCountAnimationType: LikeCountAnimationType.none,
                            countPostion: CountPostion.bottom,
                            likeBuilder: (isLiked) {
                              return SvgPicture.asset(
                                'assets/icons/book.svg',
                                height: 40,
                              );
                            },
                            likeCount: Random().nextInt(100) + 5023,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LikeButton(
                            animationDuration: const Duration(seconds: 0),
                            likeCountAnimationType: LikeCountAnimationType.none,
                            countPostion: CountPostion.bottom,
                            likeBuilder: (isLiked) {
                              return SvgPicture.asset(
                                'assets/icons/comment.svg',
                                height: 40,
                              );
                            },
                            likeCount: Random().nextInt(100) + 5023,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LikeButton(
                            countPostion: CountPostion.bottom,
                            size: 40,
                            isLiked: Random().nextInt(100) > 50 ? true : false,
                            likeCount: Random().nextInt(100) + 50,
                            onTap: (state) async {
                              return !state;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SvgPicture.asset('assets/icons/share.svg'),
                          const SizedBox(
                            height: 10,
                          ),
                          SvgPicture.asset('assets/icons/more_right.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
