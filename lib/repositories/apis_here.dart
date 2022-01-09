import 'dart:convert';

import 'package:atc_assessment_test/models/trainings.dart';
import 'package:flutter/material.dart';

class ApisHere {
  Future<Stream<List<Trainings>>> getTrainings(BuildContext context,
      {Map<String, List<String>>? filters}) async {
    try {
      String data = await DefaultAssetBundle.of(context)
          .loadString("lib/jsons/trainings.json");
      final jsonResult = jsonDecode(data); //l
      if (jsonResult['status']) {
        List<dynamic> gets = jsonResult['data'] as List<dynamic>;
        List<Trainings> trainings =
            gets.map<Trainings>((e) => Trainings.fromJson(e)).toList();
        trainings = trainings.where((element) {
          if (filters == null) {
            return true;
          } else {
            if (filters['training_location'] != null) {
              if (filters['training_location']!
                  .contains(element.trainingLocation!)) {
                return true;
              } else {
                return false;
              }
            }
            if (filters['training_title'] != null) {
              if (filters['training_title']!.contains(element.trainingTitle!)) {
                return true;
              } else {
                return false;
              }
            }
            if (filters['trainer_name'] != null) {
              if (filters['trainer_name']!.contains(element.trainerName!)) {
                return true;
              } else {
                return false;
              }
            }
            if (filters['training_tag'] != null) {
              if (filters['training_tag']!.contains(element.tag!)) {
                return true;
              } else {
                return false;
              }
            }
            return false;
          }
        }).toList();
        return Stream.value(trainings);
      } else {
        return Stream.error("error Occurred Fetching Photos");
      }
    } catch (e) {
      return Stream.error(e.toString());
    }
  }
}
