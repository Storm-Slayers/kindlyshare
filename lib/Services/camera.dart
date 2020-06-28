import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class CameraService{
  Future<File> fromGallery([quality = 100]) async{
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    File compressedImage;
    var tempDir = await path_provider.getTemporaryDirectory();
    var targetPath = tempDir.absolute.path + '/temp.jpg';
    if (file.lengthSync() > 1024000) {
      compressedImage = await FlutterImageCompress.compressAndGetFile(file.absolute.path, targetPath, quality: quality);
    }else{
      compressedImage = file;
    }
    return compressedImage;
  }

  Future<File> fromCamera([quality = 100]) async{
    var file = await ImagePicker.pickImage(source: ImageSource.camera);
    File compressedImage;
    var tempDir = await path_provider.getTemporaryDirectory();
    var targetPath = tempDir.absolute.path + '/temp.jpg';
    if (file.lengthSync() > 1024000) {
      compressedImage = await FlutterImageCompress.compressAndGetFile(file.absolute.path, targetPath, quality: quality);
    }else{
      compressedImage = file;
    }
    return compressedImage;
  }
}