import 'dart:ui';
import 'package:anesthesia_handbook/Calculators/calculator_home.dart';
import 'package:anesthesia_handbook/Calculators/fluids.dart';
import 'package:anesthesia_handbook/Calculators/insulin.dart';
import 'package:anesthesia_handbook/Calculators/patient_widget.dart';
import 'package:anesthesia_handbook/Calculators/pump_cases.dart';
import 'package:anesthesia_handbook/Directory/directory_codes.dart';
import 'package:anesthesia_handbook/Directory/directory_home.dart';
import 'package:anesthesia_handbook/Directory/directory_phone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

import 'package:anesthesia_handbook/EmergencyManual/emergency_home.dart';
import './EmergencyManual/emergency_page.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Home/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _emergencyNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Emergency');
final _calculatorNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Calculator');
final _directoryNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Directory');

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context,state,navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context,state) => const NoTransitionPage(child: HomeScreen()),
              routes: [
                GoRoute(
                  path: 'about',
                  builder: (context,state) => const Placeholder(),
                )
              ],
            )
          ],          
        ),
        StatefulShellBranch(
          navigatorKey: _emergencyNavigatorKey,
          routes: [
            GoRoute(
              path: '/emergency',
              pageBuilder: (context,state) => const NoTransitionPage(child: EmergencyHome()),
              routes: [
                GoRoute(
                  name: 'emergencypage',
                  path: 'emergencypage/:pageTitle',
                  builder: (context,state) => EmergencyPage(pageTitle: state.pathParameters['pageTitle']!),
                )
              ],
            )
          ],          
        ),
        StatefulShellBranch(
          navigatorKey: _calculatorNavigatorKey,
          routes: [
            GoRoute(
              path: '/calculator',
              pageBuilder: (context,state) => const NoTransitionPage(child: CalculatorHome()),
              routes: [
                GoRoute(
                  path: 'bodycomp',
                  builder: (context,state) => const DemographicsPage(),
                ),
                GoRoute(
                  path: 'equipment',
                  builder: (context,state) => const EquipmentPage(),
                ),
                GoRoute(
                  path: 'fluids',
                  builder: (context,state) => const FluidsPage(),
                ),
                GoRoute(
                  path: 'insulin',
                  builder: (context,state) => const InsulinPage(),
                ),
                GoRoute(
                  path: 'pump',
                  builder: (context,state) => const PumpCaseGuide(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _directoryNavigatorKey,
          routes: [
            GoRoute(
              path: '/directory',
              builder: (context,state) => const DirectoryHome(),
              routes: [
                GoRoute(
                  path: 'codes',
                  builder: (context,state) => const CodesPage(),
                ),                
                GoRoute(
                  path: 'phone',
                  builder: (context,state) => const PhonePage(),
                ),
              ],
            ),
          ],
        )
      ]
    )
  ],
);

void main() => runApp(const ProviderScope(child: HopkinsApp()));

class HopkinsApp extends StatelessWidget {
  /// Defines the Hopkins Anesthesia App theme data and home page.
  const HopkinsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        scrollBehavior: MyScrollBehavior(),
        routerConfig: _router,
        theme: ThemeData(useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
      ),
    );
  }
}

class ScaffoldWithNestedNavigation extends StatelessWidget {
  /// Creates a bottom navigation bar to switch between the 4 main modes of the app (Home, Emergency Manual, Calculators, and Directory)
  
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));

  /// GoRouter Navigation Shell
  final StatefulNavigationShell navigationShell;

  static List<Widget> destinations = const <Widget>[
    NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.emergency),
      icon: Icon(Icons.emergency_outlined),
      label: 'Emergency',
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.calculate),
      icon: Icon(Icons.calculate_outlined),
      label: 'Calculators',
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.phone),
      icon: Icon(Icons.phone_outlined),
      label: 'Directory',
    )
  ];

  static List<NavigationRailDestination> railDestinations = const <NavigationRailDestination>[
    NavigationRailDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: Text('Home'),
    ),
    NavigationRailDestination(
      selectedIcon: Icon(Icons.emergency),
      icon: Icon(Icons.emergency_outlined),
      label: Text('Emergency'),
    ),
    NavigationRailDestination(
      selectedIcon: Icon(Icons.calculate),
      icon: Icon(Icons.calculate_outlined),
      label: Text('Calculators'),
    ),
    NavigationRailDestination(
      selectedIcon: Icon(Icons.phone),
      icon: Icon(Icons.phone_outlined),
      label: Text('Directory'),
    )
  ];

  void _gobranch(int index) {
    /// Defines which main page to set the app to (0: Home, 1: Emergency Manual, 2: Calculators, 3: Directory
     
    // Use initialLocation to support going back to the original page by tapping
    // the navigation bar item that is already active
    navigationShell.goBranch(index,initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// Builds the bottom navigation bar
    return LayoutBuilder(
      builder: (context,constraints) {
        if (constraints.maxWidth < 600) {
          return scaffoldWithNavBar();
        } else {
          return scaffoldWithNavRail();
        }
      }
    );
  }

  Scaffold scaffoldWithNavBar() {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _gobranch,
        indicatorColor: Colors.blue,
        selectedIndex: navigationShell.currentIndex,
        destinations: destinations,
      ),
      body: navigationShell,
    );
  }

  Scaffold scaffoldWithNavRail() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            destinations: railDestinations,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _gobranch,
            labelType: NavigationRailLabelType.all,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: navigationShell)
        ],
      )
    );
  }
}
