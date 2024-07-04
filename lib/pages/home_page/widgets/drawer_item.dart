import 'package:flutter/material.dart';
import 'package:movie_app/theme/theme.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: lightTheme.textTheme.titleMedium,
      ),
      onTap: onTap,
    );
  }
}
