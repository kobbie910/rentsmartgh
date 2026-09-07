import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onPostProperty;
  final bool hasUnreadMessages;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.onPostProperty,
    this.hasUnreadMessages = false,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(icon: Icons.home, label: 'Home', index: 0),
            _navItem(icon: Icons.search, label: 'Search', index: 1),
            _postPropertyItem(),
            _navItem(
              icon: Icons.chat_bubble_outline,
              label: 'Messages',
              index: 3,
              showBadge: hasUnreadMessages,
            ),
            _navItem(icon: Icons.person_outline, label: 'Profile', index: 4),
          ],
        ),
      ),
    );
  }

  Widget _postPropertyItem() {
    return InkWell(
      onTap: onPostProperty,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.primaryGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
            const SizedBox(height: 2),
            const Text(
              'Post Property',
              style: TextStyle(color: AppColors.primaryGreen, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
    bool showBadge = false,
  }) {
    final bool isSelected = currentIndex == index;
    final color = isSelected ? AppColors.primaryGreen : Colors.grey;

    return InkWell(
      onTap: () => onTabSelected(index),
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, color: color, size: 24),
                if (showBadge)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.accentRed,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(color: color, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}