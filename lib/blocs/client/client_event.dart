import 'package:equatable/equatable.dart';

abstract class ClientEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchClients extends ClientEvent {
  final String adviserId;
  final int page;
  final Map<String, dynamic>? filters;
  final String? searchQuery;

  FetchClients({
    required this.adviserId,
    this.page = 0,
    this.filters,
    this.searchQuery,
  });

  @override
  List<Object> get props => [adviserId, page];
}