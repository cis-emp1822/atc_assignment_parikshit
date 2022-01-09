import 'package:atc_assessment_test/cubits/trainings_banners/trainings_cubit.dart';
import 'package:atc_assessment_test/views/page_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageSection extends StatelessWidget {
  const PageSection({Key? key, this.page}) : super(key: key);
  final PageController? page;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 70,
          child: Material(
            color: Colors.black38,
            child: InkWell(
                onTap: () => page!.hasClients
                    ? page!.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut)
                    : null,
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                )),
          ),
        ),
        Expanded(
          child: BlocBuilder<TrainingsBannersCubit, TrainingsBannersState>(
            builder: (context, state) {
              if (state is TrainingsBannersLoading) {
                return const CupertinoActivityIndicator();
              }
              if (state is TrainingsBannersError) {
                return Text("Error ${state.errorMessage}");
              } else if (state is TrainingsBannersLoaded) {
                return PageView.builder(
                    controller: page,
                    itemCount: state.trainings!.length,
                    itemBuilder: (context, index) =>
                        PageCard(trainings: state.trainings![index]));
              } else {
                return const SizedBox(
                  height: 0,
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 70,
          child: Material(
            color: Colors.black38,
            child: InkWell(
                onTap: () => page!.hasClients
                    ? page!.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut)
                    : null,
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );
  }
}
