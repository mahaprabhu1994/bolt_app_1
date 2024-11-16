import 'package:avallis/pages/policy/PolicyDetailsScreen.dart';
import 'package:flutter/material.dart';

class PolicyListScreen extends StatelessWidget {
  final String clientName;

  const PolicyListScreen({
    Key? key,
    required this.clientName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Client Name',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              clientName,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '12 Plans for this client',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildPolicyCard(
                  companyLogo: 'assets/images/Singlife.png',
                  companyName: 'Care Supreme',
                  coverAmount: '₹5 Lakhs',
                  premium: '₹593/month',
                  onTap: () => _navigateToPolicyDetails(context, '83021035'),
                ),
                _buildPolicyCard(
                  companyLogo: 'assets/images/Singlife.png',
                  companyName: 'Max Super Saver',
                  coverAmount: '₹1 Crore',
                  premium: '₹890/month',
                  onTap: () => _navigateToPolicyDetails(context, '83021036'),
                ),
                _buildPolicyCard(
                  companyLogo: 'assets/images/Singlife.png',
                  companyName: 'Young Star Gold',
                  coverAmount: '₹4 Lakhs',
                  premium: '₹855/month',
                  onTap: () => _navigateToPolicyDetails(context, '83021037'),
                ),
                _buildPolicyCard(
                  companyLogo: 'assets/images/Singlife.png',
                  companyName: 'Active Fit Plus',
                  coverAmount: '₹1 Crore',
                  premium: '₹990/month',
                  onTap: () => _navigateToPolicyDetails(context, '83021038'),
                ),
                _buildPolicyCard(
                  companyLogo: 'assets/images/Singlife.png',
                  companyName: 'Active Fit Plus',
                  coverAmount: '₹1 Crore',
                  premium: '₹990/month',
                  onTap: () => _navigateToPolicyDetails(context, '83021038'),
                ),
                _buildPolicyCard(
                  companyLogo: 'assets/images/Singlife.png',
                  companyName: 'Active Fit Plus',
                  coverAmount: '₹1 Crore',
                  premium: '₹990/month',
                  onTap: () => _navigateToPolicyDetails(context, '83021038'),
                ),
                _buildPolicyCard(
                  companyLogo: 'assets/images/Singlife.png',
                  companyName: 'Active Fit Plus',
                  coverAmount: '₹1 Crore',
                  premium: '₹990/month',
                  onTap: () => _navigateToPolicyDetails(context, '83021038'),
                ),
                _buildPolicyCard(
                  companyLogo: 'assets/images/Singlife.png',
                  companyName: 'Active Fit Plus',
                  coverAmount: '₹1 Crore',
                  premium: '₹990/month',
                  onTap: () => _navigateToPolicyDetails(context, '83021038'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyCard({
    required String companyLogo,
    required String companyName,
    required String coverAmount,
    required String premium,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Logo
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      companyLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Policy Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          companyName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'Cover amount',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              coverAmount,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            premium,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Action Buttons
              Row(
                children: [
                  _buildActionButton(
                    'View 6 more plans',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  _buildActionButton(
                    'View Features',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, {required VoidCallback onPressed}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
        ),
      ),
    );
  }

  void _navigateToPolicyDetails(BuildContext context, String policyNumber) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PolicyDetailsScreen(
          policyNumber: policyNumber,
        ),
      ),
    );
  }
}

// You'll need to create a Policy model to handle the data
class Policy {
  final String id;
  final String companyName;
  final String companyLogo;
  final String coverAmount;
  final String premium;
  final int additionalPlans;

  Policy({
    required this.id,
    required this.companyName,
    required this.companyLogo,
    required this.coverAmount,
    required this.premium,
    required this.additionalPlans,
  });
}