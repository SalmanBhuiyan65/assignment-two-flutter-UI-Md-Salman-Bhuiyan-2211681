import 'package:assignment_two_flutter_ui/data/student_profile.dart';
import 'package:assignment_two_flutter_ui/main.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Renders all 4 pages with student info via PageView bottom nav', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const StudentPlannerApp());
    await tester.pumpAndSettle();

    // Verify PageView exists with NeverScrollableScrollPhysics.
    final pageView = tester.widget<PageView>(find.byType(PageView));
    expect(pageView.physics, isA<NeverScrollableScrollPhysics>());
    expect(pageView.controller, isNotNull);

    // Page 1: Home
    expect(find.text('Good morning,'), findsOneWidget);
    expect(find.text(StudentInfo.fullName), findsOneWidget);
    expect(find.text(StudentInfo.initials), findsOneWidget);
    expect(find.text("TODAY'S STUDY GOAL"), findsOneWidget);
    expect(find.text('Due soon'), findsOneWidget);
    expect(find.text("Today's classes"), findsOneWidget);
    expect(find.text('SN'), findsNothing);
    expect(find.textContaining('['), findsNothing);

    // Horizontal drag should not change page because of NeverScrollableScrollPhysics.
    await tester.drag(find.byType(PageView), const Offset(-300, 0));
    await tester.pumpAndSettle();
    expect(find.text("TODAY'S STUDY GOAL"), findsOneWidget);

    // Navigate to Page 2: Tasks
    await tester.tap(find.text('Tasks').last);
    await tester.pumpAndSettle();
    expect(find.text('Search tasks, courses...'), findsOneWidget);
    expect(find.text('TODAY · FRI, 13 NOV'), findsOneWidget);
    expect(find.text('TOMORROW · SAT, 14 NOV'), findsOneWidget);

    // Navigate to Page 3: Profile
    await tester.tap(find.text('Profile').last);
    await tester.pumpAndSettle();
    expect(find.text(StudentInfo.fullName), findsOneWidget);
    expect(find.text(StudentInfo.initials), findsOneWidget);
    expect(find.text(StudentInfo.studentId), findsNWidgets(2));
    expect(find.text(StudentInfo.email), findsOneWidget);
    expect(find.text(StudentInfo.phone), findsOneWidget);
    expect(find.text(StudentInfo.department), findsOneWidget);
    expect(find.text(StudentInfo.semester), findsOneWidget);
    expect(find.text('SN'), findsNothing);
    expect(find.textContaining('['), findsNothing);

    // Navigate to Page 4: Progress
    await tester.tap(find.text('Progress').last);
    await tester.pumpAndSettle();
    expect(find.text('This week · 9 to 15 Nov'), findsOneWidget);
    expect(find.text('9h 21m'), findsOneWidget);
    expect(find.text('+18% vs last week'), findsOneWidget);
    expect(find.text('CSE 464 · Mobile Dev'), findsOneWidget);
  });
}
