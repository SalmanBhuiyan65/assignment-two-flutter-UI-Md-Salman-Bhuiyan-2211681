import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Progress',
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
            _buildWeekSelector(),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    icon: Icons.access_time_rounded,
                    iconBg: AppColors.primaryBlueTint,
                    iconColor: AppColors.primaryBlue,
                    value: '9h 21m',
                    label: 'Studied',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _MetricCard(
                    icon: Icons.check_box_outlined,
                    iconBg: AppColors.emeraldBg,
                    iconColor: AppColors.emeraldText,
                    value: '14',
                    label: 'Tasks done',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _MetricCard(
                    icon: Icons.local_fire_department_outlined,
                    iconBg: AppColors.amberBg,
                    iconColor: AppColors.amberIcon,
                    value: '6 days',
                    label: 'Streak',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildWeeklySummaryCard(),
            const SizedBox(height: 22),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'Manage',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const _CourseProgressCard(
              codeNumber: '464',
              tileBg: AppColors.primaryBlueTint,
              accentColor: AppColors.primaryBlue,
              title: 'CSE 464 · Mobile Dev',
              subtitle: 'Next: Lab 6, today',
              percentLabel: '72%',
              progress: 0.72,
            ),
            const SizedBox(height: 10),
            const _CourseProgressCard(
              codeNumber: '303',
              tileBg: AppColors.amberBg,
              accentColor: AppColors.amberIcon,
              barColor: AppColors.amber,
              title: 'CSE 303 · Databases',
              subtitle: 'Next: ER diagram, Sat',
              percentLabel: '58%',
              progress: 0.58,
            ),
            const SizedBox(height: 10),
            const _CourseProgressCard(
              codeNumber: '212',
              tileBg: AppColors.emeraldBg,
              accentColor: AppColors.emeraldText,
              barColor: AppColors.emerald,
              title: 'MAT 212 · Linear Algebra',
              subtitle: 'Next: Problem set 4, Mon',
              percentLabel: '84%',
              progress: 0.84,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekSelector() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: appCardDecoration(radius: 14),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.chevron_left_rounded,
            size: 20,
            color: AppColors.textSecondary,
          ),
          Expanded(
            child: Text(
              'This week · 9 to 15 Nov',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklySummaryCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: appCardDecoration(radius: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'This week',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '78%',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            '9h 21m of 12h goal',
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          const RoundedProgressBar(
            progress: 0.78,
            height: 8,
            fillColor: AppColors.primaryBlue,
            trackColor: AppColors.border,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.emeraldBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.trending_up_rounded,
                  size: 15,
                  color: AppColors.emeraldText,
                ),
                SizedBox(width: 5),
                Text(
                  '+18% vs last week',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.emeraldText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: appCardDecoration(radius: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: iconColor),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseProgressCard extends StatelessWidget {
  const _CourseProgressCard({
    required this.codeNumber,
    required this.tileBg,
    required this.accentColor,
    this.barColor,
    required this.title,
    required this.subtitle,
    required this.percentLabel,
    required this.progress,
  });

  final String codeNumber;
  final Color tileBg;
  final Color accentColor;
  final Color? barColor;
  final String title;
  final String subtitle;
  final String percentLabel;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: appCardDecoration(radius: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: tileBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  codeNumber,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: accentColor,
                  ),
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
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                percentLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: accentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RoundedProgressBar(
            progress: progress,
            height: 6,
            fillColor: barColor ?? accentColor,
            trackColor: AppColors.border,
          ),
        ],
      ),
    );
  }
}
