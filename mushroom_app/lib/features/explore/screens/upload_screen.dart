import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _mushroomName;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _image = pickedFile;
          _uploadImage(File(pickedFile.path)); // Upload image after selection
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    try {
      Uri uri = Uri.parse('http://34.235.129.0:8000/predict');

      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        setState(() {
          _mushroomName = response
              .body; // Assuming the body contains just the mushroom name
        });
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('Take a Picture'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: const Text('Pick from Gallery')),
              ),
            ),
            if (_image != null) Image.file(File(_image!.path)),
            if (_mushroomName != null)
              Text('Mushroom: $_mushroomName'), // Display the mushroom name
          ],
        ),
      ),
    );
  }
}
