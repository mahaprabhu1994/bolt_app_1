// screens/fna_approval_screen.dart
import 'package:avallis/blocs/approval/fna_approval_bloc.dart';
import 'package:avallis/events/fna_approval_event.dart';
import 'package:avallis/service/approval_service.dart';
import 'package:avallis/states/fna_approval_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FnaApprovalScreen extends StatelessWidget {
  final String advisorId;

  const FnaApprovalScreen({
    Key? key,
    required this.advisorId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FnaApprovalBloc(
        apiService: ApiService(),
      )..add(LoadFnaApprovalsEvent(advisorId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FNA Approvals'),
        ),
        body: const FnaApprovalList(),
      ),
    );
  }
}

class FnaApprovalList extends StatelessWidget {
  const FnaApprovalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FnaApprovalBloc, FnaApprovalState>(
      builder: (context, state) {
        if (state is FnaApprovalLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FnaApprovalLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.approvals.length,
            itemBuilder: (context, index) {
              final approval = state.approvals[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FNA ID: ${approval.fnaId}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Customer ID: ${approval.custId}'),
                      const SizedBox(height: 4),
                      Text(
                        'Customer Name: ${approval.custName}',
                        style: const TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(height: 4),
                      Text('Advisor: ${approval.advStfName}'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<FnaApprovalBloc>().add(
                                  ApproveFnaEvent(approval.fnaId),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              child: const Text('Approve',style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<FnaApprovalBloc>().add(
                                  RejectFnaEvent(approval.fnaId),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                              ),
                              child: const Text('Reject', style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is FnaApprovalError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}