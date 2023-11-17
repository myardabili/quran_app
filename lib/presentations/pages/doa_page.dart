import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/widgets/list_doa.dart';

class DoaPage extends StatelessWidget {
  const DoaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              'Doa Harian',
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  child: _card(),
                ),
              ),
            ];
          },
          body: const ListDoa(),
        ),
      ),
    );
  }
}

Widget _card() {
  return Stack(
    children: [
      Container(
        height: 150,
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
        top: 20,
        left: 30,
        child: Row(
          children: [
            Image.asset(
              AppImages.muslimPrayer,
              height: 100,
              width: 100,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Kumpulan Doa',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  )),
                ),
                Text(
                  'Sehari-hari',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
      // Positioned(
      //   right: 30,
      //   top: 14,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text(
      //         'Kumpulan Doa',
      //         style: GoogleFonts.poppins(
      //             textStyle: const TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //           color: AppColors.white,
      //         )),
      //       ),
      //       Text(
      //         'Sehari-hari',
      //         style: GoogleFonts.poppins(
      //             textStyle: const TextStyle(
      //           fontSize: 26,
      //           fontWeight: FontWeight.bold,
      //           color: AppColors.white,
      //         )),
      //       ),
      //     ],
      //   ),
      // ),
    ],
  );
}
