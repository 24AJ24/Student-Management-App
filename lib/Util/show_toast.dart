import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,

    timeInSecForIosWeb: 10,
    backgroundColor: Colors.grey[600],
    textColor: Colors.white,
    fontSize: 20/*16.0*/,

  );
}