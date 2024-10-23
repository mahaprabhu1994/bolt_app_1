import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartWidgetContainer extends StatelessWidget {
  const ChartWidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 214,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x106154AA),
            blurRadius: 10.02,
            offset: Offset(0, 12.52),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: -61,
            top: -77,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 212,
                height: 212,
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.19, -0.98),
                    end: Alignment(-0.19, 0.98),
                    colors: [Color(0xFFBCF9FF), Color(0x0082EFFF)],
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 180,
            top: -12,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 278,
                height: 278,
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.19, -0.98),
                    end: Alignment(-0.19, 0.98),
                    colors: [Color(0xFFBCF9FF), Color(0x0082EFFF)],
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 22,
            top: 14,
            child: SizedBox(
              width: 296,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Upcoming ',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const TextSpan(
                          text: 'Events ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w800,
                            height: 0.11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'View More',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      // decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 1.5,
                      wordSpacing: 2,
                      height: 3.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 22,
            top: 55,
            child: SizedBox(
              width: 300,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  final events = [
                    {
                      'title': 'Team Meeting',
                      'date': 'Oct 22, 2024',
                      'time': '10:00 AM'
                    },
                    {
                      'title': 'Project Review',
                      'date': 'Oct 23, 2024',
                      'time': '2:30 PM'
                    }
                  ];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            events[index]['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${events[index]['date']} ${events[index]['time']}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
