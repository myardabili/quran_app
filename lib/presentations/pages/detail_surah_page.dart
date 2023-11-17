// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/bloc/detail_surah/detail_surah_bloc.dart';
import 'package:quran_app/presentations/widgets/card_detail.dart';
import 'package:quran_app/presentations/widgets/list_surah_detail.dart';

class DetailSurahPage extends StatefulWidget {
  final int number;
  const DetailSurahPage({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  State<DetailSurahPage> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurahPage> {
  @override
  void initState() {
    context
        .read<DetailSurahBloc>()
        .add(GetDetailSurahEvent(number: widget.number));
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
            BlocBuilder<DetailSurahBloc, DetailSurahState>(
              builder: (context, state) {
                if (state is DetailSurahLoaded) {
                  return Text(
                    state.model.namaLatin ?? '',
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
                child: CardDetail(),
              ),
            ];
          },
          body: const ListSurahDetail(),
        ),
      ),
    );
  }
}
