import 'package:avallis/blocs/login/login_bloc.dart';
import 'package:avallis/blocs/login/login_state.dart';
import 'package:avallis/widgets/client_page/client_list_widget.dart';
import 'package:avallis/widgets/client_page/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: BlocBuilder<LoginBloc,LoginState>(
    builder:(context,logstate)
    {
      // Get the adviser name from login state
      final String adviserId = logstate is LoginSuccess
          ? logstate.loginResponse.adviserId ?? 'N/A'
          : 'N/A';
      //String advisor = logstate.loginResponse.adviserId;
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchWidget(adviserId:adviserId),
            ElevatedButton.icon(
                onPressed: () {
                  print('filter clicked');
                },
                label: const Icon(Icons.filter_list))
          ],
        );
    })


          ),
          // FilterSliderWidget(),
          SizedBox.fromSize(
            size: const Size.fromHeight(120.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
                child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "client Listing",
                  style: TextStyle(
                    color: Color(0xFF3F3E3F),
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            )),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(20.0),
          ),
          // ClientListWidget(),
          // ClientListWidget(),
          // ClientListWidget(),
        ],
      ),
    );
  }
}
