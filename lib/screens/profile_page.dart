import 'package:material_ui/material_ui.dart';

import '../data/student_profile.dart';
import '../theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                HeaderIconButton(icon: Icons.settings_outlined),
              ],
            ),
            const SizedBox(height: 10),
            const Center(
              child: Column(
                children: [
                  InitialsAvatar(
                    initials: StudentInfo.initials,
                    size: 70,
                    fontSize: 24,
                  ),
                  SizedBox(height: 10),
                  Text(
                    StudentInfo.fullName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    StudentInfo.studentId,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Personal details',
              style: TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: appCardDecoration(radius: 16),
              child: const Column(
                children: [
                  _DetailRow(
                    icon: Icons.badge_outlined,
                    label: 'Student ID',
                    value: StudentInfo.studentId,
                  ),
                  Divider(height: 1, thickness: 1, color: AppColors.divider),
                  _DetailRow(
                    icon: Icons.mail_outline_rounded,
                    label: 'Email',
                    value: StudentInfo.email,
                  ),
                  Divider(height: 1, thickness: 1, color: AppColors.divider),
                  _DetailRow(
                    icon: Icons.phone_outlined,
                    label: 'Phone',
                    value: StudentInfo.phone,
                  ),
                  Divider(height: 1, thickness: 1, color: AppColors.divider),
                  _DetailRow(
                    icon: Icons.menu_book_outlined,
                    label: 'Department',
                    value: StudentInfo.department,
                  ),
                  Divider(height: 1, thickness: 1, color: AppColors.divider),
                  _DetailRow(
                    icon: Icons.calendar_today_outlined,
                    label: 'Semester',
                    value: StudentInfo.semester,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Preferences',
              style: TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: appCardDecoration(radius: 16),
              child: const Column(
                children: [
                  _PreferenceRow(
                    icon: Icons.notifications_none_rounded,
                    label: 'Notifications',
                    trailing: _FigmaToggle(isOn: true),
                  ),
                  Divider(height: 1, thickness: 1, color: AppColors.divider),
                  _PreferenceRow(
                    icon: Icons.access_time_rounded,
                    label: 'Study reminder',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '8:00 PM',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 20,
                          color: AppColors.textMuted,
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1, thickness: 1, color: AppColors.divider),
                  _PreferenceRow(
                    icon: Icons.dark_mode_outlined,
                    label: 'Dark mode',
                    trailing: _FigmaToggle(isOn: false),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 46,
              decoration: appCardDecoration(radius: 14),
              alignment: Alignment.center,
              child: const Text(
                'Log out',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dueTimeRed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RowIconTile extends StatelessWidget {
  const _RowIconTile({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.primaryBlueTint,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(icon, size: 17, color: AppColors.primaryBlue),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      child: Row(
        children: [
          _RowIconTile(icon: icon),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreferenceRow extends StatelessWidget {
  const _PreferenceRow({
    required this.icon,
    required this.label,
    required this.trailing,
  });

  final IconData icon;
  final String label;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      child: Row(
        children: [
          _RowIconTile(icon: icon),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _FigmaToggle extends StatelessWidget {
  const _FigmaToggle({required this.isOn});

  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 26,
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        color: isOn ? AppColors.primaryBlue : AppColors.border,
        borderRadius: BorderRadius.circular(13),
      ),
      alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: 21,
        height: 21,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x1F0F172A),
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
      ),
    );
  }
}
