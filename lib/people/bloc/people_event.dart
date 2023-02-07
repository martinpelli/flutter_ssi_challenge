part of 'people_bloc.dart';

@immutable
abstract class PeopleEvent {}

class GetPeopleEvent extends PeopleEvent {
  final String? nextOrPreviousPeopleUrl;

  GetPeopleEvent({this.nextOrPreviousPeopleUrl});
}
