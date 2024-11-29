import 'package:avallis/blocs/tab/tab_bloc.dart';
import 'package:avallis/blocs/tab/tab_event.dart';
import 'package:avallis/screens/fna_approval_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //final devInfoBloc = BlocProvider.of<DeviceInfoBloc>(context);
    return Drawer(
      elevation: 16,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // UserAccountsDrawerHeader(
            //   accountName: Text(
            //       // adviserName,
            //       // style: TextStyle(
            //       //   color: isDarkMode ? Colors.black87 : Colors.white,
            //       // ),
            //       ),
            //   accountEmail: Text(
            //       //adviserEmailId,
            //       // style: TextStyle(
            //       //   color: isDarkMode ? Colors.black87 : Colors.white,
            //       // ),
            //       ),
            //   currentAccountPicture: const CircleAvatar(),
            // ),
            ListTile(
              title: const Text('DashBoard'),
              leading: const Icon(Icons.dashboard),
              onTap: () {
                print("Drawer lsitTile open cloe");
                context.read<TabBloc>().add(SelectTab(0));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Client Details'),
              leading: const Icon(Icons.face),
              onTap: () {
                print("Drawer lsitTile open cloe");
                //context.read<TabBloc>().add(SelectTab(1));
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/client');
              },
            ),
            ListTile(
              title: const Text('Policy'),
              leading: const Icon(Icons.policy),
              onTap: () {
                print("Drawer lsitTile open cloe");
                context.read<TabBloc>().add(SelectTab(2));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Activity'),
              leading: const Icon(Icons.local_activity),
              onTap: () {
                print("Drawer lsitTile open cloe");
                context.read<TabBloc>().add(SelectTab(3));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Approval'),
              leading: const Icon(Icons.edit_document),
              // onTap: () {
              //   print("Drawer lsitTile open cloe");
              //   context.read<TabBloc>().add(SelectTab(11));
              //   Navigator.pop(context);
              // },

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FnaApprovalScreen(
                      advisorId: 'ADVFPF00000000000058',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('eKYC'),
              leading: const Icon(Icons.edit_document),
              onTap: () {
                print("Drawer lsitTile open cloe");
                context.read<TabBloc>().add(SelectTab(4));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('FIPA'),
              leading: const Icon(Icons.approval),
              onTap: () {
                print("Approval is clicked");
                context.read<TabBloc>().add(SelectTab(5));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('your Team'),
              leading: const Icon(Icons.group),
              onTap: () {
                print("Drawer lsitTile open cloe");
                context.read<TabBloc>().add(SelectTab(6));
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   title: const Text('Production'),
            //   leading: const Icon(Icons.precision_manufacturing),
            //   onTap: () {
            //     print("Drawer lsitTile open cloe");
            //     context.read<TabBloc>().add(SelectTab(6));
            //     Navigator.pop(context);
            //   },
            // ),

          ],
        ),
      ),
    );
  }
}
