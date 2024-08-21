import 'package:flutter/material.dart';
import '../../widgets/Widget_store.dart';

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
          const Text('Catagory'),
          TextField(
            controller: _categoryController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          space(16),
          const Text('Price'),
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
          space(16),
       Center(
  child: SizedBox(
    width: double.infinity, // Makes the button take up the full width
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: const Color.fromARGB(255, 63, 81, 243),
      ),
      child: const Text(
        'Apply',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
)

        ],
      ),
    );
  }
}
