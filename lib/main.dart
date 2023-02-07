import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ssi_challenge/people/bloc/people_bloc.dart';
import 'package:flutter_ssi_challenge/people/layouts/home_layouts.dart';
import 'package:flutter_ssi_challenge/router/router.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const SSIChallenge());
}

class SSIChallenge extends StatelessWidget {
  const SSIChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PeopleBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SSI Challenge',
        initialRoute: Flurorouter.rootRoute,
        onGenerateRoute: Flurorouter.router.generator,
        builder: (_, child) => HomeLayout(child: child!),
      ),
    );
  }
}
