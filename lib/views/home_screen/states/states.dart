abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetDataLoadingState extends HomeStates {}
class GetDataSuccessState extends HomeStates {}
class GetStudentsDataLoadingState extends HomeStates {}
class GetStudentsDataSuccessState extends HomeStates {}
class GetDataErrorState extends HomeStates {
  final String error;

  GetDataErrorState(this.error);
}