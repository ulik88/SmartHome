import 'dart:io';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_home/main.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:path/path.dart';


class FilePicker extends StatefulWidget {
  const FilePicker({Key? key}) : super(key: key);

  @override
  _FilePickerState createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePicker> {
  final file = ImagePicker();
  File? image;

  /*Future readFile() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    var tmpFile = File(image.path);
    print(tmpFile);
    tmpFile = await tmpFile.copy(tmpFile.path);

    // 5. Get the path to the apps directory so we can save the file to it.
    final path = await pathProvider.getApplicationDocumentsDirectory();
    final fileName = basename(image.path); // Filename without extension
    final fileExtension = extension(image.path); // e.g. '.jpg'

    tmpFile = await tmpFile.copy('$path/$fileName$fileExtension');
    setState(() => this.image = tmpFile);
  }*/
/*  ====================below old code but working ===============================*/

  Future readFile() async {

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
       image.openRead(0,9);
      final result = image;

      print(result);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

 /* Future imgFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      File tmpFile = File(image.path);
      tmpFile = await tmpFile.copy(tmpFile.path);
      final path = await pathProvider.getApplicationDocumentsDirectory();
      final fileName = basename(image.path);
      final fileExtension = extension(image.path);

      tmpFile = await tmpFile.copy('$path/$fileName$fileExtension');
      setState(() => this.image = tmpFile);


    } on PlatformException catch (e) {
      print('Failed to take camera: $e');
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 350,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: Container(
                color: Colors.transparent,
                child: image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(
                    image!,
                    width: 120,
                    height: 105,
                    fit: BoxFit.fitHeight,
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  width: 120,
                  height: 105,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /*Padding(
  //padding: const EdgeInsets.symmetric(vertical: 0),
  padding: const EdgeInsets.fromLTRB(
  10.0, 0.0, 10.0, 0.0),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(15),
  child: Image(
  image: ResizeImage(
  AssetImage(AppImages.microvelle),
  width: 120,
  height: 105)),
  ),
  ),*/

  void _showPicker(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: CupertinoActionSheet(
                cancelButton: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                message: Text(
                  'Take a Photo or choose your picture for that event!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.normal),
                ),
                actions: [
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                      onTap: () {
                        readFile();
                        Navigator.of(context).pop();
                            /*.push(MaterialPageRoute<void>(
                            builder: (BuildContext context) => MyApp()));*/
                        // hier muss noch für Navigate einsgestellt werden
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    onTap: () {
                      //imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
