part of 'trainings_cubit.dart';

@immutable
abstract class TrainingsBannersState {}

class TrainingsBannersInitial extends TrainingsBannersState {}

class TrainingsBannersLoading extends TrainingsBannersState {}

class TrainingsBannersLoaded extends TrainingsBannersState {
  final List<Trainings>? trainings;
  TrainingsBannersLoaded({this.trainings});
}

class TrainingsBannersError extends TrainingsBannersState {
  final String? errorMessage;
  TrainingsBannersError({this.errorMessage});
}
