import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/i18n/strings.g.dart';
import 'package:movie_app/repositories/sizes/custom_padding.dart';
import 'package:ndialog/ndialog.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmController = TextEditingController();
    var fullNameController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(context.t.sign_up_page.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                hintText: context.t.sign_up_page.name,
              ),
            ),
            10.ph,
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: context.t.sign_up_page.email,
              ),
            ),
            10.ph,
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: context.t.sign_up_page.password,
              ),
            ),
            10.ph,
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: context.t.sign_up_page.confirm_pass,
              ),
            ),
            10.ph,
            ElevatedButton(
              onPressed: () async {
                var fullName = fullNameController.text.trim();
                var email = emailController.text.trim();
                var password = passwordController.text.trim();
                var confirmPass = confirmController.text.trim();

                if (fullName.isEmpty ||
                    email.isEmpty ||
                    password.isEmpty ||
                    confirmPass.isEmpty) {
                  Fluttertoast.showToast(msg: 'Пожалуйста, заполните все поля');
                  return;
                }

                if (password.length < 6) {
                  Fluttertoast.showToast(
                      msg: 'Слабый пароль. Нужно больше 6 символов');

                  return;
                }

                if (password != confirmPass) {
                  // show error toast
                  Fluttertoast.showToast(msg: 'Парои не совпадают');

                  return;
                }

                ProgressDialog progressDialog = ProgressDialog(
                  context,
                  title: const Text('Входим в аккаунт'),
                  message: const Text('Пожалуйста подождите'),
                );

                progressDialog.show();
                try {
                  FirebaseAuth auth = FirebaseAuth.instance;

                  UserCredential userCredential =
                      await auth.createUserWithEmailAndPassword(
                          email: email, password: password);

                  if (userCredential.user != null) {
                    DatabaseReference userRef =
                        FirebaseDatabase.instance.ref().child('users');

                    String uid = userCredential.user!.uid;
                    int dt = DateTime.now().millisecondsSinceEpoch;

                    await userRef.child(uid).set({
                      'fullName': fullName,
                      'email': email,
                      'uid': uid,
                      'dt': dt,
                      'profileImage': ''
                    });

                    Fluttertoast.showToast(msg: 'Успешно');

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  } else {
                    Fluttertoast.showToast(msg: 'Ошибка');
                  }

                  progressDialog.dismiss();
                } on FirebaseAuthException catch (e) {
                  progressDialog.dismiss();
                  if (e.code == 'auth/email-already-exists') {
                    Fluttertoast.showToast(msg: 'Почта уже используется');
                  } else if (e.code == 'weak-password') {
                    Fluttertoast.showToast(msg: 'Слабый пароль');
                  }
                } catch (e) {
                  progressDialog.dismiss();
                  Fluttertoast.showToast(msg: 'Что-то пошло не так');
                }
              },
              child: Text(context.t.sign_up_page.sign_in),
            ),
            100.ph,
          ],
        ),
      ),
    );
  }
}
