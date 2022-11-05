import 'package:flutter/material.dart';


class DefulatBotton extends StatelessWidget {
  const DefulatBotton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        function() ;
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        height: 46,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff7BB3FF),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: InkWell(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
