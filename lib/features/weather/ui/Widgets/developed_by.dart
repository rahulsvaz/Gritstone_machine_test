


import 'package:flutter/material.dart';

class DevelopedByText extends StatelessWidget {
  const DevelopedByText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         Center(
            child: Text(
              'Developed By',
              style: TextStyle(color: Colors.grey),
            ),
          ),
           SizedBox(
            height: 12,
          ),
           Center(
            child: Text(
              'R  A  H  U  L',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ),
      ],
    );
  }
}