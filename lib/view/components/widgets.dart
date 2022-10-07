import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  String txt;
  final onTap;
  AppButton({super.key, required this.txt, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: Theme.of(context).primaryColor,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Text(
        txt,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontFamily: GoogleFonts.poppins().fontFamily),
      ),
    );
  }
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}

TextFormField loginsignupfields(hinttxt, icon, fieldcontroller, fieldvalue) {
  return TextFormField(
    onChanged: (value) {
      fieldvalue = value;
    },
    controller: fieldcontroller,
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        hintText: hinttxt,
        hintStyle: const TextStyle(color: Colors.blueGrey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white54),
  );
}
