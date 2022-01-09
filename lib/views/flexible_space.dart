import 'package:atc_assessment_test/utils/buttons.dart';
import 'package:atc_assessment_test/views/page_section.dart';
import 'package:flutter/material.dart';

class FlexibleSpaces extends StatelessWidget {
  const FlexibleSpaces({Key? key, this.page}) : super(key: key);
  final PageController? page;
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: EdgeInsets.zero,
      collapseMode: CollapseMode.pin,
      background: Container(
        width: MediaQuery.of(context).size.width,
        color: Constants.myColor,
        // height: 100,
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 100, 0, 0),
                    child: Text(
                      "Highlights",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  Container(
                    color: Constants.myColor,
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    // child:
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    // child:
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                  ),
                  child: Center(child: PageSection(page: page)),
                ))
          ],
        ),
      ),
    );
  }
}
