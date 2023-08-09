import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/MyFiles.dart';
import '../../../constants.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        // [Mobile]
        // crossAxisCount: _size.width < 650 ? 2 : 4
        // childAspectRatio: _size.width < 650 ? 1.3 : 1,
        // [Desktop]
        // childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,

        Responsive( // we have made this whole portion of 'My Files' which is a grid view, customized and adaptable on different screen sizes using 'Responsive Custom Widget'.

          // 'FileInfoCardGridView' class has created the whole gridView for the 'MyFiles' in which 4 Grid Items are placed in a row with crossAxisCount == 4, in screens whose width is greater than 650 otherwise crossAxisCount == 2

            mobile: FileInfoCardGridView(
              crossAxisCount: _size.width < 650 ? 2 : 4,// for the adaptability of this 'My Files' portion in DashboardScreen we have set the crossAxisCount == 2 for devices whose screen width is less than 650
              childAspectRatio: _size.width < 650 ? 1.3 : 1, // if the screen width is less than 650 so to reduce the size of grid we make 'aspectRatio == 1.3' while if it's not a mobile then we make it '1' which is AspectRatio for a "Square shape"
            ),
            tablet: FileInfoCardGridView(),

            desktop: FileInfoCardGridView()  // This class has created the whole gridView for the 'MyFiles' in which 4 Grid Items are placed in a row'

    )


      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    // crossAxisCount and childAspectRatio, both can be passed here dynamically as they are optional arguments/parameters
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
