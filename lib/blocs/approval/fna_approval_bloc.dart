import 'package:avallis/events/fna_approval_event.dart';
import 'package:avallis/service/approval_service.dart';
import 'package:avallis/states/fna_approval_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FnaApprovalBloc extends Bloc<FnaApprovalEvent, FnaApprovalState> {
  final ApiService apiService;

  FnaApprovalBloc({required this.apiService}) : super(FnaApprovalInitial()) {
    on<LoadFnaApprovalsEvent>(_onLoadApprovals);
    on<ApproveFnaEvent>(_onApproveFna);
    on<RejectFnaEvent>(_onRejectFna);
  }

  Future<void> _onLoadApprovals(
      LoadFnaApprovalsEvent event,
      Emitter<FnaApprovalState> emit,
      ) async {
    emit(FnaApprovalLoading());
    try {
      final approvals = await apiService.getFnaApprovalList(event.advisorId);
      emit(FnaApprovalLoaded(approvals));
    } catch (e) {
      emit(FnaApprovalError(e.toString()));
    }
  }

  Future<void> _onApproveFna(
      ApproveFnaEvent event,
      Emitter<FnaApprovalState> emit,
      ) async {
    try {
      // TODO: Implement approve API call
      // Refresh the list after approval
      if (state is FnaApprovalLoaded) {
        final currentState = state as FnaApprovalLoaded;
        final updatedApprovals = currentState.approvals
            .where((approval) => approval.fnaId != event.fnaId)
            .toList();
        emit(FnaApprovalLoaded(updatedApprovals));
      }
    } catch (e) {
      emit(FnaApprovalError('Failed to approve FNA'));
    }
  }

  Future<void> _onRejectFna(
      RejectFnaEvent event,
      Emitter<FnaApprovalState> emit,
      ) async {
    try {
      // TODO: Implement reject API call
      // Refresh the list after rejection
      if (state is FnaApprovalLoaded) {
        final currentState = state as FnaApprovalLoaded;
        final updatedApprovals = currentState.approvals
            .where((approval) => approval.fnaId != event.fnaId)
            .toList();
        emit(FnaApprovalLoaded(updatedApprovals));
      }
    } catch (e) {
      emit(FnaApprovalError('Failed to reject FNA'));
    }
  }
}