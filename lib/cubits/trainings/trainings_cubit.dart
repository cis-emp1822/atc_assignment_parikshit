import 'package:atc_assessment_test/models/trainings.dart';
import 'package:atc_assessment_test/repositories/apis_here.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
part 'trainings_state.dart';

class TrainingsCubit extends Cubit<TrainingsState> {
  TrainingsCubit() : super(TrainingsInitial());
  fetchTrainings(BuildContext context,
      {Map<String, List<String>>? filters}) async {
    emit(TrainingsLoading());
    Stream<List<Trainings>> traings =
        await ApisHere().getTrainings(context, filters: filters);
    traings.listen((event) {
      emit(TrainingsLoaded(trainings: event));
    }, onError: (error) {
      emit(TrainingsError(errorMessage: error.toString()));
    });
  }
}
