import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ConstantParameters {
  static late List<CameraDescription> camera;
  static Future<List<CameraDescription>> cameraList() async {
    camera = await availableCameras();
    print('camera initialized Successfully');
    return camera;
  }

  static Widget ContainerWidget(
      BuildContext context, bool choice, Widget child) {
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.12,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: choice ? Theme.of(context).primaryColor : Colors.black12,
            width: 2),
      ),
      child: child,
    );
  }
}
