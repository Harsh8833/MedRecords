import 'package:flutter/material.dart';

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 14),
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

TextFormField inputFeild(
    {hinttxt,
    icon,
    onChanged,
    fieldcontroller,
    obscuretext = false,
    color = Colors.white}) {
  return TextFormField(
    style: TextStyle(color: color),
    obscureText: obscuretext,
    onChanged: onChanged,
    controller: fieldcontroller,
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.blueGrey,
        ),
        hintText: hinttxt,
        hintStyle: const TextStyle(color: Colors.blueGrey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none),
        filled: false,
        fillColor: Colors.white54),
  );
}
