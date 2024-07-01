import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/i18n/strings.g.dart';
import 'package:movie_app/repositories/di/di_container.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  runZonedGuarded(
    () async {
      setup();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      LocaleSettings.useDeviceLocale();
      FlutterError.onError = (details) =>
          GetIt.I<Talker>().handle(details.exception, details.stack);
      runApp(TranslationProvider(child: const MovieApp()));
    },
    (error, stack) {
      GetIt.I<Talker>().handle(error, stack);
    },
  );
}
