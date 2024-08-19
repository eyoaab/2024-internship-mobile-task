import 'package:flutter/material.dart';


Text CommonText(String text, FontWeight wight, double size){
  return Text(
    text,
    overflow: TextOverflow.clip,
    style: TextStyle(fontWeight: wight, fontSize: size),
  );
}

SizedBox space(double size) {
  return  SizedBox(height: size);
}             

InputDecoration decorateInput = InputDecoration(filled: true,fillColor: Colors.grey[200],border: const OutlineInputBorder(),);

const styleText =  TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

const red =  Colors.red;
      RoundedRectangleBorder circular = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12));

const commonStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
const  eadge = EdgeInsets.all(16.0);

  void showMessage(BuildContext context, Icon title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: title,
          content: Text(message,style: const TextStyle(fontSize: 20),),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
