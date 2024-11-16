import 'package:avallis/widgets/policy/attachment/policy_attachments.dart';
import 'package:flutter/material.dart';

class PolicyAttachmentsScreen extends StatelessWidget {
  const PolicyAttachmentsScreen({super.key});

  void _handleDownload(PolicyAttachment attachment) {
    // Implement download logic
    debugPrint('Downloading: ${attachment.fileName}');
  }

  void _handlePreview(BuildContext context, PolicyAttachment attachment) {
    showDialog(
      context: context,
      builder: (context) => PDFPreviewDialog(attachment: attachment),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Example data
    final attachments = [
      const PolicyAttachment(
        fileName: 'ddd',
        fileSize: '608.85 KB',
        date: '26/02/2024',
      ),
      const PolicyAttachment(
        fileName: 'ccc',
        fileSize: '300.2 KB',
        date: '07/02/2024',
      ),
      const PolicyAttachment(
        fileName: 'bbb',
        fileSize: '156.21 KB',
        date: '02/02/2024',
      ),
      const PolicyAttachment(
        fileName: 'aaa',
        fileSize: '252.27 KB',
        date: '02/02/2024',
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PolicyAttachmentsWidget(
          attachments: attachments,
          onDownload: _handleDownload,
          onPreview: (attachment) => _handlePreview(context, attachment),
        ),
      ),
    );
  }
}