import 'package:app/domain/trends/trend.dart';

abstract class TrendsState {}

class TrendsStateNotInitializedState extends TrendsState {}

class FetchingTrendsState extends TrendsState{}

class FetchedTrendsSuccessState extends TrendsState {
  final List<Trend> trends;

  FetchedTrendsSuccessState(this.trends);
}

class FetchTrendsErrorState extends TrendsState {
  final String error;

  FetchTrendsErrorState(this.error);
}