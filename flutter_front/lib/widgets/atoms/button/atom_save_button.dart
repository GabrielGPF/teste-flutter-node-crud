import 'package:flutter/material.dart';
import 'package:flutter_front/util/enum_device_size.dart';

class SaveButton extends StatelessWidget {
  final Function onTap;
  final DeviceSize size;

  SaveButton({
    required this.onTap,
    this.size = DeviceSize.normal,
  });

  @override
  Widget build(BuildContext context) {
    switch(size){
      case DeviceSize.tiny:
        return InkWell(
          onTap: () => onTap(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 8,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return InkWell(
          onTap: () => onTap(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Salvar',
                style: TextStyle(
                  color: Colors.green[400],
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 8,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}