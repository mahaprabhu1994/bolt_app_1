import 'package:flutter/material.dart';


// Main card controller
class ExpandableCardController extends ChangeNotifier {
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

// Sub card controller
class SubExpandableCardController extends ChangeNotifier {
  final Set<String> _expandedSubCards = {};

  bool isExpanded(String cardTitle) => _expandedSubCards.contains(cardTitle);

  void toggleCard(String cardTitle) {
    if (_expandedSubCards.contains(cardTitle)) {
      _expandedSubCards.remove(cardTitle);
    } else {
      _expandedSubCards.add(cardTitle);
    }
    notifyListeners();
  }
}

Widget buildInfoRow(String label, String value) {
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
//
// // SubExpandableInfoCard for nested expansion
// class SubExpandableInfoCard extends StatefulWidget {
//   final String title;
//   final List<Widget> children;
//   final SubExpandableCardController controller;
//   final bool initiallyExpanded;
//   final double expandedHeight;
//
//   const SubExpandableInfoCard({
//     super.key,
//     required this.title,
//     required this.children,
//     required this.controller,
//     this.initiallyExpanded = false,
//     this.expandedHeight = 100, // Default sub-card expanded height
//   });
//
//   @override
//   State<SubExpandableInfoCard> createState() => _SubExpandableInfoCardState();
// }
//
// class _SubExpandableInfoCardState extends State<SubExpandableInfoCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _rotationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _rotationAnimation = Tween<double>(
//       begin: 0,
//       end: 0.5,
//     ).animate(CurvedAnimation(
//       parent: _rotationController,
//       curve: Curves.easeInOut,
//     ));
//   }
//
//   @override
//   void dispose() {
//     _rotationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListenableBuilder(
//       listenable: widget.controller,
//       builder: (context, _) {
//         final isExpanded = widget.controller.isExpanded(widget.title);
//
//         if (isExpanded) {
//           _rotationController.forward();
//         } else {
//           _rotationController.reverse();
//         }
//
//         return Column(
//
//           children: [
//             InkWell(
//               onTap: () => widget.controller.toggleCard(widget.title),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       widget.title,
//                       style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     RotationTransition(
//                       turns: _rotationAnimation,
//                       child: const Icon(
//                         Icons.expand_more,
//                         size: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ClipRect(
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeInOut,
//                 height: isExpanded ? _calculateExpandedHeight() : 0,
//                 child: SingleChildScrollView(
//                   physics: const NeverScrollableScrollPhysics(),
//                   child: Column(
//                     children: [
//                       const Divider(),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 16.0,
//                           top: 8.0,
//                           bottom: 8.0,
//                         ),
//                         child: Container(
//                           color: Colors.amber,
//                           child: Column(
//
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: widget.children,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   double _calculateExpandedHeight() {
//     const double rowHeight = 50.0;
//     const double padding = 32.0;
//     const double dividerHeight = 1.0;
//     return (widget.children.length * rowHeight) + padding + dividerHeight;
//   }
// }
//
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

///////////////////////////



class ExpandableInfoCard extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final bool initiallyExpanded;
  final ExpandableCardController controller;
  final double expandedHeight;

  const ExpandableInfoCard({
    super.key,
    required this.title,
    required this.children,
    required this.controller,
    this.initiallyExpanded = false,
    this.expandedHeight = 300,
  });

  @override
  State<ExpandableInfoCard> createState() => _ExpandableInfoCardState();
}

class _ExpandableInfoCardState extends State<ExpandableInfoCard>
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
            mainAxisSize: MainAxisSize.min,
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
                  height: isExpanded ? widget.expandedHeight : 0,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.children,
                      ),
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
}

class SubExpandableInfoCard extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final SubExpandableCardController controller;
  final bool initiallyExpanded;
  final double expandedHeight;

  const SubExpandableInfoCard({
    super.key,
    required this.title,
    required this.children,
    required this.controller,
    this.initiallyExpanded = false,
    this.expandedHeight = 400,
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
        final isExpanded = widget.controller.isExpanded(widget.title);

        if (isExpanded) {
          _rotationController.forward();
        } else {
          _rotationController.reverse();
        }

        return Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => widget.controller.toggleCard(widget.title),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RotationTransition(
                        turns: _rotationAnimation,
                        child: const Icon(
                          Icons.expand_more,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRect(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: isExpanded ? widget.expandedHeight : 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // const Divider(height: 1),
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
}