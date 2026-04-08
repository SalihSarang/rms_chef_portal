import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/profile/domain/usecases/update_last_active_usecase.dart';
import 'shift_event.dart';
import 'shift_state.dart';

class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final UpdateLastActiveUseCase updateLastActiveUseCase;

  ShiftBloc({required this.updateLastActiveUseCase}) : super(ShiftInitial()) {
    on<StartShiftEvent>((event, emit) async {
      emit(ShiftLoading());
      try {
        await updateLastActiveUseCase(uid: event.uid, time: DateTime.now());
        emit(ShiftActive(DateTime.now()));
      } catch (e) {
        emit(ShiftError(e.toString()));
      }
    });

    on<EndShiftEvent>((event, emit) async {
      emit(ShiftLoading());
      try {
        await updateLastActiveUseCase(uid: event.uid, time: DateTime.now());
        emit(ShiftEnded(DateTime.now()));
      } catch (e) {
        emit(ShiftError(e.toString()));
      }
    });
  }
}
