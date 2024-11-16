// bloc/underwriting_event.dart
import 'package:avallis/modal/policy/underwriting/underwriting.dart';
import 'package:equatable/equatable.dart';

abstract class UnderwritingEvent extends Equatable {
  const UnderwritingEvent();

  @override
  List<Object?> get props => [];
}

class LoadUnderwritings extends UnderwritingEvent {}

class UpdateUnderwriting extends UnderwritingEvent {
  final Underwriting underwriting;

  const UpdateUnderwriting(this.underwriting);

  @override
  List<Object?> get props => [underwriting];
}