// lib/screens/underwriting_screen.dart
import 'package:avallis/widgets/policy/underwriting/underwriting_detail_dialog.dart';
import 'package:avallis/widgets/policy/underwriting/underwriting_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avallis/blocs/policy/underwriting_bloc.dart';
import 'package:avallis/events/underwriting_event.dart';
import 'package:avallis/modal/policy/underwriting/underwriting.dart';
import 'package:avallis/states/underwriting_details_state.dart';

class UnderwritingScreen extends StatelessWidget {
  const UnderwritingScreen({super.key});

  void _showUnderwritingDetail(BuildContext context, Underwriting underwriting) {
    showDialog(
      context: context,
      builder: (context) => UnderwritingDetailDialog(
        underwriting: underwriting,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UnderwritingBloc()..add(LoadUnderwritings()),
      child: Scaffold(

        body: BlocBuilder<UnderwritingBloc, UnderwritingState>(
          builder: (context, state) {
            if (state.status == UnderwritingStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == UnderwritingStatus.failure) {
              return Center(
                child: Text(
                  state.error ?? 'An error occurred',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return UnderwritingList(
              underwritings: state.underwritings,
              onUnderwritingTap: (underwriting) => _showUnderwritingDetail(
                context,
                underwriting,
              ),
            );
          },
        ),
      ),
    );
  }
}
