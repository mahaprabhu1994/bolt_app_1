

import 'package:bold1/blocs/client/client_bloc.dart';
import 'package:bold1/blocs/client/client_event.dart';
import 'package:bold1/blocs/client/client_state.dart';
import 'package:bold1/main.dart';
import 'package:bold1/widgets/client_page/client_list_widget.dart';
import 'package:bold1/widgets/client_page/client_search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatefulWidget {

  final String adviserId;

  const SearchWidget
      ( {required this.adviserId,
        super.key });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ClientBloc>().add(FetchClients(adviserId: widget.adviserId));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      final state = context.read<ClientBloc>().state;
      if (state is ClientLoaded && !state.hasReachedMax) {
        context.read<ClientBloc>().add(
          FetchClients(
            adviserId: widget.adviserId,
            page: state.currentPage + 1,
          ),
        );
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ClientSearchSection(),
        Expanded(
          child: BlocBuilder<ClientBloc, ClientState>(
            builder: (context, state) {
              if (state is ClientInitial || state is ClientLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ClientError) {
                return Center(child: Text(state.message));
              }

              if (state is ClientLoaded) {
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: state.hasReachedMax
                      ? state.clients.length
                      : state.clients.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= state.clients.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final client = state.clients[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ClientListWidget(client: client),
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}