// bloc/underwriting_state.dart
import 'package:avallis/modal/policy/underwriting/underwriting.dart';
import 'package:equatable/equatable.dart';

enum UnderwritingStatus { initial, loading, success, failure }

class UnderwritingState extends Equatable {
  final List<Underwriting> underwritings;
  final UnderwritingStatus status;
  final String? error;

  const UnderwritingState({
    this.underwritings = const [],
    this.status = UnderwritingStatus.initial,
    this.error,
  });

  UnderwritingState copyWith({
    List<Underwriting>? underwritings,
    UnderwritingStatus? status,
    String? error,
  }) {
    return UnderwritingState(
      underwritings: underwritings ?? this.underwritings,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [underwritings, status, error];
}