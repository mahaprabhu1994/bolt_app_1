
import 'package:bold1/blocs/drawer_page_bloc.dart';
import 'package:bold1/events/drawer_page_event.dart';
import 'package:bold1/screens/client_detail_screen.dart';
import 'package:bold1/screens/client_screen.dart';
import 'package:bold1/screens/dashboard_screen.dart';
import 'package:bold1/states/drawer_page_state.dart';
import 'package:bold1/widgets/FancyBottomNavBar.dart';
import 'package:bold1/widgets/client_page/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme_bloc.dart';
import '../events/theme_event.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _screens = [
     DashBoardWidget(),
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
    const Center(child: Text('eKYC')),
    const Center(child: Text('FIPA')),
    const Center(child: Text('Your Team')),
  ];

   final List<String> labels = ['Home', 'Search', 'Profile', 'Settings'];

  final List<String> labels2 = ['client Details....', 'Policy', 'Activity', 'eKYC','FIPA','Your Team'];
  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    final isDarkMode = themeBloc.state.themeData.brightness == Brightness.dark;
    return Scaffold(


        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Adjust the height as needed
    // Add space on top
    child:Padding(
      padding: EdgeInsets.only(top: 0),
      child:
        AppBar(
              title: Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: const Text(
                  'Hi, Salim!',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w800,
                    height: 0.06,
                  ),
                ),
              ),
              automaticallyImplyLeading: false, // Disable the default drawer icon
              leading: Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer(); // Open the drawer on tap
                      },
                      child: Container(
                          width: 40, // Adjust size as needed
                          height: 40,
                          margin: const EdgeInsets.all(8), // Optional margin for spacing
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

        drawer: BlocBuilder<DrawerPageBloc,DrawerPageState>(
        builder: (context, state)
    {
      return
        Container(
          //margin: const EdgeInsets.only(top: 50, bottom: 65),

         child:
          Drawer(
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
                              leading: const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text(
                                  "S",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: const Text("Salim"),
                              subtitle: const Text("Advisor"),
                              trailing:
                              // Icon(Icons.green),
                              GestureDetector(
                                onTap: () {
                                  print("need to change the status of client");
                                },
                                child: Container(
                                  width: 20, // Adjust size as needed
                                  height: 20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/green_tick.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              )
                          ),
                          const SizedBox(height: 20),
                          ListTile(
                            leading:
                            const Icon(Icons.person, color: Colors.yellow),
                            title: const Text('Home'),
                            onTap: () {
                              context.read<DrawerPageBloc>().add(PageChanged(0));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading:
                            const Icon(Icons.person),
                            title: const Text('Client Details'),
                            onTap: () {
                              context.read<DrawerPageBloc>().add(PageChanged(1));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.policy),
                            title: const Text('Policy'),
                            onTap: () {
                              context.read<DrawerPageBloc>().add(PageChanged(2));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.note),
                            title: const Text('Activity'),
                            onTap: () {
                              context.read<DrawerPageBloc>().add(PageChanged(3));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.verified_user),
                            title: const Text('eKYC'),
                            onTap: () {
                              context.read<DrawerPageBloc>().add(PageChanged(4));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.file_open),
                            title: const Text('FIPA'),
                            onTap: () {
                              context.read<DrawerPageBloc>().add(PageChanged(5));
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.group),
                            title: const Text("Your Team"),
                            onTap: () {
                              context.read<DrawerPageBloc>().add(PageChanged(6));
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
          ),

        );


    }),

        body: BlocBuilder<DrawerPageBloc,DrawerPageState>(
          builder: (context,state){
            return  _getPage(state.selectedIndex);
            // return Center(child: Text("select the page"),);
          },
        ),
        bottomNavigationBar: const FancyBottomNavBar(icons: [
          Icons.home_rounded,
          Icons.person_rounded,
          Icons.task_alt_rounded,
          Icons.settings_rounded,
        ],
            //labels: ['Home', 'Client', 'Profile', 'Settings'],
          indexNo:[7,8,9,10]
            )


        );
  }
}

Widget _getPage(int index){
  switch(index){
    case 0:
      return DashBoardWidget();
    case 1:
      return SearchWidget();
    case 2:
      return Center(child: Text("Page Policy"),);
    case 3:
      return Center(child: Text("Activity"),);
    case 4:
      return Center(child: Text("eKYC"),);
    case 5:
      return Center(child: Text("FPMS"),);
    case 6:
      return Center(child: Text("Your Team"),);
    case 7:
      return DashBoardWidget();
    case 8:
      return SearchWidget();
    case 9:
      return Center(child: Text("Activity Page"),);
    case 10:
      return Center(child: Text("settings page"),);

    default:
      return DashBoardWidget();

  }
}
