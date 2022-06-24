import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled5/permissions/permission_mixin.dart';
import 'package:untitled5/res/strings.dart';

class AppUtils with PermissionMixin {
  customImageSourceDialog(
      {required BuildContext context,
      required Function cameraAction,
      required Function galleryAction}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    Strings.pleaseSelectImageSource,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                          if (!(kIsWeb)) {
                            PermissionStatus? permissionStatus =
                                await cameraPermissionStatus();

                            if (permissionStatus != null &&
                                (permissionStatus.isPermanentlyDenied ||
                                    permissionStatus.isDenied)) {
                              permissionDialog(
                                  context: context,
                                  message: Strings
                                      .youHavePermanentlyDeniedPermission);
                            } else {
                              cameraAction();
                            }
                          } else {
                            cameraAction();
                          }
                        },
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 40,
                            ),
                            Text(
                              Strings.camera,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);

                          galleryAction();
                        },
                        child: Column(
                          children: const [
                            Icon(
                              Icons.image,
                              color: Colors.black,
                              size: 40,
                            ),
                            Text(
                              Strings.gallery,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  permissionDialog({required BuildContext context, required String message}) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style:const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        Strings.ok,
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  showYearPicker(
      {required BuildContext context,
      required Function(DateTime year) onChange}) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: YearPicker(
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2021),
                    selectedDate: DateTime(2010),
                    onChanged: onChange)),
          );
        });
  }
}
