import 'package:flutter/material.dart';
import 'package:flutter_front/controllers/controller_list.dart';
import 'package:flutter_front/util/enum_device_size.dart';
import 'package:flutter_front/widgets/atoms/button/atom_table_delete_button.dart';
import 'package:flutter_front/widgets/atoms/button/atom_table_edit_button.dart';
import 'package:get/get.dart';

class ListCoursesTable extends StatelessWidget {
  final DeviceSize size;

  ListCoursesTable({
    this.size = DeviceSize.normal,
  });

  final ListController listController = Get.find();

  @override
  Widget build(BuildContext context) {
    switch (size) {
      case DeviceSize.tiny:
        return GetBuilder<ListController>(builder: (_) {
          print("_.courses: ${_.courses}");
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text("Matéria"),
                ),
                DataColumn(
                  label: Text("Nome"),
                ),
                DataColumn(
                  label: Text("Edit/Delete"),
                ),
              ],
              rows: _buildRows(_.courses, _.subjects, _.modalities),
            ),
          );
        });
      case DeviceSize.small:
        return GetBuilder<ListController>(builder: (_) {
          print("_.courses: ${_.courses}");
          return DataTable(
            columns: [
              DataColumn(
                label: Text("Matéria"),
              ),
              DataColumn(
                label: Text("Nome"),
              ),
              DataColumn(
                label: Text("Modalidade"),
              ),
              DataColumn(
                label: Text("Edit/Delete"),
              ),
            ],
            rows: _buildRows(_.courses, _.subjects, _.modalities),
          );
        });
      default:
        return GetBuilder<ListController>(builder: (_) {
          print("_.courses: ${_.courses}");
          return DataTable(
            columns: [
              DataColumn(
                label: Text("Matéria"),
              ),
              DataColumn(
                label: Text("Nome"),
              ),
              DataColumn(
                label: Text("Modalidade"),
              ),
              DataColumn(
                label: Text("Livro"),
              ),
              DataColumn(
                label: Text("Hrs"),
              ),
              DataColumn(
                label: Text("Edit"),
              ),
              DataColumn(
                label: Text("Delete"),
              ),
            ],
            rows: _buildRows(_.courses, _.subjects, _.modalities),
          );
        });
    }
  }

  List<DataRow> _buildRows(
    List<dynamic> data,
    List<dynamic> subjects,
    List<dynamic> modalities,
  ) {
    List<DataRow> rows = [];
    print("modalities: $modalities");

    for (int i = 0; i < data.length; i++) {
      rows.add(
        _buildRow(
          "${subjects[data[i]["subject_id"]]["name"]}",
          "${data[i]["name"]}",
          "${modalities[data[i]["modality_id"] - 1]["name"]}",
          "${data[i]["book"]}",
          "${data[i]["workload"]}",
          data[i],
          i,
        ),
      );
    }

    return rows;
  }

  DataRow _buildRow(
    String subject,
    String name,
    String modality,
    String book,
    String workload,
    dynamic data,
    int index,
  ) {
    switch (size) {
      case DeviceSize.tiny:
        return DataRow(
          cells: [
            DataCell(Text(subject)),
            DataCell(Text(name)),
            DataCell(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableEditButton(
                    onTap: () {
                      Get.toNamed("/edit", arguments: data)?.then((value) {
                        listController.getCourses();
                      });
                    },
                  ),
                  TableDeleteButton(
                    onTap: () {
                      listController.deleteCourse(index);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      case DeviceSize.small:
        return DataRow(
          cells: [
            DataCell(Text(subject)),
            DataCell(Text(name)),
            DataCell(Text(modality)),
            DataCell(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableEditButton(
                    onTap: () {
                      Get.toNamed("/edit", arguments: data)?.then((value) {
                        listController.getCourses();
                      });
                    },
                  ),
                  TableDeleteButton(
                    onTap: () {
                      listController.deleteCourse(index);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return DataRow(
          cells: [
            DataCell(Text(subject)),
            DataCell(Text(name)),
            DataCell(Text(modality)),
            DataCell(Text(book)),
            DataCell(Text(workload)),
            DataCell(
              TableEditButton(
                onTap: () {
                  Get.toNamed("/edit", arguments: data)?.then((value) {
                    listController.getCourses();
                  });
                },
              ),
            ),
            DataCell(
              TableDeleteButton(
                onTap: () {
                  listController.deleteCourse(index);
                },
              ),
            ),
          ],
        );
    }
  }
}
