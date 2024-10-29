import 'package:flutter/material.dart';

class SubExpandableCardController extends ChangeNotifier {
  String? _expandedCardTitle;

  String? get expandedCardTitle => _expandedCardTitle;

  void toggleCard(String cardTitle) {
    if (_expandedCardTitle == cardTitle) {
      _expandedCardTitle = null;
    } else {
      _expandedCardTitle = cardTitle;
    }
    notifyListeners();
  }
}





class SubExpandableInfoCard extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final bool initiallyExpanded;
  final SubExpandableCardController controller;

  const SubExpandableInfoCard({
    super.key,
    required this.title,
    required this.children,
    required this.controller,
    this.initiallyExpanded = false,
  });

  @override
  State<SubExpandableInfoCard> createState() => _SubExpandableInfoCardState();
}

class _SubExpandableInfoCardState extends State<SubExpandableInfoCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        final isExpanded = widget.controller.expandedCardTitle == widget.title;

        if (isExpanded) {
          _rotationController.forward();
        } else {
          _rotationController.reverse();
        }

        return Card(
          child: Column(
            children: [
              InkWell(
                onTap: () => widget.controller.toggleCard(widget.title),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RotationTransition(
                        turns: _rotationAnimation,
                        child: const Icon(Icons.expand_more),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRect(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: isExpanded ? _calculateExpandedHeight() : 0,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        // const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.children,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double _calculateExpandedHeight() {
    // Calculate approximate height based on number of children
    // You might need to adjust these values based on your specific content
    const double rowHeight = 32.0; // Average height per row
    const double padding = 32.0; // Total vertical padding
    const double dividerHeight = 1.0;

    return (widget.children.length * rowHeight) + padding + dividerHeight;
  }
}

Widget subBuildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    ),
  );
}