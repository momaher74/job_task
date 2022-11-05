import 'package:flutter/material.dart';
import 'package:job_task/component/shared_component/constant.dart';

class GalleryBackGround extends StatelessWidget {
  GalleryBackGround({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Image(
          image: const AssetImage('assets/images/gallerybg.png'),
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
        Container(
          width: 60,
          height: 80,
          margin: const EdgeInsets.only(right: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
