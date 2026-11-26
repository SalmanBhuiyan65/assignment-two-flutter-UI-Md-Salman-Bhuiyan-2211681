import 'package:material_ui/material_ui.dart';

import '../data/student_profile.dart';
import '../theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String day, String date, bool selected})> _weekDays = [
    (day: 'Mon', date: '9', selected: false),
    (day: 'Tue', date: '10', selected: false),
    (day: 'Wed', date: '11', selected: false),
    (day: 'Thu', date: '12', selected: false),
    (day: 'Fri', date: '13', selected: true),
    (day: 'Sat', date: '14', selected: false),
    (day: 'Sun', date: '15', selected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildCalendarStrip(),
            const SizedBox(height: 20),
            _buildStudyGoalCard(),
            const SizedBox(height: 24),
            _buildSectionHeader(title: 'Due soon', actionLabel: 'See all'),
            const SizedBox(height: 12),
            const _DueSoonCard(
              title: 'Lab 6: Navigation and routing',
              subtitle: 'CSE 464 · Today, 11:59 PM',
              barColor: AppColors.rose,
              badgeLabel: 'High',
              badgeBg: AppColors.roseBg,
              badgeText: AppColors.roseText,
            ),
            const SizedBox(height: 10),
            const _DueSoonCard(
              title: 'ER diagram for library system',
              subtitle: 'CSE 303 · Tomorrow, 5:00 PM',
              barColor: AppColors.amber,
              badgeLabel: 'Medium',
              badgeBg: AppColors.amberBg,
              badgeText: AppColors.amberText,
            ),
            const SizedBox(height: 24),
            _buildSectionHeader(
              title: "Today's classes",
              actionLabel: 'Timetable',
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: _ClassCard(
                    time: '10:00 AM',
                    courseCode: 'CSE 464',
                    room: 'Room 7012',
                    backgroundColor: AppColors.primaryBlueTint,
                    timeColor: AppColors.primaryBlue,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ClassCard(
                    time: '1:30 PM',
                    courseCode: 'MAT 212',
                    room: 'Room 3021',
                    backgroundColor: AppColors.emeraldCardBg,
                    timeColor: AppColors.emeraldText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const InitialsAvatar(
          initials: StudentInfo.initials,
          size: 46,
          fontSize: 16,
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 1),
              Text(
                StudentInfo.fullName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        const HeaderIconButton(
          icon: Icons.notifications_none_rounded,
          showNotificationDot: true,
        ),
      ],
    );
  }

  Widget _buildCalendarStrip() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _weekDays.map((item) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: item.selected
                ? BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x382563EB),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  )
                : null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.day,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: item.selected
                        ? Colors.white.withValues(alpha: 0.9)
                        : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.date,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: item.selected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStudyGoalCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2563EB),
              Color(0xFF235FE8),
              Color(0xFF1D4ED8),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x302563EB),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -28,
              top: -36,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
            ),
            Positioned(
              right: -12,
              bottom: -62,
              child: Container(
                width: 126,
                height: 126,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.07),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TODAY'S STUDY GOAL",
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.9,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text(
                        '2h 15m',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'of 3h',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  RoundedProgressBar(
                    progress: 0.75,
                    height: 7,
                    fillColor: Colors.white,
                    trackColor: Colors.white.withValues(alpha: 0.25),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '3 tasks due today · 6 day streak',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withValues(alpha: 0.9),
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

  Widget _buildSectionHeader({
    required String title,
    required String actionLabel,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          actionLabel,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBlue,
          ),
        ),
      ],
    );
  }
}

class _DueSoonCard extends StatelessWidget {
  const _DueSoonCard({
    required this.title,
    required this.subtitle,
    required this.barColor,
    required this.badgeLabel,
    required this.badgeBg,
    required this.badgeText,
  });

  final String title;
  final String subtitle;
  final Color barColor;
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
            width: 3.5,
            height: 36,
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
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

class _ClassCard extends StatelessWidget {
  const _ClassCard({
    required this.time,
    required this.courseCode,
    required this.room,
    required this.backgroundColor,
    required this.timeColor,
  });

  final String time;
  final String courseCode;
  final String room;
  final Color backgroundColor;
  final Color timeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: timeColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            courseCode,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            room,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
