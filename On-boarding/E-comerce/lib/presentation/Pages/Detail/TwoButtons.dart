import 'package:flutter/material.dart';
import '../../widgets/Widget_store.dart';

class Twobuttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(),
              child: const Text('DELETE'),
            ),
            space(16),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');

              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'UPDATE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
