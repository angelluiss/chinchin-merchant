import 'package:chinchin_merchant/common/authentication/models/user_model.dart';
import 'package:chinchin_merchant/common/repository/auth_repository.dart';

import 'package:equatable/equatable.dart';

class AuthenticationStates extends Equatable {
  const AuthenticationStates._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  const AuthenticationStates.unknown() : this._();

  const AuthenticationStates.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationStates.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
