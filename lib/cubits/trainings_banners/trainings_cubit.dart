import 'package:atc_assessment_test/models/trainings.dart';
import 'package:atc_assessment_test/repositories/apis_here.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
part 'trainings_state.dart';

class TrainingsBannersCubit extends Cubit<TrainingsBannersState> {
  TrainingsBannersCubit() : super(TrainingsBannersInitial());
  fetchTrainings(BuildContext context,
      {Map<String, List<String>>? filters}) async {
    emit(TrainingsBannersLoading());
    Stream<List<Trainings>> traings =
        await ApisHere().getTrainings(context, filters: filters);
    traings.listen((event) {
      emit(TrainingsBannersLoaded(trainings: event));
    }, onError: (error) {
      emit(TrainingsBannersError(errorMessage: error.toString()));
    });
  }
}
