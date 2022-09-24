import 'package:abalit/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //forzamos portrait porque a nivel de ux que se use con 1 mano
    SystemChrome.setPreferredOrientations([       
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Abalit',
      initialRoute: 'sixteen',
      routes: {
        'first': (_) => FirstScreen(),
        'second': (_) => SecondScreen(),
        'third': (_) => ThirdScreen(),
        'four': (_) => FourScreen(),
        'five': (_) => FiveScreen(),
        'six': (_) => SixScreen(),
        'seven': (_) => SevenScreen(),
        'eight': (_) => EightScreen(),
        'nine': (_) => NineScreen(),
        'ten': (_) => TenScreen(),
        'eleven': (_) => ElevenScreen(),
        'twelve': (_) => TwelveScreen(),
        'thirteen': (_) => ThirteenScreen(),
        'fourteen': (_) => FourteenScreen(),
        'fiveteen': (_) => FiveteenScreen(),
        'sixteen': (_) => SixteenScreen(),
        'seventeen': (_) => SeventeenScreen(),
        'eighteen': (_) => EighteenScreen(),
        'nineteen': (_) => NineteenScreen(),
        'twenty': (_) => TwentyScreen(),









      },
      theme: ThemeData.light(),
    );
  }
}