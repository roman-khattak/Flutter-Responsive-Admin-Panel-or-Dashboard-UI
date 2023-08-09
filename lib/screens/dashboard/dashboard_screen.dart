import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'components/my_files.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                      SizedBox(height: defaultPadding),
                     if (Responsive.isMobile(context)) StarageDetails(), // show Below the 'Recent Files' only if Mobile otherwise don't show
                    ],
                  ),
                ),

                if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),   // this padding takes extra space in mobile mode so we remove it for mobile but keep for desktop

                // On Mobile we don't want to show it parallel in the dashboard

                if (!Responsive.isMobile(context)) // show it only if the device is not a mobile
                Expanded(
                  flex: 2,
                  child: StarageDetails(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
