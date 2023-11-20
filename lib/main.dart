import 'package:elearning_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('am', 'ET')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: ELearning()
    ),
  );
}

class ELearning extends StatelessWidget {
  const ELearning({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'E-Learning app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 47, 206, 238)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
