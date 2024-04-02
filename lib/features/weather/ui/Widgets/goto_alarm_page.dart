import 'package:flutter/material.dart';

class GotoAlarmPage extends StatelessWidget {
  final VoidCallback callback;
  const GotoAlarmPage({
    super.key,
    required this.callback,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: const Text(
        'G O T O   A L A R M   P A G E',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }
}
