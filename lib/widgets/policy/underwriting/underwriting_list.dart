import 'package:flutter/material.dart';
import 'package:avallis/modal/policy/underwriting/underwriting.dart';

class UnderwritingList extends StatelessWidget {
  final List<Underwriting> underwritings;
  final ValueChanged<Underwriting> onUnderwritingTap;

  const UnderwritingList({
    super.key,
    required this.underwritings,
    required this.onUnderwritingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                'Total Underwriting(s): ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${underwritings.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: underwritings.length,
            itemBuilder: (context, index) {
              final underwriting = underwritings[index];
              return UnderwritingListItem(
                underwriting: underwriting,
                onTap: () => onUnderwritingTap(underwriting),
              );
            },
          ),
        ),
      ],
    );
  }
}

class UnderwritingListItem extends StatelessWidget {
  final Underwriting underwriting;
  final VoidCallback onTap;

  const UnderwritingListItem({
    super.key,
    required this.underwriting,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Underwriting Requirements',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const Icon(Icons.visibility_outlined),
                ],
              ),
              const SizedBox(height: 8),
              // Text(underwriting.requirement),
              TextFormField(
                enabled: false,
                maxLines: 1,
                initialValue: underwriting.requirement,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Adviser Response',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              TextFormField(
                enabled: false,
                maxLines: 2,

                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}