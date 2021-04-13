import 'package:flutter/material.dart';
import 'package:flutter_front/controllers/controller_course.dart';
import 'package:flutter_front/util/enum_device_size.dart';
import 'package:flutter_front/widgets/atoms/button/atom_delete_button.dart';
import 'package:flutter_front/widgets/atoms/button/atom_save_button.dart';
import 'package:flutter_front/widgets/atoms/input/atom_list_input.dart';
import 'package:flutter_front/widgets/atoms/input/atom_select_input.dart';
import 'package:flutter_front/widgets/atoms/text/atom_course_title_text.dart';
import 'package:get/get.dart';

class PageEdit extends StatelessWidget {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController bookController = new TextEditingController();
  final TextEditingController isbnController = new TextEditingController();
  final TextEditingController workloadController = new TextEditingController();

  final CourseController courseController = Get.put(CourseController());

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    courseController.changeCourseId(Get.arguments["id"]);
    courseController.changeModalityId(Get.arguments["modality_id"] - 1);
    courseController.changeActiveId(Get.arguments["active"] == 1 ? 0 : 1);
    courseController.changeSubjectId(Get.arguments["subject_id"] - 1);

    double shortestSide = MediaQuery.of(context).size.shortestSide;
    bool isMobile = shortestSide < 600;

    if (isMobile) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CourseTitleText(text: 'Atualizar Curso'),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: GetBuilder<CourseController>(builder: (_) {
                      return SelectInput(
                        onSelect: (int index) {
                          courseController.changeSubjectId(index);
                        },
                        inputName: "Matéria",
                        options: _.subjects,
                        jsonKey: "name",
                        selectedIndex: _.subjectId,
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ListInput(
                      initialValue: Get.arguments["name"],
                      controller: nameController,
                      hintText: 'Inglês Avançado',
                      labelText: 'Name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: GetBuilder<CourseController>(builder: (_) {
                      return SelectInput(
                        onSelect: (int index) {
                          courseController.changeModalityId(index);
                        },
                        inputName: "Modalidade",
                        options: _.modalities,
                        jsonKey: "name",
                        selectedIndex: _.modalityId,
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ListInput(
                      initialValue: Get.arguments["book"],
                      controller: bookController,
                      hintText: 'RICHMOND - AMERICAN ENGLISH',
                      labelText: 'Livro',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ListInput(
                      initialValue: Get.arguments["isbn"],
                      controller: isbnController,
                      hintText: '123123',
                      labelText: 'ISBN',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: GetBuilder<CourseController>(builder: (_) {
                      return SelectInput(
                        onSelect: (int index) {
                          courseController.changeActiveId(index);
                        },
                        inputName: "Ativo",
                        options: _.active,
                        jsonKey: "name",
                        selectedIndex: _.activeId,
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ListInput(
                      initialValue: "${Get.arguments["workload"]}",
                      controller: workloadController,
                      hintText: '75',
                      labelText: 'Carga horária (horas)',
                      type: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DeleteButton(
                          onTap: () {
                            Get.back();
                          },
                          size: DeviceSize.tiny,
                        ),
                        SaveButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              courseController
                                  .updateCourse(
                                name: nameController.text,
                                book: bookController.text,
                                isbn: isbnController.text,
                                workload: workloadController.text,
                              )
                                  .then((bool result) =>
                              result ? Get.back() : print("error"));
                            }
                          },
                          size: DeviceSize.tiny,
                        ),
                      ],
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
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CourseTitleText(text: 'Atualizar Curso'),
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: GetBuilder<CourseController>(builder: (_) {
                          return SelectInput(
                            onSelect: (int index) {
                              courseController.changeSubjectId(index);
                            },
                            inputName: "Matéria",
                            options: _.subjects,
                            jsonKey: "name",
                            selectedIndex: _.subjectId,
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ListInput(
                                  initialValue: Get.arguments["name"],
                                  controller: nameController,
                                  hintText: 'Inglês Avançado',
                                  labelText: 'Name',
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child:
                                    GetBuilder<CourseController>(builder: (_) {
                                  return SelectInput(
                                    onSelect: (int index) {
                                      courseController.changeModalityId(index);
                                    },
                                    inputName: "Modalidade",
                                    options: _.modalities,
                                    jsonKey: "name",
                                    selectedIndex: _.modalityId,
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ListInput(
                                  initialValue: Get.arguments["book"],
                                  controller: bookController,
                                  hintText: 'RICHMOND - AMERICAN ENGLISH',
                                  labelText: 'Livro',
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ListInput(
                                  initialValue: Get.arguments["isbn"],
                                  controller: isbnController,
                                  hintText: '123123',
                                  labelText: 'ISBN',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child:
                                    GetBuilder<CourseController>(builder: (_) {
                                  return SelectInput(
                                    onSelect: (int index) {
                                      courseController.changeActiveId(index);
                                    },
                                    inputName: "Ativo",
                                    options: _.active,
                                    jsonKey: "name",
                                    selectedIndex: _.activeId,
                                  );
                                }),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ListInput(
                                  initialValue: "${Get.arguments["workload"]}",
                                  controller: workloadController,
                                  hintText: '75',
                                  labelText: 'Carga horária (horas)',
                                  type: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DeleteButton(
                              onTap: () {
                                Get.back();
                              },
                            ),
                            SaveButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  courseController
                                      .updateCourse(
                                        name: nameController.text,
                                        book: bookController.text,
                                        isbn: isbnController.text,
                                        workload: workloadController.text,
                                      )
                                      .then((bool result) =>
                                          result ? Get.back() : print("error"));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
