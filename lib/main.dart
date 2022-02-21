import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:newsapi/newsbloc/news_states.dart';
import 'package:newsapi/repositories/news_repository.dart';
import 'package:newsapi/views/splash_screen.dart';

import 'newsbloc/news_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(
              initialState: NewsInitState(), newsRepositoty: NewsRepository()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //     scaffoldBackgroundColor: Colors.white,
        //     textTheme: GoogleFonts.poppinsTextTheme(
        //       Theme.of(context).textTheme,
        //     )
        // ),
        home: SplashScreen(),
      ),
    );
  }
}

