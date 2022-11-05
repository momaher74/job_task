import 'package:flutter/material.dart';
import 'package:job_task/component/widgets/gallery_widgets/shared_text.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    Key? key,
    required this.color,
    required this.img,
    required this.txt,
    required this.function,
  }) : super(key: key);
  final String img;
  final String txt;
  final Function function;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        function() ;
      },
      child: Container(
        width: 185,
        height: 65,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Image(
              image: AssetImage(
                img,
              ),
              fit: BoxFit.cover,
            ),
            SharedText(
              txt: txt,
              color: Colors.black,
              txtSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
