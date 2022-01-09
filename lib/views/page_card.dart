import 'package:atc_assessment_test/models/trainings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageCard extends StatelessWidget {
  const PageCard({Key? key, this.trainings}) : super(key: key);
  final Trainings? trainings;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("${trainings!.trainingBanner}/600"))),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    trainings!.trainingTitle!,
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    trainings!.trainingLocation! +
                        ' ' +
                        trainings!.trainingDate!,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        trainings!.oldPrice!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        trainings!.newPrice!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                      const Expanded(
                          child: SizedBox(
                        width: 30,
                      )),
                      GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "View Details",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                            size: 14,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
