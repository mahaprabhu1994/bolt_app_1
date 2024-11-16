import 'package:flutter/material.dart';

class PolicyPlansWidget extends StatefulWidget {
  const PolicyPlansWidget({Key? key}) : super(key: key);

  @override
  State<PolicyPlansWidget> createState() => _PolicyPlansWidgetState();
}

class _PolicyPlansWidgetState extends State<PolicyPlansWidget> {
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
      child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Principal Name : Aviva Ltd',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(
                  'assets/images/Singlife.png',
                  height: 40,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildPlansSection(
              title: 'Basic Plans',
              totalPlans: '1',
              plans: [
                PlanItem(
                  code: 'PENDING PLAN CODE',
                  name: 'PENDING PLAN CODE CREATION',
                  premium: '1201.55',
                  isPending: true,
                ),
                PlanItem(
                  code: 'PENDING PLAN CODE',
                  name: 'PENDING PLAN CODE CREATION',
                  premium: '1201.55',
                  isPending: true,
                ),
                PlanItem(
                  code: 'PENDING PLAN CODE',
                  name: 'PENDING PLAN CODE CREATION',
                  premium: '1201.55',
                  isPending: true,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildPlansSection(
              title: 'Rider Plans',
              totalPlans: '1',
              plans: [
                PlanItem(
                  code: 'ADB',
                  name: 'Accidental Death Benefit',
                  premium: '95.05',
                  isPending: false,
                ),
                PlanItem(
                  code: 'ADB',
                  name: 'Accidental Death Benefit',
                  premium: '95.05',
                  isPending: false,
                ),
                PlanItem(
                  code: 'ADB',
                  name: 'Accidental Death Benefit',
                  premium: '95.05',
                  isPending: false,
                ),
              ],
            ),
          ],
        ),
      ),),
    );
  }

  Widget _buildPlansSection({
    required String title,
    required String totalPlans,
    required List<PlanItem> plans,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Total Plans : ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          totalPlans,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.list),
                        onPressed: () {},
                        color: Colors.grey[600],
                      ),
                      IconButton(
                        icon: const Icon(Icons.grid_view),
                        onPressed: () {},
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: plans.length,
          itemBuilder: (context, index) {
            return _buildPlanCard(plans[index], context);
          },
        ),
      ],
    );
  }

  Widget _buildPlanCard(PlanItem plan, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => _showPlanDetailsPopup(context, plan),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (plan.isPending)
                Text(
                  'PENDING PLAN CODE CREATION',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w500,
                    // fontSize: 10
                  ),
                )
              else
                Text(
                  plan.name,
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Code: ${plan.code}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Premium: ${plan.premium}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPlanDetailsPopup(BuildContext context, PlanItem plan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Policy # ${plan.code}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildPlanDetailRow('Plan Name', plan.name),
                _buildPlanDetailRow('Plan Code', plan.code),
                _buildPlanDetailDivider(),
                Row(
                  children: [
                    Expanded(child: _buildPlanDetailRow('Plan Term', '0')),
                    Expanded(child: _buildPlanDetailRow('Sum Assured', '4_')),
                    Expanded(child: _buildPlanDetailRow('Premium', plan.premium)),
                  ],
                ),
                _buildPlanDetailDivider(),
                Row(
                  children: [
                    Expanded(
                      child: _buildPlanDetailRow('Premium Term', '0'),
                    ),
                    Expanded(
                      child: _buildPlanDetailRow('Mediashield Premium', '0'),
                    ),
                    Expanded(
                      child: _buildPlanDetailRow('Net Premium', plan.premium),
                    ),
                  ],
                ),
                _buildPlanDetailDivider(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Premium Type',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'REGULAR',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment Mode',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.check,
                                  size: 12,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'ANNUALLY',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Upgrade Plan',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Switch(
                            value: false,
                            onChanged: (value) {},
                            activeColor: Colors.green,
                          ),
                        ],
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
  }

  Widget _buildPlanDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanDetailDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Divider(),
    );
  }
}

class PlanItem {
  final String code;
  final String name;
  final String premium;
  final bool isPending;

  PlanItem({
    required this.code,
    required this.name,
    required this.premium,
    this.isPending = false,
  });
}