import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as developer;

import 'package:tuple/tuple.dart';

class BottomNavigationItem extends StatefulWidget {
  static const ROUTE_NAME = 'BottomNavigationItem';

  final Widget icon;
  final VoidCallback? onPress;
  final bool isSelected;
  final String text;
  BottomNavigationItem(this.icon, this.isSelected, this.text, {this.onPress});

  @override
  _BottomNavigationItemState createState() => _BottomNavigationItemState();
}

class _BottomNavigationItemState extends State<BottomNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: widget.onPress,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(
              height: 28,
              child: widget.icon,
            ),
            const Spacer(),
            Text(
              widget.text,
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1,
                color: widget.isSelected
                    ? const Color.fromRGBO(202, 177, 82, 1)
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
