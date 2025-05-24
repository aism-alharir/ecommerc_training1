part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfileEvent extends ProfileEvent {
  final User user;

  const LoadProfileEvent(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateProfileEvent extends ProfileEvent {
  final User updatedUser;

  const UpdateProfileEvent(this.updatedUser);

  @override
  List<Object> get props => [updatedUser];
}