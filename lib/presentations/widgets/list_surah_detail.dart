import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/bloc/detail_surah/detail_surah_bloc.dart';
import 'package:quran_app/presentations/widgets/shimmer_widget.dart';

class ListSurahDetail extends StatelessWidget {
  const ListSurahDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailSurahBloc, DetailSurahState>(
      builder: (context, state) {
        if (state is DetailSurahLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 32),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                height: 32,
                color: AppColors.grey.withOpacity(0.35),
              );
            },
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    height: 47,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 27,
                              width: 27,
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            SizedBox(
                              height: 27,
                              width: 27,
                              child: Center(
                                child: Text(
                                  state.model.ayat![index].nomor!.toString(),
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Image.asset(
                          AppImages.iconShare,
                          height: 24,
                          width: 24,
                          color: AppColors.secondary,
                        ),
                        const SizedBox(width: 16),
                        Image.asset(
                          AppImages.iconPlay,
                          height: 24,
                          width: 24,
                          color: AppColors.secondary,
                        ),
                        const SizedBox(width: 16),
                        Image.asset(
                          AppImages.iconBookmark,
                          height: 24,
                          width: 24,
                          color: AppColors.secondary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      state.model.ayat![index].ar!,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.amiri(
                          textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      )),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.model.ayat![index].tr!,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    )),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.model.ayat![index].idn!,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    )),
                  ),
                ],
              );
            },
            itemCount: state.model.ayat!.length,
          );
        }
        return const ShimmerWidget();
      },
    );
  }
}
