import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/home/domain/usecases/update_last_active_usecase.dart';
import 'shift_event.dart';
import 'shift_state.dart';

class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final UpdateLastActiveUseCase updateLastActiveUseCase;

  ShiftBloc({required this.updateLastActiveUseCase}) : super(ShiftInitial()) {
    on<StartShiftEvent>(
      (event, emit) => _handleShiftUpdate(event.uid, true, emit),
    );
    on<EndShiftEvent>(
      (event, emit) => _handleShiftUpdate(event.uid, false, emit),
    );
  }

  Future<void> _handleShiftUpdate(
    String uid,
    bool isStarting,
    Emitter<ShiftState> emit,
  ) async {
    emit(ShiftLoading());
    try {
      final now = DateTime.now();
      await updateLastActiveUseCase(uid, now);
      if (isStarting) {
        emit(ShiftActive(now));
      } else {
        emit(ShiftEnded(now));
      }
    } catch (e) {
      emit(ShiftError(e.toString()));
    }
  }
}
