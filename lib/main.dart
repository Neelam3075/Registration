import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/registration/cubit/registration_cubit.dart';
import 'package:untitled5/registration/view/registration_screen.dart';
import 'package:untitled5/routes/custom_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return RegistrationCubit(RegistrationState()) ;

      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: CustomRoute.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RegistrationPage(),
      ),
    );
  }
}







