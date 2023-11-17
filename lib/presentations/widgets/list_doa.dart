import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/common/constans/colors.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/bloc/doa/doa_bloc.dart';
import 'package:quran_app/presentations/widgets/shimmer_widget.dart';

class ListDoa extends StatefulWidget {
  const ListDoa({
    super.key,
  });

  @override
  State<ListDoa> createState() => _ListDoaState();
}

class _ListDoaState extends State<ListDoa> {
  @override
  void initState() {
    context.read<DoaBloc>().add(GetDoaEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoaBloc, DoaState>(
      builder: (context, state) {
        if (state is DoaLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 24.0),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              return Card(
                child: ExpansionTile(
                    leading: Stack(
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
                              state.model[index].id!,
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
                    title: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        state.model[index].doa!,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        )),
                      ),
                    ),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              state.model[index].ayat!,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.amiri(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              )),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.model[index].latin!,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            )),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.model[index].artinya!,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppColors.black,
                            )),
                          ),
                        ],
                      ),
                    ]),
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
