import 'package:flutter/material.dart';
import 'package:avallis/modal/policy/underwriting/underwriting.dart';

class UnderwritingDetailDialog extends StatelessWidget {
  final Underwriting underwriting;

  const UnderwritingDetailDialog({
    super.key,
    required this.underwriting,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(24),
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Underwriter Name',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(underwriting.underwriterName),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Date Received',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      underwriting.dateReceived?.toString() ?? '--NIL--',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Underwriting Requirements',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            // Text(underwriting.requirement),

            TextFormField(

              maxLines: 2,
              initialValue: underwriting.requirement,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Adv-Res Updated By',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'Res Date',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(underwriting.adviserResponseUpdatedBy),
                Text(underwriting.responseDate?.toString() ?? '--NIL--'),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Adviser Response',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            if (underwriting.attachments.isNotEmpty) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Total Attachment(s): ',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${underwriting.attachments.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...underwriting.attachments.map(
                    (attachment) => Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                    ),
                    title: Text(attachment.name),
                    subtitle: Text(attachment.size),
                    trailing: const Icon(Icons.file_download_outlined),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle save logic
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}