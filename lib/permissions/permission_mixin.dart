import 'package:permission_handler/permission_handler.dart';

mixin PermissionMixin{
 Future<PermissionStatus?> cameraPermissionStatus()async{
   return Permission.camera.status ;
  }
  
}