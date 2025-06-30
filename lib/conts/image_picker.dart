import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{

  final ImagePicker _picker = ImagePicker();

  Future<XFile?> cameraCapture()async{
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> pickImageGallery()async{
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }

  Future<XFile?> pickVideoGallery()async{
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    return file;
  }

}
