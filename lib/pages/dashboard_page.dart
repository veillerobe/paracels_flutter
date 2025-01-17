import 'package:flutter/material.dart';
import 'package:paracels/pages/widgets/hospital_activity_card.dart';
import 'package:paracels/pages/widgets/occupancy_rate.dart';
import 'package:paracels/pages/widgets/para_calendar.dart';
import 'package:paracels/pages/widgets/para_timeline.dart';
import 'package:paracels/pages/widgets/patient_age_chart.dart';
import 'package:paracels/pages/widgets/patient_overview.dart';
import 'package:paracels/pages/widgets/stat_card.dart';
import 'package:paracels/themes/para_colors.dart';
import 'package:paracels/themes/para_sizes.dart';
import 'package:paracels/themes/para_text_styles.dart';
import 'package:paracels/widgets/para_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ParaPage(
      body: ColoredBox(
        color: ParaColors.backgroundPage,
        child: ListView(
          padding: const EdgeInsets.all(ParaSizes.spacing24),
          children: [
            Text(
              "Get a comprehensive overview of your healthcare organization's"
              '\n performance and patient care metrics!',
              style: ParaTextStyles.body1Secondary,
            ),
            const DashboardGap(),
            const Row(
              children: [
                StatCard(
                  value: '30 min',
                  label: "Average patient's service time",
                  percentage: 2,
                ),
                DashboardGap(),
                StatCard(
                  value: '15 min',
                  label: "Average patient's wait time",
                  percentage: 10,
                ),
                DashboardGap(),
                StatCard(
                  value: '16 per',
                  label: 'New Patients',
                  percentage: -20,
                ),
                DashboardGap(),
                StatCard(
                  value: '101 per',
                  label: 'Visits',
                  percentage: 25,
                ),
              ],
            ),
            const DashboardGap(),
            const IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: ParaCalendar(),
                  ),
                  DashboardGap(),
                  // Timeline
                  Expanded(
                    flex: 7,
                    child: ParaTimeline(),
                  ),
                ],
              ),
            ),
            const DashboardGap(),
            const IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: OccupancyRate(),
                  ),
                  DashboardGap(),
                  Expanded(
                    flex: 3,
                    child: HospitalActivityCard(),
                  ),
                ],
              ),
            ),
            const DashboardGap(),
            const IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: PatientOverview(),
                  ),
                  DashboardGap(),
                  Expanded(
                    flex: 2,
                    child: PatientAgeChart(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardGap extends StatelessWidget {
  const DashboardGap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: ParaSizes.spacing16,
      height: ParaSizes.spacing16,
    );
  }
}
