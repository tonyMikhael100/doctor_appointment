import 'package:doctor_appointment/features/home/data/models/doctor_specillization_model.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/doctor_speciallity_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  final DoctorSpecializationModel doctorSpecializationModel;
  const DoctorSpecialityListView({
    super.key,
    required this.doctorSpecializationModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: doctorSpecializationModel.data.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 80.w,
            child: DoctorSpecillityListViewItem(
              doctorModel: doctorSpecializationModel.data[index].doctors[0],
            ),
          );
        },
      ),
    );
  }
}
