
import 'package:bold1/blocs/theme_bloc.dart';
import 'package:bold1/screens/client_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientListWidget extends StatelessWidget {
  const ClientListWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    final isDarkMode = themeBloc.state.themeData.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,),
      child: Container(
        width: 335,
        height: 143,
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: isDarkMode ? Theme.of(context).cardColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          shadows: [
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
                image: DecorationImage(
                  image: AssetImage('assets/images/client_3.jpeg'),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mahaprabhu ',
                    style: TextStyle(
                      //color: Color(0xFF3F3E3F),
                      fontSize: 14,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Advisor: NURAINI',
                    style: TextStyle(
                      //color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          'Client Category : Person',
                          style: TextStyle(
                            //color: Color(0xFFACA2A2),
                            fontSize: 12,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 146,
                          child: Text(
                            'Status : A-Applicant',
                            style: TextStyle(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
