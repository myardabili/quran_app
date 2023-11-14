import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/widgets/surah_tab.dart';
import 'package:quran_app/presentations/widgets/tafsir_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: _greeting(),
                  ),
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: TabBar(
                          unselectedLabelColor: AppColors.grey,
                          indicatorWeight: 3,
                          tabs: [
                            Text(
                              'Surah',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                            Text(
                              'Tafsir',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ],
                        )),
                  ),
                ];
              },
              body: const TabBarView(
                children: [
                  SurahTab(),
                  TafsirTab(),
                ],
              )),
        ),
      ),
    );
  }

  Widget _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Asslamualaikum',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            fontSize: 18,
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          )),
        ),
        const SizedBox(height: 4),
        Text(
          'Muhammad Yusuf',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 24,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        _lastRead(),
      ],
    );
  }

  Widget _lastRead() {
    return Stack(
      children: [
        Image.asset(
          AppImages.backgroundHome,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 19, bottom: 19, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppImages.iconRead,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Last Read',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Al-Fatihah',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Ayat No: 1',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppImages.iconMenu,
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(width: 24),
          Text(
            'Quran App',
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
    );
  }
}
