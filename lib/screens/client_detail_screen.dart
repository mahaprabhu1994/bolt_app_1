// client_detail_screen.dart
import 'package:avallis/blocs/client/client_modal.dart';
import 'package:avallis/blocs/theme_bloc.dart';
import 'package:avallis/main.dart';
import 'package:avallis/pages/policy/policy_list_screen.dart';
import 'package:avallis/widgets/expandable_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientDetailScreen extends StatefulWidget {
  final Client client;

  const ClientDetailScreen({
    super.key,
    required this.client,
  });

  @override
  State<ClientDetailScreen> createState() => _ClientDetailScreenState();
}

class _ClientDetailScreenState extends State<ClientDetailScreen> {
  final _cardController = ExpandableCardController();
  final _subCardController = SubExpandableCardController();

  @override
  void dispose() {
    _cardController.dispose();
    _subCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    final isDarkMode = themeBloc.state.themeData.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            widget.client.custName.length > 20
                                ? '${widget.client.custName.substring(0, 20)}...'
                                : widget.client.custName,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PolicyListScreen(clientName: widget.client.custName),
                                ),
                              );
                            },
                            child:Text('Policy',
                                style:Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context).primaryColor
                                ),

                            ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Column(
                children: [
                  // Personal Details Card
                  ExpandableInfoCard(
                    title: 'Personal Details',
                    controller: _cardController,
                    expandedHeight: 340,
                    initiallyExpanded: true, // Optional: starts expanded
                    children: [
                      if (widget.client.custInitials != null)
                        buildInfoRow('Initial', widget.client.custInitials!),
                      buildInfoRow('Email', widget.client.emailId),
                      buildInfoRow('Category', widget.client.custCateg),
                      buildInfoRow('Status', widget.client.custStatus),
                      if (widget.client.dob != null)
                        buildInfoRow('DOB', widget.client.dob!),
                      if (widget.client.sex != null)
                        buildInfoRow('Gender', widget.client.sex!),
                      if (widget.client.nric != null)
                        buildInfoRow('NRIC', widget.client.nric!),
                      if (widget.client.nationality != null)
                        buildInfoRow('Nationality', widget.client.nationality!),
                      if (widget.client.maritalStatus != null)
                        buildInfoRow(
                            'MaritalStatus', widget.client.maritalStatus!),
                    ],
                  ),

                  const SizedBox(height: 16),



                  ExpandableInfoCard(
                    title: 'Address Details',
                    controller: _cardController,
                    expandedHeight:
                        340, // Increased to accommodate all sub-cards
                    children: [
                      SubExpandableInfoCard(
                        title: 'Residence Address (Primary)',
                        controller: _subCardController,
                        expandedHeight: 260, // Adjusted for content
                        children: [
                          subBuildInfoRow(
                              'Address 1', widget.client.resAddr1 ?? ''),
                          subBuildInfoRow(
                              'Address 2', widget.client.resAddr2 ?? ''),
                          subBuildInfoRow(
                              'Address 3', widget.client.resAddr3 ?? ''),
                          subBuildInfoRow(
                              'Address 4', widget.client.resAddr4 ?? ''),
                          subBuildInfoRow('City', widget.client.resCity ?? ''),
                          subBuildInfoRow(
                              'Postalcode', widget.client.resPostalcode ?? ''),
                          subBuildInfoRow(
                              'State', widget.client.resState ?? ''),
                          subBuildInfoRow(
                              'Country', widget.client.resCountry ?? '')
                        ],
                      ),
                      SubExpandableInfoCard(
                        title: 'Office Address',
                        controller: _subCardController,
                        expandedHeight: 270, // Adjusted for content
                        children: [
                          subBuildInfoRow(
                              'Address 1', widget.client.offAddr1 ?? ''),
                          subBuildInfoRow(
                              'Address 2', widget.client.offAddr2 ?? ''),
                          subBuildInfoRow(
                              'Address 3', widget.client.offAddr3 ?? ''),
                          subBuildInfoRow(
                              'Address 4', widget.client.offAddr4 ?? ''),
                          subBuildInfoRow('City', widget.client.offCity ?? ''),
                          subBuildInfoRow(
                              'Postalcode', widget.client.offPostalcode ?? ''),
                          subBuildInfoRow(
                              'State', widget.client.offState ?? ''),
                          subBuildInfoRow(
                              'Country', widget.client.offCountry ?? ''),
                        ],
                      ),
                      SubExpandableInfoCard(
                        title: 'Correspondence Address',
                        controller: _subCardController,
                        expandedHeight: 270, // Adjusted for content
                        children: [
                          subBuildInfoRow(
                              'Address 1', widget.client.corAddr1 ?? ''),
                          subBuildInfoRow(
                              'Address 2', widget.client.corAddr2 ?? ''),
                          subBuildInfoRow(
                              'Address 3', widget.client.corAddr3 ?? ''),
                          subBuildInfoRow(
                              'Address 4', widget.client.corAddr4 ?? ''),
                          subBuildInfoRow('City', widget.client.corCity ?? ''),
                          subBuildInfoRow(
                              'Postalcode', widget.client.corPostalcode ?? ''),
                          subBuildInfoRow(
                              'State', widget.client.corState ?? ''),
                          subBuildInfoRow(
                              'Country', widget.client.corCountry ?? ''),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Contact Details Card
                  ExpandableInfoCard(
                    title: 'Contact Details',
                    controller: _cardController,
                    expandedHeight: 400,
                    children: [
                      //buildInfoRow('Phone', client.phoneNumber ?? ''), // Add your contact fields
                      //buildInfoRow('Mobile', client.mobileNumber ?? ''),
                      //buildInfoRow('Work Email', client.workEmail ?? ''),
                      // Add more contact details as needed
                      buildInfoRow('Res-Phone', widget.client.resPh!),
                      buildInfoRow(
                          'Res-HandPhone', widget.client.resHandPhone!),
                      buildInfoRow('Res-Fax', widget.client.resFax!),

                      buildInfoRow('Office-Phone', widget.client.offPh!),
                      buildInfoRow(
                          'Office-HandPhone', widget.client.offHandPhone!),
                      buildInfoRow('Office-Fax', widget.client.offFax!),

                      buildInfoRow('Other-Phone', widget.client.othPh!),
                      buildInfoRow(
                          'Other-HandPhone', widget.client.othHandPhone!),
                      buildInfoRow('Other-Fax', widget.client.othFax!),
                    ],
                  ),
                ],
              )
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
