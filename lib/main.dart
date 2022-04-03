import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pineaple_pos_client/pineaple_exporter.dart';

void main() {
  runApp(
    SplashScreen(),
  );
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const MyApp();
        }
      },
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    await PineapleUIModule.init();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pineaple Áreas',
      theme: _buildTheme(),
      initialRoute: PineapleAreaScreen.ROUTE_NAME,
      getPages: [
        GetPage(
          name: PineapleAreaScreen.ROUTE_NAME,
          page: () => const PineapleAreaScreen(),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }

  ThemeData _buildTheme() {
    const String FONT_FAMILY_LOBSTER = "Lobster";
    const String FONT_FAMILY_AKAYA = "AkayaTelivigala";
    const String FONT_FAMILY_SLAB = "RobotoSlab";

    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Define the default brightness and colors.
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: Color(0xff63ced4),
        secondary: Color.fromARGB(255, 81, 172, 177),
        background: Color(0xffafefef),
      ),

      // Define the default font family.
      fontFamily: FONT_FAMILY_SLAB,

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: const TextTheme(
        //utilizado para el texto principal del juego
        headline1: TextStyle(
          fontFamily: FONT_FAMILY_LOBSTER,
          fontSize: 90,
          color: Color(0xff2a3762),
          shadows: [
            Shadow(
              color: Colors.blue,
              blurRadius: 10.0,
              offset: Offset(3.0, 3.0),
            ),
            Shadow(
              color: Colors.red,
              blurRadius: 10.0,
              offset: Offset(-3.0, 3.0),
            ),
          ],
        ),
        //utilizado para:
        // - el cargando
        // - los carteles de win/loose
        headline4: TextStyle(
          fontFamily: FONT_FAMILY_AKAYA,
          fontWeight: FontWeight.bold,
          fontSize: 70,
        ),
        //utilizado para:
        // - el nombre de los modulos
        headline5: TextStyle(
          fontFamily: FONT_FAMILY_AKAYA,
          fontWeight: FontWeight.bold,
          fontSize: 33,
        ),
        //utilizado para :
        // - el tile de la seleccion
        headline6: TextStyle(
          fontFamily: FONT_FAMILY_AKAYA,
          fontWeight: FontWeight.normal,
          fontSize: 30,
        ),
        //utilizado para:
        // - el header del tutorial
        // - la letra inicial en el trivia
        subtitle1: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
        //utilizado para:
        // - los header de los subniveles
        // - Los badges de los modulos en los botones iniciales
        // - los card con las letras en el ahorcado
        // - La pregunta en el trivia
        // - las respuestas en el trivia
        // - el texto en el appbar de cada modulo(sale todo por tools)
        // - el contador de estrellas de cada nivel(5 / 10 *)
        subtitle2: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        //utilizado para:
        // - el texto del tutorial
        // - los segundos restantes en el contador de trivia
        bodyText1: TextStyle(
          fontSize: 20.0,
        ),
        //utilizado para:
        // - el texto de los subniveles
        bodyText2: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
