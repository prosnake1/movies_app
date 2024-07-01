import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/i18n/strings.g.dart';
import 'package:movie_app/repositories/sizes/custom_padding.dart';
import 'package:ndialog/ndialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: const Text('Русский 🇷🇺'),
              onTap: () => LocaleSettings.setLocale(AppLocale.ru),
            ),
            PopupMenuItem(
              child: const Text('English 🇺🇸'),
              onTap: () => LocaleSettings.setLocale(AppLocale.en),
            )
          ],
        ),
        title: Text(
          context.t.login_page.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: TextField(
                controller: emailController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: context.t.login_page.email,
                ),
              ),
            ),
            SizedBox(
              height: 20.ph.height,
            ),
            SizedBox(
              child: TextField(
                controller: passwordController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: context.t.login_page.password,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                var email = emailController.text.trim();
                var password = passwordController.text.trim();
                if (email.isEmpty || password.isEmpty) {
                  Fluttertoast.showToast(msg: 'Пожалуйста, заполните все поля');
                  return;
                }
                ProgressDialog progressDialog = ProgressDialog(context,
                    title: const Text('Входим'),
                    message: const Text('Пожалуйста подождите'),
                    blur: 80);
                progressDialog.show();
                try {
                  FirebaseAuth auth = FirebaseAuth.instance;

                  UserCredential userCredential =
                      await auth.signInWithEmailAndPassword(
                          email: email, password: password);
                  if (userCredential.user != null) {
                    progressDialog.dismiss();

                    context.go('/');
                  }
                } on FirebaseAuthException catch (e) {
                  progressDialog.dismiss();
                  if (e.code == 'user-not-found') {
                    Fluttertoast.showToast(msg: 'пользователь не найден');
                  } else if (e.code == 'wrong-password') {
                    Fluttertoast.showToast(msg: 'неверный пароль');
                  } else {
                    Fluttertoast.showToast(msg: 'что-то пошло не так');
                  }
                } catch (e) {
                  Fluttertoast.showToast(msg: 'что-то пошло не так');
                  progressDialog.dismiss();
                }
              },
              child: Text(context.t.login_page.title),
            ),
            TextButton(
              onPressed: () {
                context.push('/sign-up');
              },
              child: Text(context.t.login_page.no_account_sign),
            ),
          ],
        ),
      ),
    );
  }
}
