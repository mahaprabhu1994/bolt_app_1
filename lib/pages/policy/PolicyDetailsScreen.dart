import 'package:avallis/modal/policy/underwriting/underwriting.dart';
import 'package:avallis/pages/policy/policy_attachment_screen.dart';
import 'package:avallis/widgets/policy/address_contect_widget.dart';
import 'package:avallis/widgets/policy/inforce_gst_widget.dart';
import 'package:avallis/widgets/policy/plan_status_widget.dart';
import 'package:avallis/widgets/policy/policy_plans_widget.dart';
import 'package:avallis/widgets/policy/terms_&_conditions_card.dart';
import 'package:avallis/widgets/policy/underwriting_details.dart';
import 'package:flutter/material.dart';
// Enum to track selected tab
enum PolicyTab {
  details,
  products,
  underwriting,
  attachments,
}
class PolicyDetailsScreen extends StatefulWidget {
  final String policyNumber;

  const PolicyDetailsScreen({
    Key? key,
    required this.policyNumber,
  }) : super(key: key);

  @override
  State<PolicyDetailsScreen> createState() => _PolicyDetailsScreenState();
}

class _PolicyDetailsScreenState extends State<PolicyDetailsScreen> {

  PolicyTab _selectedTab = PolicyTab.details;

  final termsController = TextEditingController();
  final remarksController = TextEditingController();
  // Example data - replace with your actual data source
  final underwritings = [
    const Underwriting(
      id: '1',
      requirement: 'Received Annual Statement of Account - Via Email.',
      underwriterName: 'Aini',
      dateReceived: null,
    ),
    const Underwriting(
      id: '2',
      requirement: 'Received Summary of Policy(ies) with Premium Due - Via Email.',
      underwriterName: 'John',
      dateReceived: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Policy #${widget.policyNumber}'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: Colors.grey[100],
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTabItem(
                    icon: Icons.description,
                    label: 'DETAILS',
                    isSelected: _selectedTab == PolicyTab.details,
                    onTap: () => _onTabSelected(PolicyTab.details),
                  ),
                  _buildTabItem(
                      icon: Icons.shopping_bag,
                      label: 'PRODUCTS',
                    isSelected: _selectedTab == PolicyTab.products,
                    onTap: () => _onTabSelected(PolicyTab.products),
                  ),
                 _buildTabItem(
                     icon: Icons.edit_document,
                     label: 'UNDERWRITING',
                   isSelected: _selectedTab == PolicyTab.underwriting,
                   onTap: () => _onTabSelected(PolicyTab.underwriting),
                 ),
                  _buildTabItem(
                      icon: Icons.attach_file,
                      label: 'ATTACHMENTS',
                    isSelected: _selectedTab == PolicyTab.attachments,
                    onTap: () => _onTabSelected(PolicyTab.attachments),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _buildSelectedTabContent(),
    );
  }

  void _onTabSelected(PolicyTab tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

  Widget _buildSelectedTabContent() {
    switch (_selectedTab) {
      case PolicyTab.details:
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCompanyDetailsCard(),
                const SizedBox(height: 16),
                TermsAndConditionsCard(
                  termsController: termsController,
                  remarksController: remarksController,
                ),
                const SizedBox(height: 16),
                _buildPremiumDetailsCard(),
                const SizedBox(height: 16),
                _buildAdviserDetailsCard(),
                const SizedBox(height: 16),
                AddressContactWidget(),
                const SizedBox(height: 16),
                const PlanStatusWidget(),
                const SizedBox(height: 16),
                _buildDatesCard(),
                const SizedBox(height: 16),
                _buildPaymentDetailsCard(),
                const SizedBox(height: 16,),
                InforceGSTWidget()
              ],
            ),
          ),
        );

      case PolicyTab.products:
        return const PolicyPlansWidget();

      case PolicyTab.underwriting:
        return  UnderwritingScreen();

      case PolicyTab.attachments:
        return  PolicyAttachmentsScreen();
    }
  }

// Your existing card building methods remain the same...
}

Widget _buildTabItem({
  required IconData icon,
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildCompanyDetailsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Singlife.png',
                  height: 40,
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aviva Ltd',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Life Insurance / Traditional'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'FIRST PARTY',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildPremiumDetailsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPremiumRow(
              'Basic Premium (A)',
              '\$30,000.00',
            ),
            _buildPremiumRow(
              'Rider Premium (B)',
              '\$0',
              showDivider: true,
            ),
            _buildPremiumRow(
              'Total Premium (A + B)',
              '\$30,000.00',
              isBold: true,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text('→ Detailed View'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdviserDetailsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                _buildAdviserRow(
                  Icons.person,
                  'Initial Adviser',
                  'Salim M Amin',
                ),
                const SizedBox(height: 16),
                _buildAdviserRow(
                  Icons.sports_soccer,
                  'Servicing Adviser',
                  'Salim M Amin',
                ),
                const SizedBox(height: 16),
                _buildAdviserRow(
                  Icons.attach_money,
                  'Commission Adviser',
                  'Salim M Amin',
                ),
              ],
            ),
            Column(
              children: [
                _buildAdviserRow(
                  Icons.person,
                  'Proposer',
                  'Kong Chee Kwan',
                ),
                const SizedBox(height: 16),
                _buildAdviserRow(
                  Icons.person,
                  'Assured',
                  'Kong Chee Kwan',
                ),
                const SizedBox(height: 48),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatesCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDateRow('Effective Date', '01/01/1999', 'Issue Date', 'Select date'),
            _buildDateRow('Renewal Date', 'Select date', 'Ren. Reminder Date', 'Select date'),
            _buildDateRow('Submission Date', 'Select date', 'Termination Date', 'Select date'),
            _buildDateRow('Maturity Date', 'Select date', 'New Biz Dispatch Date', '16/03/2024'),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetailsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDropdownRow('Payment Mode', 'SINGLE', 'Currency Type', 'SGD'),
            const SizedBox(height: 16),
            _buildDropdownRow('Payment Method', 'CASH/CHQ', 'CPF A/C No.', ''),
            const SizedBox(height: 16),
            _buildDateRow(
              'GIRO Deduction Date 1',
              'Select date',
              'GIRO Deduction Date 2',
              'Select date',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumRow(String label, String amount, {bool showDivider = false, bool isBold = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        if (showDivider) const Divider(),
      ],
    );
  }



  Widget _buildAdviserRow(IconData icon, String role, String name) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              role,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateRow(String label1, String date1, String label2, String date2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label1,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(date1),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label2,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(date2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownRow(String label1, String value1, String label2, String value2) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label1,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value1),
                    const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label2,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value2),
                    const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }




// New widget for Products tab
class ProductsTabContent extends StatelessWidget {
  const ProductsTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // Add your products content here
        ],
      ),
    );
  }
}

// New widget for Underwriting tab
class UnderwritingTabContent extends StatelessWidget {
  const UnderwritingTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Underwriting',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // Add your underwriting content here
        ],
      ),
    );
  }
}

// New widget for Attachments tab
class AttachmentsTabContent extends StatelessWidget {
  const AttachmentsTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Attachments',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // Add your attachments content here
        ],
      ),
    );
  }
}