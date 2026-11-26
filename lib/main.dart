import 'package:material_ui/material_ui.dart';

import 'screens/home_page.dart';
import 'screens/profile_page.dart';
import 'screens/progress_page.dart';
import 'screens/tasks_page.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const StudentPlannerApp());
}

class StudentPlannerApp extends StatelessWidget {
  const StudentPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Study Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryBlue,
          surface: AppColors.surface,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Icon(icon, size: 22),
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primaryBlueSoft,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(activeIcon, size: 22),
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          TasksPage(),
          ProfilePage(),
          ProgressPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(
            top: BorderSide(color: AppColors.border, width: 1),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.surface,
            elevation: 0,
            currentIndex: _currentIndex,
            selectedItemColor: AppColors.primaryBlue,
            unselectedItemColor: AppColors.textSecondary,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            onTap: (i) {
              setState(() => _currentIndex = i);
              _pageController.jumpToPage(i);
            },
            items: [
              _buildNavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home_outlined,
                label: 'Home',
              ),
              _buildNavItem(
                icon: Icons.check_box_outlined,
                activeIcon: Icons.check_box_outlined,
                label: 'Tasks',
              ),
              _buildNavItem(
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_outline_rounded,
                label: 'Profile',
              ),
              _buildNavItem(
                icon: Icons.bar_chart_rounded,
                activeIcon: Icons.bar_chart_rounded,
                label: 'Progress',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
