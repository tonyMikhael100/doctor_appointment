import 'package:doctor_appointment/core/helpers/spacing_helper.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:doctor_appointment/features/home/data/models/doctor_specillization_model.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/Recommended_doctors_list_view.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/doctor_sepciality_list_view.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/doctor_speciallity_list_view_item.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/doctor_speciallity_row.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/home_app_bar.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/home_doctor_intro.dart';
import 'package:doctor_appointment/features/home/presentation/widgets/recmmended_doctors_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeAppBar(),
                verticalSpace(35),
                HomeDoctorIntro(),
                verticalSpace(16),
                DoctorSpeciallityRow(),
                verticalSpace(8),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loading: () => Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.mainBlue,
                          ),
                        ),
                      ),
                      error: (errorMessage) =>
                          Center(child: Text(errorMessage)),
                      loaded: (doctorSpecializationModel) {
                        return Column(
                          children: [
                            DoctorSpecialityListView(
                              doctorSpecializationModel:
                                  doctorSpecializationModel,
                            ),
                            verticalSpace(24),
                            RecmmendedDoctorsRow(),
                            verticalSpace(16),
                            RecommendedDoctorsListView(
                              doctorsList:
                                  doctorSpecializationModel.data[0].doctors,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
