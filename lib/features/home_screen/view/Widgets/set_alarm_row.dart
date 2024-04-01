import 'package:flutter/material.dart';

class SetAlarmSection extends StatelessWidget {
  final VoidCallback callback;
  const SetAlarmSection({
    super.key,
    required this.width, required this.callback,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Center(
          child: Text(
            'Alarms',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          width: width * 0.5,
        ),
        IconButton(
          onPressed: callback,
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
