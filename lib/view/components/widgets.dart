import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

MaterialButton loginsignupButtons(context, txt, route, color) {
  return MaterialButton(
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    color: color,
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


TextFormField loginsignupfields(hinttxt, icon) {
  return TextFormField(
    decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white,),
        hintText: hinttxt,
        hintStyle: const TextStyle(color: Colors.blueGrey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white54),
  );
}
