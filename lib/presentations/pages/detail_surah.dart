import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';

class DetailSurah extends StatefulWidget {
  const DetailSurah({super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
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
            Text(
              'Nama Surah',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 265,
                  width: 327,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                  ),
                  child: Image.asset(
                    AppImages.backgroundDetail,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
