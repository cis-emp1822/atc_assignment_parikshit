import 'package:atc_assessment_test/cubits/trainings/trainings_cubit.dart';
import 'package:atc_assessment_test/cubits/trainings_banners/trainings_cubit.dart';
import 'package:atc_assessment_test/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainingsBannersCubit(),
      child: BlocProvider(
        create: (context) => TrainingsCubit(),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MainPage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
