

import 'package:bold1/screens/client_detail_screen.dart';
import 'package:bold1/widgets/client_page/client_list_widget.dart';
import 'package:bold1/widgets/client_page/client_search_section.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return  Column(
        children: [
          const ClientSearchSection(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  19,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child:ClientListWidget()
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  }
}