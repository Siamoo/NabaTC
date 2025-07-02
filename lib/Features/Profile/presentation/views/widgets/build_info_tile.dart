
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';

class BuildInfoTile extends StatelessWidget {
  const BuildInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Icon(icon, color: kHomeIconsBakColor),
      title: Text(title),
      subtitle: Text(value),
      // trailing: const Icon(Icons.edit, size: 16),
    );
  }
}
