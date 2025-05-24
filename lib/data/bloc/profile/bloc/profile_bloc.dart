import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../features/profile/domain/entities/user.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        // In a real app, this would come from a repository
        await Future.delayed(const Duration(milliseconds: 500));
        emit(ProfileLoaded(user: event.user));
      } catch (e) {
        emit(ProfileError(message: e.toString()));
      }
    });

    on<UpdateProfileEvent>((event, emit) async {
      if (state is ProfileLoaded) {
        emit(ProfileLoading());
        try {
          // In a real app, this would update the user in the repository
          await Future.delayed(const Duration(milliseconds: 500));
          emit(ProfileLoaded(user: event.updatedUser));
        } catch (e) {
          emit(ProfileError(message: e.toString()));
        }
      }
    });
  }
}