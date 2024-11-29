class FnaApproval {
  final String fnaId;
  final String custId;
  final String custName;
  final String advStfName;

  FnaApproval({
    required this.fnaId,
    required this.custId,
    required this.custName,
    required this.advStfName,
  });

  factory FnaApproval.fromJson(Map<String, dynamic> json) {
    return FnaApproval(
      fnaId: json['fnaId'] ?? '',
      custId: json['custId'] ?? '',
      custName: json['custName'] ?? '',
      advStfName: json['advStfName'] ?? '',
    );
  }
}