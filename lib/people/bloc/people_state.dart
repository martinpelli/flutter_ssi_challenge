part of 'people_bloc.dart';

@immutable
abstract class PeopleState {
  final bool isLoading;
  final PeopleResponse? people;

  const PeopleState({this.isLoading = false, this.people});
}

class LoadingState extends PeopleState {
  const LoadingState() : super(isLoading: true);
}

class PeopleFetchedState extends PeopleState {
  final PeopleResponse peopleResponse;
  const PeopleFetchedState(this.peopleResponse) : super(isLoading: false, people: peopleResponse);
}
