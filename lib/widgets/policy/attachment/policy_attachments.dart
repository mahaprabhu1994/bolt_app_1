import 'package:flutter/material.dart';

class PolicyAttachment {
  final String fileName;
  final String fileSize;
  final String date;

  const PolicyAttachment({
    required this.fileName,
    required this.fileSize,
    required this.date,
  });
}

class PolicyAttachmentsWidget extends StatelessWidget {
  final List<PolicyAttachment> attachments;
  final Function(PolicyAttachment) onDownload;
  final Function(PolicyAttachment) onPreview;

  const PolicyAttachmentsWidget({
    super.key,
    required this.attachments,
    required this.onDownload,
    required this.onPreview,
  });

  void _showAttachmentOptions(BuildContext context, PolicyAttachment attachment) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.remove_red_eye_outlined),
              title: const Text('Preview'),
              onTap: () {
                Navigator.pop(context);
                onPreview(attachment);
              },
            ),
            ListTile(
              leading: const Icon(Icons.download_outlined),
              title: const Text('Download'),
              onTap: () {
                Navigator.pop(context);
                onDownload(attachment);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Policy Attachments',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 8),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'No. of Doc(s) : ${attachments.length}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Handle download all
                      },
                      icon: const Icon(Icons.download_outlined),
                      label: const Text('Download All'),
                    ),
                  ],
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search File Name',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.grid_view_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.list),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: attachments.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final attachment = attachments[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.picture_as_pdf,
                    color: Colors.red,
                  ),
                  title: Text(
                    attachment.fileName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    '${attachment.fileSize} · ${attachment.date}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () => _showAttachmentOptions(context, attachment),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Preview Dialog
class PDFPreviewDialog extends StatelessWidget {
  final PolicyAttachment attachment;

  const PDFPreviewDialog({
    super.key,
    required this.attachment,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(24),
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Preview Document',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Add your PDF viewer widget here
            Container(
              height: 500,
              color: Colors.grey[200],
              child: const Center(
                child: Text('PDF Preview Here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}