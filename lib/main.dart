import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/reservation/reservation_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_bloc.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
import 'package:reservation_system/routes/route_named.dart';
import 'package:reservation_system/todo_project/bloc/restaurant_bloc.dart';
import 'package:reservation_system/todo_project/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.init();
  runApp(Reservation());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantBloc(),
      child: MaterialApp(home: TodoScreen(), debugShowCheckedModeBanner: false),
    );
  }
}

class Reservation extends StatelessWidget {
  const Reservation({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => RestaurantListBloc()),
        BlocProvider(create: (context) => ReservationBloc()),
      ],
      child: MaterialApp(
        initialRoute: Routenamed.splash,
        onGenerateRoute: Routenamed.generateRouted,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
