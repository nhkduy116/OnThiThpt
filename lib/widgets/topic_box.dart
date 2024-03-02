// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:on_thi_thpt/constants/dimens.dart';
import 'package:on_thi_thpt/constants/strings.dart';

class TopicBox extends StatelessWidget {
  TopicBox(
      {super.key,
      required this.pathImage,
      required this.textTopic,
      required this.onTap});

  String pathImage;
  String textTopic;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w,
        height: 108,
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 25),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFFDFDFD),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF64CAF5)),
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 12.60,
              offset: Offset(6, 7),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(pathImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              textTopic,
              style: const TextStyle(
                color: Colors.black,
                fontSize: DimenApps.txtSizePrimary,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Strings.pathArrow),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
