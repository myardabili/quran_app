import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/bloc/surah/surah_bloc.dart';
import 'package:quran_app/presentations/pages/tafsir_page.dart';
import 'package:quran_app/presentations/widgets/shimmer_widget.dart';

class TafsirTab extends StatefulWidget {
  const TafsirTab({
    super.key,
  });

  @override
  State<TafsirTab> createState() => _TafsirTabState();
}

class _TafsirTabState extends State<TafsirTab> {
  @override
  void initState() {
    context.read<SurahBloc>().add(GetSurahEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahBloc, SurahState>(
      builder: (context, state) {
        if (state is SurahLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 24.0),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                height: 32,
                color: AppColors.grey.withOpacity(0.35),
              );
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TafsirPage(number: state.model[index].nomor!);
                  }));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                              state.model[index].nomor.toString(),
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
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.model[index].namaLatin!,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          )),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(state.model[index].tempatTurun!.toUpperCase()),
                            const SizedBox(width: 5),
                            Container(
                              height: 4,
                              width: 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.grey.withOpacity(0.35),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                                '${state.model[index].jumlahAyat.toString()} Ayat'),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      state.model[index].nama!,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      )),
                    ),
                  ],
                ),
              );
            },
            itemCount: state.model.length,
          );
        }
        return const ShimmerWidget();
      },
    );
  }
}
