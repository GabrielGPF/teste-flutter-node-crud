import 'package:flutter/material.dart';
import 'package:flutter_front/controllers/controller_list.dart';
import 'package:flutter_front/util/enum_device_size.dart';
import 'package:flutter_front/widgets/molecules/molecule_search_list.dart';
import 'package:flutter_front/widgets/organisms/organism_list_course_table.dart';
import 'package:flutter_front/widgets/organisms/organism_list_header.dart';
import 'package:get/get.dart';

class PageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListController listController = Get.put(ListController());

    double shortestSide = MediaQuery.of(context).size.shortestSide;
    double width = MediaQuery.of(context).size.width;
    bool isMobile = shortestSide < 600;

    if (isMobile) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ListHeader(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                left: 18.0,
                right: 18.0,
              ),
              child: ListSearchInput(
                size: DeviceSize.tiny,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                  left: 18.0,
                  right: 18.0,
                  bottom: 18.0,
                ),
                child: ListCoursesTable(
                  size: DeviceSize.tiny,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (width < 940) {
      return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: ListHeader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 38.0,
                      left: 38.0,
                      right: 38.0,
                    ),
                    child: ListSearchInput(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 38.0,
                        left: 38.0,
                        right: 38.0,
                        bottom: 38.0,
                      ),
                      child: ListCoursesTable(
                        size: DeviceSize.small,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: Container(
              color: Colors.white,
              constraints: BoxConstraints(
                maxWidth: 1500,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: ListHeader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 38.0,
                      left: 38.0,
                      right: 38.0,
                    ),
                    child: ListSearchInput(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 38.0,
                        left: 38.0,
                        right: 38.0,
                        bottom: 38.0,
                      ),
                      child: ListCoursesTable(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
