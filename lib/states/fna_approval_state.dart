import 'package:avallis/modal/fna_approval.dart';

abstract class FnaApprovalState {}

class FnaApprovalInitial extends FnaApprovalState {}

class FnaApprovalLoading extends FnaApprovalState {}

class FnaApprovalLoaded extends FnaApprovalState {
  final List<FnaApproval> approvals;
  FnaApprovalLoaded(this.approvals);
}

class FnaApprovalError extends FnaApprovalState {
  final String message;
  FnaApprovalError(this.message);
}