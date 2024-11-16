import 'package:avallis/blocs/client/client_event.dart';
import 'package:avallis/blocs/client/client_modal.dart';
import 'package:avallis/blocs/client/client_repository.dart';
import 'package:avallis/blocs/client/client_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientRepository repository;

  ClientBloc({required this.repository}) : super(ClientInitial()) {
    on<FetchClients>(_onFetchClients);
  }

  Future<void> _onFetchClients(
      FetchClients event,
      Emitter<ClientState> emit,
      ) async {
    try {
      if (state is ClientInitial) {
        emit(ClientLoading());
      }

      final result = await repository.fetchClients(
        adviserId: event.adviserId,
        page: event.page,
        filters: event.filters,
        globalSearch: event.searchQuery,
      );

      final List<Client> clients = (result['content'] as List)
          .map((item) => Client.fromJson(item))
          .toList();

      final bool isLastPage = result['last'] as bool;
      final int totalPages = result['totalPages'] as int;
      final int currentPage = result['number'] as int;

      if (state is ClientLoaded) {
        final currentState = state as ClientLoaded;
        if (event.page == 0) {
          emit(ClientLoaded(
            clients: clients,
            hasReachedMax: isLastPage,
            currentPage: currentPage,
            totalPages: totalPages,
          ));
        } else {
          emit(ClientLoaded(
            clients: currentState.clients + clients,
            hasReachedMax: isLastPage,
            currentPage: currentPage,
            totalPages: totalPages,
          ));
        }
      } else {
        emit(ClientLoaded(
          clients: clients,
          hasReachedMax: isLastPage,
          currentPage: currentPage,
          totalPages: totalPages,
        ));
      }
    } catch (e) {
      emit(ClientError(e.toString()));
    }
  }
}
