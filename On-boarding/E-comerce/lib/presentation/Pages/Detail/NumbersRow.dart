import 'package:flutter/material.dart';

class NumbersRow extends StatefulWidget {
  @override
  _NumbersRowState createState() => _NumbersRowState();
}

class _NumbersRowState extends State<NumbersRow> {
  final List<int> numbers = List.generate(11, (index) => 37 + index);
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: 60,
              decoration: BoxDecoration(
                color: selected == index ? const Color(0xff3F51F3) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: selected == index ? Colors.transparent : Colors.grey),
              ),
              child: Center(
                child: Text(
                  numbers[index].toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: selected == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
