import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/bloc/tafsir_surah/tafsir_surah_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CardTafsir extends StatelessWidget {
  const CardTafsir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TafsirSurahBloc, TafsirSurahState>(
      builder: (context, state) {
        if (state is TafsirSurahLoaded) {
          return Stack(
            children: [
              Container(
                height: 265,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Color(0xFF9055FF),
                        Color(0xFFDF98FA),
                      ]),
                ),
              ),
              Positioned(
                bottom: -16,
                right: 0,
                child: Image.asset(
                  AppImages.backgroundDetail,
                  height: 198,
                  width: 350,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Column(
                  children: [
                    Text(
                      state.model.namaLatin!,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      )),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      state.model.arti!,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      )),
                    ),
                    Divider(
                      thickness: 1,
                      height: 32,
                      indent: 50,
                      endIndent: 50,
                      color: AppColors.white.withOpacity(0.35),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.model.tempatTurun!.toUpperCase(),
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          )),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 4,
                          width: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.white.withOpacity(0.35),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${state.model.jumlahAyat} Ayat',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        }
        return _shimmer();
      },
    );
  }

  Widget _shimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const SizedBox(height: 265),
      ),
    );
  }
}
