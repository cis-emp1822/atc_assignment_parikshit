import 'dart:developer';

import 'package:atc_assessment_test/cubits/trainings/trainings_cubit.dart';
import 'package:atc_assessment_test/cubits/trainings_banners/trainings_cubit.dart';
import 'package:atc_assessment_test/repositories/list_of_filters.dart';
import 'package:atc_assessment_test/utils/buttons.dart';
import 'package:atc_assessment_test/utils/sliver_app_bar_delegate.dart';
import 'package:atc_assessment_test/views/flexible_space.dart';
import 'package:atc_assessment_test/views/home_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scafKey = GlobalKey<ScaffoldState>();
  final ScrollController _scroll = ScrollController(initialScrollOffset: 0);
  final PageController _page = PageController();
  double width = 0;
  int filterIndex = 0;
  int filterType = 0;
  Map<String, List<String>>? filters = {};
  @override
  void didChangeDependencies() {
    _scroll.addListener(() {
      if (_scroll.hasClients) {
        double tempWidth = _scroll.offset > 90 ? 90 : _scroll.offset;

        if (tempWidth != width) {
          setState(() {
            width = tempWidth;
            log(width.toString());
          });
        }
      }
    });
    context.read<TrainingsCubit>().fetchTrainings(context);
    context.read<TrainingsBannersCubit>().fetchTrainings(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scroll.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafKey,
      drawer: const Drawer(),
      body: CustomScrollView(controller: _scroll, slivers: [
        SliverAppBar(
          pinned: true,
          leading: const SizedBox(
            height: 0,
            width: 0,
          ),
          elevation: 0,
          backgroundColor: Constants.myColor,
          leadingWidth: 0,
          flexibleSpace: FlexibleSpaces(page: _page),
          expandedHeight: MediaQuery.of(context).size.height * 0.36,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
              ),
              const Text(
                "Trainings",
                style: TextStyle(fontSize: 29),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => _scafKey.currentState!.openDrawer(),
                icon: const Icon(Icons.menu))
          ],
        ),
        SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
                minHeight: 60,
                maxHeight: 60,
                child: Container(
                  color: width >= 70 ? Constants.myColor : Colors.white,
                  child: ListView.builder(
                      itemCount:
                          ((width + 10) ~/ 10) > 5 ? 5 : ((width + 10) ~/ 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 4),
                          child: OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    index == filterIndex
                                        ? Colors.white
                                        : Colors.black38)),
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.slidersH,
                                  size: 12,
                                  color: Constants.blackishColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  filterTags[index].toString(),
                                  style: const TextStyle(
                                    color: Constants.blackishColor,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () => onFilterTap(context, index),
                          ),
                        );
                      }),
                ))),
        BlocBuilder<TrainingsCubit, TrainingsState>(
          builder: (context, state) {
            if (state is TrainingsLoading) {
              return const SliverToBoxAdapter(
                  child: CupertinoActivityIndicator());
            }
            if (state is TrainingsError) {
              return SliverToBoxAdapter(
                  child: Text("Error ${state.errorMessage}"));
            } else if (state is TrainingsLoaded) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => HomeCard(
                            trainings: state.trainings![index],
                          ),
                      childCount: state.trainings!.length));
            } else {
              return const SizedBox(
                height: 0,
              );
            }
          },
        ),
      ]),
    );
  }

  onFilterTap(BuildContext context, int index) async {
    setState(() {
      filterIndex = index;
    });
    if (filterIndex == 0) {
      filters!.removeWhere((key, value) => key == 'training_tag');
      showModalBottomSheet(
          context: context,
          builder: (context) => StatefulBuilder(builder: (context, setState) {
                String keyTitle = filterType == 0
                    ? 'training_location'
                    : filterType == 1
                        ? 'training_title'
                        : 'trainer_name';
                List<String> listOfFilter = filterType == 0
                    ? filterLocations
                    : filterType == 1
                        ? filterTraining
                        : filterTrainers;
                return Row(
                  children: [
                    SizedBox(
                      width: 130,
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text(
                              "Location",
                              style: TextStyle(
                                  color: filterType == 0
                                      ? Colors.blue
                                      : Colors.black),
                            ),
                            onTap: () => setState(() => filterType = 0),
                          ),
                          ListTile(
                            title: Text(
                              "Training Name",
                              style: TextStyle(
                                  color: filterType == 1
                                      ? Colors.blue
                                      : Colors.black),
                            ),
                            onTap: () => setState(() => filterType = 1),
                          ),
                          ListTile(
                            title: Text(
                              "Trainer",
                              style: TextStyle(
                                  color: filterType == 2
                                      ? Colors.blue
                                      : Colors.black),
                            ),
                            onTap: () async {
                              setState(() => filterType = 2);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: listOfFilter.length,
                      itemBuilder: (context, index) => CheckboxListTile(
                        value: filters!.containsKey(keyTitle) &&
                            filters![keyTitle]!.contains(listOfFilter[index]),
                        onChanged: (added) async {
                          if (filters!.containsKey(keyTitle)) {
                            if (added!) {
                              filters![keyTitle]!.add(listOfFilter[index]);
                            } else {
                              filters![keyTitle]!.remove(listOfFilter[index]);
                            }
                          } else {
                            filters![keyTitle] = [listOfFilter[index]];
                          }
                          setState(() {});
                          await Future.delayed(
                              const Duration(milliseconds: 100));
                          Navigator.pop(context);
                          context
                              .read<TrainingsCubit>()
                              .fetchTrainings(context, filters: filters);
                        },
                        title: Text(listOfFilter[index]),
                      ),
                    ))
                  ],
                );
              }));
    } else {
      filters!['training_tag'] = [filterTags[index]];
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 100));
      context.read<TrainingsCubit>().fetchTrainings(context, filters: filters);
    }
  }
}
