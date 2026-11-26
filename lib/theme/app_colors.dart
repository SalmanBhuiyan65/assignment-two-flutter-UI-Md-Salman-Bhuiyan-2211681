import 'package:material_ui/material_ui.dart';

/// Color tokens sampled directly from the Figma reference screens.
abstract final class AppColors {
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFF1F5F9);

  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color primaryBlueDark = Color(0xFF1D4ED8);
  static const Color primaryBlueSoft = Color(0xFFDBEAFE);
  static const Color primaryBlueTint = Color(0xFFEFF6FF);
  static const Color avatarLight = Color(0xFF5296F7);
  static const Color avatarDark = Color(0xFF3676EF);

  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color checkboxBorder = Color(0xFFCBD5E1);

  static const Color rose = Color(0xFFF43F5E);
  static const Color roseText = Color(0xFFE11D48);
  static const Color roseBg = Color(0xFFFFE4E6);
  static const Color dueTimeRed = Color(0xFFDC2626);

  static const Color amber = Color(0xFFF59E0B);
  static const Color amberText = Color(0xFFB45309);
  static const Color amberIcon = Color(0xFFD97706);
  static const Color amberBg = Color(0xFFFEF3C7);

  static const Color emerald = Color(0xFF10B981);
  static const Color emeraldText = Color(0xFF059669);
  static const Color emeraldBg = Color(0xFFD1FAE5);
  static const Color emeraldCardBg = Color(0xFFECFDF5);
}

/// Shared card decoration matching the Figma white cards.
BoxDecoration appCardDecoration({double radius = 16}) {
  return BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: AppColors.border, width: 1),
    boxShadow: const [
      BoxShadow(
        color: Color(0x080F172A),
        blurRadius: 10,
        offset: Offset(0, 2),
      ),
    ],
  );
}

/// Circular gradient avatar displaying the student's initials.
class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({
    super.key,
    required this.initials,
    required this.size,
    required this.fontSize,
  });

  final String initials;
  final double size;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.avatarLight, AppColors.avatarDark],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

/// Outlined circular/rounded header icon button used in top bars.
class HeaderIconButton extends StatelessWidget {
  const HeaderIconButton({
    super.key,
    required this.icon,
    this.showNotificationDot = false,
  });

  final IconData icon;
  final bool showNotificationDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(icon, size: 20, color: AppColors.textPrimary),
          if (showNotificationDot)
            Positioned(
              top: 10,
              right: 11,
              child: Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: AppColors.dueTimeRed,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surface, width: 1.2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Priority badge pill (High / Medium / Low) used on Home and Tasks screens.
class PriorityBadge extends StatelessWidget {
  const PriorityBadge({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Rounded horizontal progress bar with configurable track and fill colors.
class RoundedProgressBar extends StatelessWidget {
  const RoundedProgressBar({
    super.key,
    required this.progress,
    required this.fillColor,
    this.trackColor = AppColors.border,
    this.height = 6,
  });

  final double progress;
  final Color fillColor;
  final Color trackColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          children: [
            Container(color: trackColor),
            FractionallySizedBox(
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(height / 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
