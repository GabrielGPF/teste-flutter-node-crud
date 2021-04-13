import 'package:flutter/material.dart';

class SelectInput extends StatelessWidget {
  final String inputName;
  final Function(int) onSelect;
  final List<dynamic> options;
  final int selectedIndex;
  final String jsonKey;

  SelectInput({
    required this.inputName,
    required this.onSelect,
    required this.options,
    required this.jsonKey,
    this.selectedIndex = 0,
  });

  final GlobalKey<FormFieldState> _key = new GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            "$inputName: ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: FormField(
                key: _key,
                builder: (FormFieldState formField) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      tooltipTheme: TooltipThemeData(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    child: PopupMenuButton<int>(
                      tooltip: "",
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        side: BorderSide(
                          color: const Color(0xFF707070),
                          width: 1,
                        ),
                      ),
                      onSelected: (int newIndex) {
                        onSelect(newIndex);
                      },
                      itemBuilder: (BuildContext context) =>
                          _buildInputOptions(options, jsonKey),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(
                              0xFF000000,
                            ),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                options.length > 0 ? options[selectedIndex][jsonKey] : '',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<PopupMenuEntry<int>> _buildInputOptions(
    List<dynamic> options, String jsonKey) {
  List<PopupMenuItem<int>> popupMenuItemList = [];

  for (int i = 0; i < options.length; i++) {
    popupMenuItemList.add(
      PopupMenuItem<int>(
        value: i,
        child: Text(options[i][jsonKey]),
      ),
    );
  }

  return popupMenuItemList;
}