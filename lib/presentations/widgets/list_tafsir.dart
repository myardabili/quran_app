import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/bloc/tafsir_surah/tafsir_surah_bloc.dart';

class ListTafsir extends StatelessWidget {
  const ListTafsir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TafsirSurahBloc, TafsirSurahState>(
      builder: (context, state) {
        if (state is TafsirSurahLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 32),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      _horizontalLine(),
                      Stack(
                        children: [
                          Image.asset(
                            AppImages.iconNumber,
                            height: 36,
                            width: 36,
                          ),
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: Center(
                              child: Text(
                                state.model.tafsir![index].ayat.toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _horizontalLine(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.model.tafsir![index].tafsir!,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    )),
                  ),
                ],
              );
            },
            itemCount: state.model.tafsir!.length,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Padding _horizontalLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 1.0,
        width: 130.0,
        color: AppColors.black,
      ),
    );
  }
}
