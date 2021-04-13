import 'package:flutter/material.dart';
import 'package:flutter_front/controllers/controller_list.dart';
import 'package:flutter_front/util/enum_device_size.dart';
import 'package:flutter_front/widgets/atoms/button/atom_list_filter_button.dart';
import 'package:flutter_front/widgets/atoms/button/atom_list_create_button.dart';
import 'package:flutter_front/widgets/atoms/input/atom_select_input.dart';
import 'package:get/get.dart';

class ListSearchInput extends StatelessWidget {
  final DeviceSize size;

  ListSearchInput({
    this.size = DeviceSize.normal,
  });

  final TextEditingController searchController = new TextEditingController();
  final ListController listController = Get.find();

  @override
  Widget build(BuildContext context) {
    switch (size) {
      case DeviceSize.tiny:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: GetBuilder<ListController>(builder: (_) {
                    return SelectInput(
                      onSelect: (int index) {
                        listController.changeSubjectIdFilter(index);
                      },
                      inputName: "Matéria",
                      options: _.subjects,
                      jsonKey: "name",
                      selectedIndex: _.subjectIdFilter,
                    );
                  }),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListFilterButton(
                    onTap: () {
                      listController.getCourses();
                    },
                  ),
                  ListCreateButton(
                    onTap: () {
                      Get.toNamed('/create')?.then((value) {
                        listController.getCourses();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return Row(
          children: [
            Expanded(
              child: GetBuilder<ListController>(builder: (_) {
                return SelectInput(
                  onSelect: (int index) {
                    listController.changeSubjectIdFilter(index);
                  },
                  inputName: "Matéria",
                  options: _.subjects,
                  jsonKey: "name",
                  selectedIndex: _.subjectIdFilter,
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: ListFilterButton(
                onTap: () {
                  listController.getCourses();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: ListCreateButton(
                onTap: () {
                  Get.toNamed('/create')?.then((value) {
                    listController.getCourses();
                  });
                },
              ),
            ),
          ],
        );
    }
  }
}
