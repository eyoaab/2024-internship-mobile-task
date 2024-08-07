import 'package:flutter/material.dart';

class Catagory extends StatefulWidget {
  @override
  _CatagoryState createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {
  final TextEditingController _categoryController = TextEditingController();
  double _minPrice = 0;
  double _maxPrice = 1000;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Catagory"),
          TextField(
            controller: _categoryController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          SizedBox(height: 16),
          Text("Price"),
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            min: 0,
            max: 2000,
            divisions: 20,
            labels: RangeLabels(
              '\$${_minPrice.toStringAsFixed(2)}',
              '\$${_maxPrice.toStringAsFixed(2)}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
              });
            },
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                final category = _categoryController.text;
                final minPrice = _minPrice;
                final maxPrice = _maxPrice;
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 3, 77, 138),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('APPLAY',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
