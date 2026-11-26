import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 96),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tasks',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    HeaderIconButton(icon: Icons.calendar_today_outlined),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSearchBar(),
                const SizedBox(height: 22),
                _buildGroupHeader(
                  label: 'TODAY · FRI, 13 NOV',
                  count: '3 TASKS',
                ),
                const SizedBox(height: 12),
                const _TaskCard(
                  title: 'Lab 6: Navigation and routing',
                  courseCode: 'CSE 464',
                  timeLabel: '11:59 PM',
                  highlightTime: true,
                  completed: false,
                  badgeLabel: 'High',
                  badgeBg: AppColors.roseBg,
                  badgeText: AppColors.roseText,
                ),
                const SizedBox(height: 10),
                const _TaskCard(
                  title: 'Read chapter 7: Normalization',
                  courseCode: 'CSE 303',
                  timeLabel: '6:00 PM',
                  highlightTime: false,
                  completed: false,
                  badgeLabel: 'Medium',
                  badgeBg: AppColors.amberBg,
                  badgeText: AppColors.amberText,
                ),
                const SizedBox(height: 10),
                const _TaskCard(
                  title: 'Submit quiz 3 reflection',
                  courseCode: 'MAT 212',
                  timeLabel: '2:00 PM',
                  highlightTime: false,
                  completed: true,
                  badgeLabel: 'Low',
                  badgeBg: AppColors.emeraldBg,
                  badgeText: AppColors.emeraldText,
                ),
                const SizedBox(height: 22),
                _buildGroupHeader(
                  label: 'TOMORROW · SAT, 14 NOV',
                  count: '2 TASKS',
                ),
                const SizedBox(height: 12),
                const _TaskCard(
                  title: 'ER diagram for library system',
                  courseCode: 'CSE 303',
                  timeLabel: '5:00 PM',
                  highlightTime: false,
                  completed: false,
                  badgeLabel: 'Medium',
                  badgeBg: AppColors.amberBg,
                  badgeText: AppColors.amberText,
                ),
                const SizedBox(height: 10),
                const _TaskCard(
                  title: 'Watch lecture 9',
                  courseCode: 'CSE 464',
                  timeLabel: '8:00 PM',
                  highlightTime: false,
                  completed: false,
                  badgeLabel: 'Low',
                  badgeBg: AppColors.emeraldBg,
                  badgeText: AppColors.emeraldText,
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 18,
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x452563EB),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: appCardDecoration(radius: 14),
      child: const Row(
        children: [
          Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Search tasks, courses...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupHeader({required String label, required String count}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          count,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
            color: AppColors.primaryBlue,
          ),
        ),
      ],
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.title,
    required this.courseCode,
    required this.timeLabel,
    required this.highlightTime,
    required this.completed,
    required this.badgeLabel,
    required this.badgeBg,
    required this.badgeText,
  });

  final String title;
  final String courseCode;
  final String timeLabel;
  final bool highlightTime;
  final bool completed;
  final String badgeLabel;
  final Color badgeBg;
  final Color badgeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: appCardDecoration(radius: 16),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: completed ? AppColors.primaryBlue : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: completed
                  ? null
                  : Border.all(color: AppColors.checkboxBorder, width: 1.6),
            ),
            child: completed
                ? const Icon(Icons.check_rounded, size: 15, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: completed
                        ? AppColors.textMuted
                        : AppColors.textPrimary,
                    decoration: completed ? TextDecoration.lineThrough : null,
                    decorationColor: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 3),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                    children: [
                      TextSpan(text: '$courseCode · '),
                      TextSpan(
                        text: timeLabel,
                        style: TextStyle(
                          color: highlightTime
                              ? AppColors.dueTimeRed
                              : AppColors.textSecondary,
                          fontWeight: highlightTime
                              ? FontWeight.w500
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PriorityBadge(
            label: badgeLabel,
            backgroundColor: badgeBg,
            textColor: badgeText,
          ),
        ],
      ),
    );
  }
}
