// bloc/underwriting_bloc.dart
import 'package:avallis/events/underwriting_event.dart';
import 'package:avallis/states/underwriting_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modal/policy/underwriting/underwriting.dart';

class UnderwritingBloc extends Bloc<UnderwritingEvent, UnderwritingState> {
  UnderwritingBloc() : super(const UnderwritingState()) {
    on<LoadUnderwritings>(_onLoadUnderwritings);
    on<UpdateUnderwriting>(_onUpdateUnderwriting);
  }

  Future<void> _onLoadUnderwritings(
      LoadUnderwritings event,
      Emitter<UnderwritingState> emit,
      ) async {
    emit(state.copyWith(status: UnderwritingStatus.loading));

    try {
      // Simulate API call with example data
      await Future.delayed(const Duration(seconds: 1));
      final underwritings = [
        const Underwriting(
          id: '1',
          requirement: 'Received Annual Statement of Account - Via Email.',
          underwriterName: 'Aini',
          dateReceived: null,
        ),
        const Underwriting(
          id: '2',
          requirement: 'Received Summary of Policy(ies) with Premium Due - Via Email.',
          underwriterName: 'John',
          dateReceived: null,
        ),
      ];

      emit(state.copyWith(
        status: UnderwritingStatus.success,
        underwritings: underwritings,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: UnderwritingStatus.failure,
        error: error.toString(),
      ));
    }
  }

  Future<void> _onUpdateUnderwriting(
      UpdateUnderwriting event,
      Emitter<UnderwritingState> emit,
      ) async {
    final updatedUnderwritings = state.underwritings.map((underwriting) {
      return underwriting.id == event.underwriting.id
          ? event.underwriting
          : underwriting;
    }).toList();

    emit(state.copyWith(underwritings: updatedUnderwritings));
  }
}
