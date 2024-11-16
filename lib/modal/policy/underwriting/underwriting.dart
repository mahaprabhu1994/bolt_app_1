import 'package:equatable/equatable.dart';

class Underwriting extends Equatable {
  final String id;
  final String requirement;
  final String adviserResponse;
  final String underwriterName;
  final DateTime? dateReceived;
  final String adviserResponseUpdatedBy;
  final DateTime? responseDate;
  final List<UnderwritingAttachment> attachments;

  const Underwriting({
    required this.id,
    required this.requirement,
    this.adviserResponse = '',
    this.underwriterName = '',
    this.dateReceived,
    this.adviserResponseUpdatedBy = '--NIL--',
    this.responseDate,
    this.attachments = const [],
  });

  @override
  List<Object?> get props => [
    id,
    requirement,
    adviserResponse,
    underwriterName,
    dateReceived,
    adviserResponseUpdatedBy,
    responseDate,
    attachments,
  ];
}

class UnderwritingAttachment {
  final String name;
  final String size;

  const UnderwritingAttachment({
    required this.name,
    required this.size,
  });
}