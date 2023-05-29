import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';
import 'app/di.dart';
import 'app/functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String initialRoute = await getInitialRoute();

  Bloc.observer = MyBlocObserver();
  await initAppModule();
  runApp(DevicePreview(
    enabled: false,
    builder: (BuildContext context) {
      return MyApp(
        initialRoute: initialRoute,
      );
    },
  ));
}
