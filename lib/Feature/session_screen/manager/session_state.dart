sealed class SessionState{

}
class StartSessionLoadingState extends SessionState{}
class StartSessionErrorState extends SessionState{
  final String errorMessage;
  StartSessionErrorState(this.errorMessage);
}
class StartSessionSuccessState extends SessionState{}