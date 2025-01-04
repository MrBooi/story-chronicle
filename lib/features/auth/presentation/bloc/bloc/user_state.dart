part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, error, logout }

class UserState extends Equatable {
  factory UserState.initial() => const UserState._(status: UserStatus.initial);

  const UserState._({required this.status, this.userModel, this.errorMessage});
  final UserStatus status;
  final String? errorMessage;

  final UserModel? userModel;

  UserState copyWith({
    UserStatus? status,
    UserModel? userModel,
    String? errorMessage,
  }) {
    return UserState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, userModel];
}
