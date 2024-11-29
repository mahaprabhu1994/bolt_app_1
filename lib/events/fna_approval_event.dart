abstract class FnaApprovalEvent {}

class LoadFnaApprovalsEvent extends FnaApprovalEvent {
  final String advisorId;
  LoadFnaApprovalsEvent(this.advisorId);
}

class ApproveFnaEvent extends FnaApprovalEvent {
  final String fnaId;
  ApproveFnaEvent(this.fnaId);
}

class RejectFnaEvent extends FnaApprovalEvent {
  final String fnaId;
  RejectFnaEvent(this.fnaId);
}