import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () => Navigator.of(context).pop(),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Ops!"),
    content: Text("Infelizmente essa funcionalidade ainda não foi desenvolvida. Por favor, volte mais tarde!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}