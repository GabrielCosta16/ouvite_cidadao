import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';

import 'infra/theme.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(

  const MyApp(),
    );
  } catch (e) {
    Exception(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Rotas.pageLogin,
      getPages: Rotas.obterPages(),
    );
  }
}
