import 'package:flutter/material.dart';


class DefaultTextFiled extends StatelessWidget {
  DefaultTextFiled({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.obsecure,
  }) : super(key: key);
  final String hintText;
  TextEditingController? controller;
  final bool obsecure ;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      controller: controller,
      validator: (String ? value){
        if(value!.isEmpty) {
          return 'please enter valid data' ;
        }else{
          return null ;
        }
      },
      decoration: InputDecoration(

        hintText: hintText,

        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(22),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(
            22,
          ),
        ),
      ),
    );
  }
}
