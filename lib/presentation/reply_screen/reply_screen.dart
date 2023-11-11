import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/presentation/home_screen/controller/home_controller.dart';
import 'package:gym/routes/app.dart';

// ignore: must_be_immutable
class ReplyScreen extends GetWidget<HomeController> {
  ReplyScreen({super.key});
  TextEditingController _commentController = TextEditingController();

  getReplySection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
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
        Row(
          children: [
            CustomPaint(
              size: const Size(30, 100), // Adjust line length as needed
              painter: LinePainter(),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: Get.size.width * 0.8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper amet justo quisque ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: const Color.fromRGBO(118, 118, 118, 1)),
                  ),
                  const SizedBox(height: 16.0),
                  const SizedBox(
                    width: double.infinity,
                    child: Text.rich(
                      textAlign: TextAlign.left,
                      TextSpan(
                        text: 'Replying to ',
                        children: [
                          TextSpan(text: 'John Doe @JhontheD'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  getCommentInbox(context) {
    return Container(
      color: Colors.white,
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/commentor.png'),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(
                        196,
                        196,
                        196,
                        1,
                      ),
                    ),
                  ),
                  hintText: "Add  comment",
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 35,
                    // maxWidth: 30,
                  ),
                  prefixIcon: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/emoji.svg',
                      ),
                    ),
                    onTap: () {
                      showEmojiPicker(context);
                    },
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: 24,
                  ),
                  suffixIcon: GestureDetector(
                    child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: SvgPicture.asset('assets/icons/send_icon.svg')),
                  ),
                ),
              ),
            ),
          ),
          // IconButton(
          //   icon: const Icon(Icons.send),
          //   onPressed: () {
          //     // Handle send action
          //   },
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/back_arrow.svg'),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Reply",
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(75, 75, 75, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: getReplySection(),
                ),
                getCommentInbox(context),
              ],
            ),
          ),
        ),
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

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
