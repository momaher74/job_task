import 'package:flutter/material.dart';
import 'package:job_task/component/widgets/gallery_widgets/shared_text.dart';

class GalleryButton extends StatelessWidget {
  GalleryButton({
    Key? key,
    required this.txt,
    required this.width,
    required this.function,
    required this.color,
    required this.icon,
  }) : super(key: key);
  final String txt;
  final double width;
  final Color color;
  Function function;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: width,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            SharedText(
              txt: txt,
              color: Colors.black,
              txtSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
