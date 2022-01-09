import 'package:atc_assessment_test/models/trainings.dart';
import 'package:atc_assessment_test/utils/buttons.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, this.trainings}) : super(key: key);
  final Trainings? trainings;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.24,
      child: Card(
          child: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.24,
                child: Column(
                  children: [
                    Flexible(
                        child: Text(
                      trainings!.trainingDate!,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        trainings!.trainingTime!,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w100),
                      ),
                    ),
                    const Expanded(
                        child: SizedBox(
                      height: 14,
                    )),
                    Text(
                      trainings!.trainingLocation!,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: VerticalDivider(
                  width: 0.5,
                  color: Colors.black45,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trainings!.tag!,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    ),
                    Text(
                      trainings!.trainingTitle!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(trainings!.trainerImage!),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundImage:
                                      NetworkImage(trainings!.companyImage!),
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Keynote Speaker"),
                                Text(trainings!.trainerName!),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Enroll Now",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Constants.myColor)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
