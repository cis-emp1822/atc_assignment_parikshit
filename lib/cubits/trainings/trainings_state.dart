part of 'trainings_cubit.dart';

@immutable
abstract class TrainingsState {}

class TrainingsInitial extends TrainingsState {}

class TrainingsLoading extends TrainingsState {}

class TrainingsLoaded extends TrainingsState {
  final List<Trainings>? trainings;
  TrainingsLoaded({this.trainings});
}

class TrainingsError extends TrainingsState {
  final String? errorMessage;
  TrainingsError({this.errorMessage});
}
