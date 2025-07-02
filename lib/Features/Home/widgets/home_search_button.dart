
import 'package:flutter/material.dart';

class HomeSearchButton extends StatelessWidget {
  const HomeSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Icon(Icons.search, color: Colors.black54),
        SizedBox(
          width: 20,
        ),
        Text(
          'search . . .',
          style: TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
