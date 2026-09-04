import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onPostProperty;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.onPostProperty,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(icon: Icons.home, label: 'Home', index: 0),
          _navItem(icon: Icons.search, label: 'Search', index: 1),
          const SizedBox(width: 40), // gap for the notch/FAB
          _navItem(icon: Icons.chat_bubble_outline, label: 'Messages', index: 3),
          _navItem(icon: Icons.person_outline, label: 'Profile', index: 4),
        ],
      ),
    );
  }

  Widget _navItem({required IconData icon, required String label, required int index}) {
    final bool isSelected = currentIndex == index;
    final color = isSelected ? AppColors.primaryGreen : Colors.grey;

    return InkWell(
      onTap: () => onTabSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(color: color, fontSize: 11)),
        ],
      ),
    );
  }
}