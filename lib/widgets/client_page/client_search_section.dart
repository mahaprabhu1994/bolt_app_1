// Main widget with search field
import 'package:avallis/constants.dart';
import 'package:flutter/material.dart';

class ClientSearchSection extends StatelessWidget {
  const ClientSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Search Field with Filter Button
          GestureDetector(
            onTap: () => _showSearchFilterModal(context),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search clients...',
                        prefixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.5),
                        ),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.tune),
                      onPressed: () => _showSearchFilterModal(context),
                      tooltip: 'Filter',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes the modal larger
      backgroundColor: Colors.transparent,
      builder: (context) => const ClientFilterModal(),
    );
  }
}

// Filter Modal
class ClientFilterModal extends StatefulWidget {
  const ClientFilterModal({super.key});

  @override
  State<ClientFilterModal> createState() => _ClientFilterModalState();
}

class _ClientFilterModalState extends State<ClientFilterModal> {
  final _nameController = TextEditingController();
  final _nricController = TextEditingController();
  final _emailController = TextEditingController();
  String? _selectedGender;
  String? _selectedCategory;
  String? _selectedStatus;

  @override
  void dispose() {
    _nameController.dispose();
    _nricController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the keyboard height to adjust modal height
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 40 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Enhanced Handle Bar
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 48,
            height: 5,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),

          // Enhanced Title Section
          Container(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Clients',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ],
            ),
          ),

          // Filter Fields Section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Title
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Search Criteria',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Enhanced TextFields and Dropdowns
                  _buildTextField(
                    controller: _nameController,
                    label: 'Client Name',
                    icon: Icons.person_outline,
                    context: context,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _nricController,
                    label: 'NRIC',
                    icon: Icons.badge_outlined,
                    context: context,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    icon: Icons.email_outlined,
                    context: context,
                  ),
                  const SizedBox(height: 24),

                  // Dropdowns Section Title
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Additional Filters',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  _buildDropdown(
                    value: _selectedGender,
                    label: 'Gender',
                    icon: Icons.people_outline,
                    // items: ['Male', 'Female', 'Other'],
                    items:client_gender,
                    onChanged: (value) => setState(() => _selectedGender = value),
                    context: context,
                  ),
                  const SizedBox(height: 16),
                  _buildDropdown(
                    value: _selectedCategory,
                    label: 'Category',
                    icon: Icons.category_outlined,
                    // items: ['Person', 'Company',],
                    items:client_category,
                    onChanged: (value) => setState(() => _selectedCategory = value),
                    context: context,
                  ),
                  const SizedBox(height: 16),
                  _buildDropdown(
                    value: _selectedStatus,
                    label: 'Status',
                    icon: Icons.info_outline,
                    // items: ['A-Applicant', 'S-Suspect', 'P-Prospect','CP-Client Re-Prospect','SA-Client Re-Applicant'],
                    items:client_status,
                    onChanged: (value) => setState(() => _selectedStatus = value),
                    context: context,
                  ),
                ],
              ),
            ),
          ),

          // Enhanced Action Buttons
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _nameController.clear();
                        _nricController.clear();
                        _emailController.clear();
                        _selectedGender = null;
                        _selectedCategory = null;
                        _selectedStatus = null;
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),

                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      final filters = {
                        'name': _nameController.text,
                        'nric': _nricController.text,
                        'email': _emailController.text,
                        'gender': _selectedGender,
                        'category': _selectedCategory,
                        'status': _selectedStatus,
                      };
                      print(filters);
                      Navigator.pop(context, filters);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Apply'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}


// Helper method for consistent TextField styling
Widget _buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
      ),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        // Remove floatingLabelBehavior since we're using hintText
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // Optional: Customize hint style
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
          fontSize: 16,
        ),
      ),
    ),
  );
}

// Helper method for consistent Dropdown styling
Widget _buildDropdown({
  required String? value,
  required String label,
  required IconData icon,
  required List<String> items,
  required Function(String?) onChanged,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
      ),
    ),
    child: DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        // Remove floatingLabelBehavior since we're using hintText
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // Optional: Customize hint style
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
          fontSize: 16,
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: onChanged,
      dropdownColor: Theme.of(context).colorScheme.surface,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
  );
}