import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/app_box_decorations.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_text_styles.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: 27.w,
          top: 60.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Information',
              style: AppTextStyles.titleTextStyle,
            ),
            SizedBox(
              height: 41.h,
            ),
            SizedBox(
              width: 334.w,
              height: 493.h,
              child: Text(
                'Praesent ultricies lacus in ligula volutpat feugiat. In hac habitasse platea dictumst. In hac habitasse platea dictumst. Fusce luctus justo eget nisi hendrerit, quis aliquam arcu porta. Cras ultricies, elit sit amet cursus consectetur, risus felis ullamcorper nulla, ut scelerisque sapien lorem non sem. Integer vestibulum ornare ligula, a placerat lectus volutpat ultrices. Aliquam commodo malesuada purus a mollis. Vestibulum pulvinar aliquam libero eu consequat.\n\nCras massa orci, ultrices sed scelerisque id, semper vel neque. Proin a turpis quis nibh cursus hendrerit sit amet vel libero. Nullam sit amet laoreet ante. Mauris sit amet mi vitae arcu dignissim porttitor et in arcu. Nullam eleifend molestie arcu, pretium fermentum orci feugiat eget. Integer dapibus tincidunt ipsum, at rutrum magna rutrum at. Quisque pretium convallis vestibulum.',
                style: AppTextStyles.pageTextStyle,
              ),
            ),
            SizedBox(
              height: 106.h,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 315.w,
                height: 46.h,
                decoration: AppBoxDecorations.blackBoxDecoration,
                alignment: Alignment.center,
                child: Text(
                  'Got it!',
                  style: AppTextStyles.buttonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
