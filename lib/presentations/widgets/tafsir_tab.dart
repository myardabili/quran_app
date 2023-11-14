import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';

class TafsirTab extends StatelessWidget {
  const TafsirTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
            height: 32,
            color: AppColors.grey.withOpacity(0.35),
          );
        },
        itemBuilder: (context, index) {
          return Row(
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
                        '1',
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Al Fatihah',
                  ),
                  SizedBox(height: 4),
                  Text('Makkah')
                ],
              ),
              const Spacer(),
              const Text('Arabnya'),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}
