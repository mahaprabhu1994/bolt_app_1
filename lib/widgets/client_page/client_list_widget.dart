
import 'dart:math';

import 'package:bold1/blocs/client/client_modal.dart';
import 'package:bold1/blocs/theme_bloc.dart';
import 'package:bold1/screens/client_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ClientListWidget extends StatelessWidget {
  final Client client;

  const ClientListWidget({
    super.key,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    final isDarkMode = themeBloc.state.themeData.brightness == Brightness.dark;
    return
    GestureDetector(
        onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClientDetailScreen(client: client),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: 335,
        height: 143,
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: isDarkMode ? Theme.of(context).cardColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1E35385A),
              blurRadius: 30,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/client_3.jpeg'),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client.custName.substring(0, min(client.custName.length, 18)) + (client.custName.length > 18 ? '...' : ''),
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  'Email: ${client.emailId}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: const Icon(Icons.person),
                    ),
                    const SizedBox(width: 7),
                     Text(
                      'Client Category : ${client.custCateg}',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 146,
                      child: Text(
                        'Status : ${client.custStatus}',
                        style: const TextStyle(
                          color: Color(0xFF4FCC97),
                          fontSize: 12,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
