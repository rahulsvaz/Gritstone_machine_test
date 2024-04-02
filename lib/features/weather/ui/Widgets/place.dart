import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  final VoidCallback callback;
  final String place;
  const Place({
    super.key,
    required this.place, required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '📍 $place',
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          IconButton(
            onPressed: callback
              
            ,
            icon: const Icon(
              Icons.refresh,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

//'30°C'