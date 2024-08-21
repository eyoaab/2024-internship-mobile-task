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

InputDecoration decorateInput = const InputDecoration(filled: true,
      fillColor: Color.fromRGBO(245, 243, 243, 1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none,));

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Center(child: title),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );
    },
  );
}

