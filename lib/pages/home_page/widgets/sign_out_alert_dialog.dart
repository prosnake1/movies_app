import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignOutAlertDialog extends StatelessWidget {
  const SignOutAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Вы точно хотите выйти из аккаунта?'),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Нет')),
        TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            context.go('/login');
          },
          child: const Text('Да'),
        )
      ],
    );
  }
}
