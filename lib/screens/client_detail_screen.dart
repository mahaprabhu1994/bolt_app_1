import 'package:flutter/material.dart';

class ClientDetailScreen extends StatelessWidget {
  final Client client; // Your client model

  const ClientDetailScreen({
    super.key,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Client Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Profile Image
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(client.imageUrl),
                      // Fallback if image fails to load
                      onBackgroundImageError: (_, __) {},
                      child: client.imageUrl.isEmpty
                          ? Icon(
                        Icons.person,
                        size: 50,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name
                  Text(
                    client.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Email
                  Text(
                    client.email,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),

            // Expandable Sections
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildExpandableSection(
                    title: 'Personal Details',
                    icon: Icons.person_outline,
                    children: [
                      _buildDetailRow('Full Name', client.name),
                      _buildDetailRow('NRIC', client.nric),
                      _buildDetailRow('Gender', client.gender),
                      _buildDetailRow('Date of Birth', client.dateOfBirth),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildExpandableSection(
                    title: 'Contact Details',
                    icon: Icons.contact_phone_outlined,
                    children: [
                      _buildDetailRow('Phone', client.phone),
                      _buildDetailRow('Email', client.email),
                      _buildDetailRow('Alternative Contact', client.altContact),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildExpandableSection(
                    title: 'Address Details',
                    icon: Icons.home_outlined,
                    children: [
                      _buildDetailRow('Street', client.street),
                      _buildDetailRow('City', client.city),
                      _buildDetailRow('State', client.state),
                      _buildDetailRow('Postal Code', client.postalCode),
                      _buildDetailRow('Country', client.country),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      title: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// You'll need a Client model like this:
class Client {
  final String imageUrl;
  final String name;
  final String email;
  final String nric;
  final String gender;
  final String dateOfBirth;
  final String phone;
  final String altContact;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  Client({
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.nric,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
    required this.altContact,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });
}