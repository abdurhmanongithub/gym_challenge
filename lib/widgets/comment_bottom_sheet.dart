import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentBottomSheet extends StatefulWidget {
  @override
  _CommentBottomSheetState createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  TextEditingController _commentController = TextEditingController();
  getCommentSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  child: CircleAvatar(
                    child: Image.asset(
                        'assets/images/avator_1.png'), // Replace with avatar image
                  ),
                ),
                const SizedBox(width: 8.0),
                RichText(
                  text: TextSpan(
                      text: 'Kerry Johns ',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: '@Kerry',
                          style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(92, 141, 255, 1),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            Text(
              "2 hours ago",
              style: GoogleFonts.roboto(
                color: const Color.fromRGBO(196, 196, 196, 1),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          "Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: const Color.fromRGBO(118, 118, 118, 1)),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/comment_icon.svg'),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 13,
                    ),
                    child: Text(
                      '15',
                      style: GoogleFonts.roboto(
                        // height: 2,
                        fontSize: 13,
                        color: const Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 69,
            ),
            GestureDetector(
                child: Row(
              children: [
                SvgPicture.asset('assets/icons/heart.svg'),
                Container(
                  margin: const EdgeInsets.only(
                    left: 13,
                  ),
                  child: Text(
                    '15K',
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      color: const Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                )
              ],
            )),
            const SizedBox(
              width: 69,
            ),
            GestureDetector(
              child: SvgPicture.asset('assets/icons/flag.svg'),
            )
          ],
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: const Color.fromRGBO(254, 241, 241, 1),
              ),
              borderRadius: BorderRadius.circular(3),
              color: const Color.fromRGBO(
                250,
                250,
                250,
                1,
              ),
            ),
            child: Row(
              children: [
                Text(
                  "View 15 Replies",
                  style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(149, 149, 149, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  // style: TextStyle(
                  //   color: Colors.blue,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  'assets/icons/right_arrow.svg',
                  width: 4,
                  height: 8,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  getCommentInbox() {
    return Container(
      color: Colors.white,
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("C"), // Replace with current user's avatar
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: "Add a comment...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.emoji_emotions),
                  onPressed: () {
                    showEmojiPicker(context);
                  },
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Handle send action
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(100),
        ),
        border: Border.all(width: 0.5, color: Colors.white),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => getCommentSection(),
              itemCount: 4,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            // bottom: 0,
            child: Container(child: getCommentInbox()),
          ),
        ],
      ),
    );
  }

  void showEmojiPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EmojiPicker(onEmojiSelected: (emoji, category) {
          final currentText = _commentController.text;
          final selection = _commentController.selection;
          final newText = currentText.replaceRange(
              selection.start, selection.end, category.emoji);
          _commentController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(
                offset: selection.start + category.emoji.length),
          );
          // _commentController.text = _commentController.text + category.emoji;
        });
      },
    );
  }
}
