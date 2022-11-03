import 'package:flutter/material.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({Key? key , required this.img}) : super(key: key);
  final String img ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(img),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
          ),
        ],
      ),
    ) ;
  }
}
