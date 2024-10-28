// client_detail_screen.dart
import 'package:bold1/blocs/client/client_modal.dart';
import 'package:bold1/blocs/theme_bloc.dart';
import 'package:bold1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientDetailScreen extends StatelessWidget {
  final Client client;

  const ClientDetailScreen({
    super.key,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    final isDarkMode = themeBloc.state.themeData.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Client Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Client Profile Header
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/client_3.jpeg'),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      client.custName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Client Information Cards
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Basic Information',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      if(client.custInitials !=null)
                        _buildInfoRow('Initial', client.custInitials!),
                      _buildInfoRow('Email', client.emailId),
                      _buildInfoRow('Category', client.custCateg),
                      _buildInfoRow('Status', client.custStatus),
                      // if (client.emailId != null)
                      //   _buildInfoRow('Mobile', client.emailId!),
                      // if (client.custCateg != null)
                      //   _buildInfoRow('Address', client.custCateg!),
                      if (client.dob != null)
                        _buildInfoRow('DOB', client.dob!),
                      if (client.sex != null)
                        _buildInfoRow('Gender', client.sex!),
                      // _buildInfoRow('DOB',client.dob),
                      // _buildInfoRow('Gender',client.sex),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Additional Details Card
              if (client.custStatus != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Additional Information',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        Text(client.custStatus!),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
