import 'package:avallis/blocs/client/client_modal.dart';
import 'package:equatable/equatable.dart';

abstract class ClientState extends Equatable {
  @override
  List<Object> get props => [];
}

class ClientInitial extends ClientState {}

class ClientLoading extends ClientState {}

class ClientLoaded extends ClientState {
  final List<Client> clients;
  final bool hasReachedMax;
  final int currentPage;
  final int totalPages;

  ClientLoaded({
    required this.clients,
    required this.hasReachedMax,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  List<Object> get props => [clients, hasReachedMax, currentPage, totalPages];

  ClientLoaded copyWith({
    List<Client>? clients,
    bool? hasReachedMax,
    int? currentPage,
    int? totalPages,
  }) {
    return ClientLoaded(
      clients: clients ?? this.clients,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}

class ClientError extends ClientState {
  final String message;

  ClientError(this.message);

  @override
  List<Object> get props => [message];
}