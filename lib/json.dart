// Future<File> getImage() async {
//   final ImagePicker _picker = ImagePicker();
// // Pick an image
//   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
// //TO convert Xfile into file
//   File file = File(image!.path);
// //print(‘Image picked’);
//   return file;
// }
// var formData = FormData.fromMap({
//         'file': await MultipartFile.fromFile(empFace.path, filename: empCode),
//       });

//       final response = await Dio().post(
//         'your Api url',
//         data: formData,
//       );

//       headers: {
//     'Content-Type': 'multipart/form-data'
//   },
import 'package:dartz/dartz_streaming.dart';

class Texts {
  int index = 0;
  Texts._internal();

  factory Texts() => Texts._internal();
}
