import 'package:avallis/blocs/drawer_page_bloc.dart';
import 'package:avallis/blocs/login/login_bloc.dart';
import 'package:avallis/blocs/login/login_state.dart';
import 'package:avallis/events/drawer_page_event.dart';
import 'package:avallis/screens/client_detail_screen.dart';
import 'package:avallis/screens/client_screen.dart';
import 'package:avallis/screens/dashboard_screen.dart';
import 'package:avallis/screens/fna_approval_screen.dart';
import 'package:avallis/states/drawer_page_state.dart';
import 'package:avallis/widgets/FancyBottomNavBar.dart';
import 'package:avallis/widgets/client_page/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme_bloc.dart';
import '../events/theme_event.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _screens = [
    const DashBoardWidget(),
    const Center(child: Text('Search')),
    const Center(child: Text('Profile')),
    const Center(child: Text('Settings')),
    const Center(child: Text('Client')),
    const Center(child: Text('Policy')),
    const Center(child: Text('Activity')),
    const Center(child: Text('eKYC')),
    const Center(child: Text('FIPA')),
    const Center(child: Text('Your Team')),
  ];

  final List<Widget> _screens2 = [
    const Center(child: Text('Client')),
    const Center(child: Text('Policy')),
    const Center(child: Text('Activity')),
    // const Center(child: Text('Approval')),
    const Center(child: Text('eKYC')),
    const Center(child: Text('FIPA')),
    const Center(child: Text('Your Team')),
  ];

  final List<String> labels = ['Home', 'Search', 'Profile', 'Settings'];

  final List<String> labels2 = [
    'client Details....',
    'Policy',
    'Activity',
    'eKYC',
    'FIPA',
    'Your Team'
  ];
  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    final isDarkMode = themeBloc.state.themeData.brightness == Brightness.dark;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(60.0), // Adjust the height as needed
          // Add space on top
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: AppBar(
              title: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, logstate) {
                    // Get the adviser name from login state
                    final String adviserName = logstate is LoginSuccess
                        ? logstate.loginResponse.adviserName ?? 'N/A'
                        : 'N/A';
                    return Text(
                      'Hi $adviserName!',
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w800,
                        height: 0.06,
                      ),
                    );
                  })),
              automaticallyImplyLeading:
                  false, // Disable the default drawer icon
              leading: Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context)
                            .openDrawer(); // Open the drawer on tap
                      },
                      child: Container(
                        width: 40, // Adjust size as needed
                        height: 40,
                        margin: const EdgeInsets.all(
                            8), // Optional margin for spacing
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/menu2.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        drawer: BlocBuilder<DrawerPageBloc, DrawerPageState>(
            builder: (context, drawerstate) {
          return BlocBuilder<LoginBloc, LoginState>(
            builder: (context, loginstate) {
              // Get the adviser name from login state
              final String adviserName = loginstate is LoginSuccess
                  ? loginstate.loginResponse.adviserName ?? 'N/A'
                  : 'N/A';

              // Get the first letter for the avatar
              final String avatarLetter =
                  adviserName.isNotEmpty ? adviserName[0].toUpperCase() : 'U';

              ////staff Type
              final String staffType = loginstate is LoginSuccess
                  ? loginstate.loginResponse.staffType ?? 'N/A'
                  : 'N/A';
              return Container(
                  //margin: const EdgeInsets.only(top: 50, bottom: 65),

                  child: Drawer(
                    // shadowColor: Colors.amber,
                // surfaceTintColor: Colors.deepOrange,
                child: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 50, bottom: 50), // Add top and bottom margins
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(
                                vertical: 50, horizontal: 20),
                            children: [
                              ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      avatarLetter,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(adviserName),
                                  subtitle: Text(staffType),
                                  trailing:
                                      // Icon(Icons.green),
                                      GestureDetector(
                                    onTap: () {
                                      print(
                                          "need to change the status of client");
                                    },
                                    child: Container(
                                      width: 20, // Adjust size as needed
                                      height: 20,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/green_tick.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  )),
                              const SizedBox(height: 20),
                              ListTile(
                                leading: const Icon(Icons.person,
                                    color: Colors.yellow),
                                title: const Text('Home'),
                                onTap: () {
                                  context
                                      .read<DrawerPageBloc>()
                                      .add(PageChanged(0));
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.person),
                                title: const Text('Client Details'),
                                onTap: () {
                                  context
                                      .read<DrawerPageBloc>()
                                      .add(PageChanged(1));
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.policy),
                                title: const Text('Policy'),
                                onTap: () {
                                  context
                                      .read<DrawerPageBloc>()
                                      .add(PageChanged(2));
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.note),
                                title: const Text('Activity'),
                                onTap: () {
                                  context
                                      .read<DrawerPageBloc>()
                                      .add(PageChanged(3));
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.approval),
                                title: const Text('Approval'),
                                onTap: () {
                                  context
                                      .read<DrawerPageBloc>()
                                      .add(PageChanged(11));
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.verified_user),
                                title: const Text('eKYC'),
                                onTap: () {
                                  context
                                      .read<DrawerPageBloc>()
                                      .add(PageChanged(4));
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.file_open),
                                title: const Text('FIPA'),
                                onTap: () {
                                  context
                                      .read<DrawerPageBloc>()
                                      .add(PageChanged(5));
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.group),
                                title: const Text("Your Team"),
                                onTap: () {
                                  context
                                      .read<DrawerPageBloc>()
                                      .add(PageChanged(6));
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.logout),
                                title: const Text('Log Out'),
                                onTap: () {
                                  print("log out clicked");
                                },
                              ),

                              //  PageNavDrawer(icons: [
                              //   Icons.person,
                              //   Icons.policy,
                              //   Icons.note,
                              //   Icons.verified_user,
                              //   Icons.file_open,
                              //   Icons.group,
                              //   Icons.logout,
                              // ],
                              //   labels: ['Client Details', 'Policy', 'Activity', 'eKYC','FIPA','Your Team','Logout'],
                              // )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
                              // Switch(
                              //   value:
                              //       false, // You should use a state variable here
                              //   onChanged: (bool value) {

                              //   },
                              // ),

                              IconButton(
                                icon: const Icon(Icons.brightness_6),
                                onPressed: () {
                                  context.read<ThemeBloc>().add(ToggleTheme());
                                  //Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
            },
          );
        }),
        body: BlocBuilder<DrawerPageBloc, DrawerPageState>(
          builder: (context, state) {
            return BlocBuilder<LoginBloc, LoginState>(
                builder: (context, loginstate) {
              // Get the adviser name from login state
              final String adviserId = loginstate is LoginSuccess
                  ? loginstate.loginResponse.adviserId ?? 'N/A'
                  : 'N/A';

              return _getPage(state.selectedIndex, adviserId);
            });
            // return Center(child: Text("select the page"),);
          },
        ),
        bottomNavigationBar: const FancyBottomNavBar(
            icons: [
              Icons.home_rounded,
              Icons.person_rounded,
              Icons.task_alt_rounded,
              Icons.settings_rounded,
            ],
            //labels: ['Home', 'Client', 'Profile', 'Settings'],
            indexNo: [
              7,
              8,
              9,
              10
            ]));
  }
}

Widget _getPage(int index, String adviserId) {
  switch (index) {
    case 0:
      return const DashBoardWidget();
    case 1:
      return SearchWidget(
        adviserId: adviserId,
      );
    case 2:
      return const Center(
        child: Text("Page Policy"),
      );
    case 3:
      return const Center(
        child: Text("Activity"),
      );
    case 4:
      return const Center(
        child: Text("eKYC"),
      );
    case 5:
      return const Center(
        child: Text("FIPA"),
      );
    case 6:
      return const Center(
        child: Text("Your Team"),
      );
    case 7:
      return const DashBoardWidget();
    case 8:
      return SearchWidget(adviserId: adviserId);
    case 9:
      return const Center(
        child: Text("Activity Page"),
      );
    case 10:
      return const Center(
        child: Text("settings page"),
      );
    case 11:
      return const Center(
        child:
        // Text("Approval"),
        FnaApprovalScreen(advisorId: 'ADVFPF00000000000058',)
      );

    default:
      return const DashBoardWidget();
  }
}
