import 'package:country_app/core/constants.dart';
import 'package:country_app/core/locator.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_bloc.dart';
import 'package:country_app/presentation/bloc/country_bloc/country_event.dart';
import 'package:country_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountryBloc()..add(AddCountryEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Countries App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: kWhiteColor,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
