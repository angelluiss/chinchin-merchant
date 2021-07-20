// import 'dart:async';

// import 'package:chinchin_merchant/login_registro/bloc/authentication_events.dart';
// import 'package:chinchin_merchant/login_registro/bloc/authentication_state.dart';
// import 'package:chinchin_merchant/login_registro/repository/api_provider.dart';
// import 'package:meta/meta.dart';
// import 'package:bloc/bloc.dart';

// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final UserRepository userRepository;

//   AuthenticationBloc({required this.userRepository}) : super(null);

//   @override
//   AuthenticationState get initialState => AuthenticationUninitialized();

//   @override
//   Stream<AuthenticationState> mapEventToState(
//     AuthenticationState currentState,
//     AuthenticationEvent event,
//   ) async* {
//     if (event is AppStarted) {
//       final bool hasToken = await userRepository.hasToken();

//       if (hasToken) {
//         yield AuthenticationAuthenticated();
//       } else {
//         yield AuthenticationUnauthenticated();
//       }
//     }

//     if (event is LoggedIn) {
//       yield AuthenticationLoading();
//       await userRepository.persistToken(event.token);
//       yield AuthenticationAuthenticated();
//     }

//     if (event is LoggedOut) {
//       yield AuthenticationLoading();
//       await userRepository.deleteToken();
//       yield AuthenticationUnauthenticated();
//     }
//   }
// }

// class AuthenticationState {}
