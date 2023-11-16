// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/bloc/tafsir_surah/tafsir_surah_bloc.dart';
import 'package:quran_app/presentations/widgets/card_tafsir.dart';
import 'package:quran_app/presentations/widgets/list_tafsir.dart';

class TafsirPage extends StatefulWidget {
  final int number;
  const TafsirPage({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  State<TafsirPage> createState() => _TafsirPageState();
}

class _TafsirPageState extends State<TafsirPage> {
  @override
  void initState() {
    context
        .read<TafsirSurahBloc>()
        .add(GetTafsirSurahEvent(number: widget.number));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                AppImages.iconBack,
                height: 24,
                width: 24,
              ),
            ),
            const SizedBox(width: 24),
            BlocBuilder<TafsirSurahBloc, TafsirSurahState>(
              builder: (context, state) {
                if (state is TafsirSurahLoaded) {
                  return Text(
                    state.model.namaLatin!,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                  );
                }
                return Text(
                  'Nama Surah',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
                );
              },
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppImages.iconSearch,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverToBoxAdapter(
                child: CardTafsir(),
              ),
            ];
          },
          body: const ListTafsir(),
        ),
      ),
    );
  }
}
