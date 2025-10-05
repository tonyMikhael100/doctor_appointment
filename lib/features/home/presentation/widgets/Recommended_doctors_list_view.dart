import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/core/theming/app_text_sytles.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_specillization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedDoctorsListView extends StatelessWidget {
  final List<Doctor> doctorsList;
  const RecommendedDoctorsListView({super.key, required this.doctorsList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctorsList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 24.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: double.infinity,
          height: 130.h,
          child: Row(
            children: [
              Container(
                width: 130.w,
                height: 130.h,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/doctor.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorsList[index].name,
                      style: AppTextSytles.font16Black700Weight,
                    ),
                    verticalSpace(8),
                    Text(
                      doctorsList[index].specialization.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppTextSytles.font12Grey500Weight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
