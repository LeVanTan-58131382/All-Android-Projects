import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/create_vocabulary/controller/create_vocabulary_controller.dart';

class CreateVocabularyView extends StatefulWidget
{
  @override
  CreateVocabularyViewState createState() => new CreateVocabularyViewState();
}

class CreateVocabularyViewState extends State<CreateVocabularyView>
{

  final _formKey = GlobalKey<FormState>();

  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final controller = Get.find<CreateVocabularyController>();

    return Scaffold(
      backgroundColor: AppStyles.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: Obx(() {
        return GestureDetector(
          onTap: () => Get.focusScope!.unfocus(),
          child: Container(

            height: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                      // TextField(
                      //   cursorColor: Colors.black,
                      //   style: TextStyle(
                      //       color: Colors.white
                      //   ),
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.blueAccent,
                      //     border: OutlineInputBorder(
                      //         borderSide: BorderSide.none,
                      //         borderRadius: BorderRadius.circular(50)
                      //     ),
                      //   ),
                      // ),

                      Text(
                        "Tạo từ vựng mới",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: TextFormField(
                                onChanged: (text) {

                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Bạn chưa nhập tên từ vựng!";
                                  }
                                  return null;
                                },
                                // obscureText: true,
                                style: TextStyle(
                                  color: AppStyles.backgroundColorDark,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppStyles.grey, width: 3.0)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppStyles
                                          .backgroundColorDark)),
                                  hintText: 'Nhập từ vựng mới',
                                  labelText: 'Tên từ vựng mới',
                                  labelStyle: kLabelStyle,
                                  prefixIcon: const Icon(
                                    Icons.drive_file_rename_outline,
                                    color: AppStyles.backgroundColorDark,
                                  ),
                                  prefixText: ' ',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: TextFormField(
                                onChanged: (text) {

                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Bạn chưa nhập cách phát âm từ vựng!";
                                  }
                                  return null;
                                },
                                // obscureText: true,
                                style: TextStyle(
                                  color: AppStyles.backgroundColorDark,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppStyles.grey, width: 3.0)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppStyles
                                          .backgroundColorDark)),
                                  hintText: 'Nhập cách phát âm từ vựng',
                                  labelText: 'Cách phát âm từ vựng',
                                  labelStyle: kLabelStyle,
                                  prefixIcon: const Icon(
                                    Icons.record_voice_over_outlined,
                                    color: AppStyles.backgroundColorDark,
                                  ),
                                  prefixText: ' ',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: TextFormField(
                                onChanged: (text) {

                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Bạn chưa nhập nghĩa từ vựng!";
                                  }
                                  return null;
                                },
                                // obscureText: true,

                                style: TextStyle(
                                  color: AppStyles.backgroundColorDark,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppStyles.grey, width: 3.0)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppStyles
                                          .backgroundColorDark)),
                                  hintText: 'Nhập nghĩa từ vựng mới',
                                  labelText: 'Nghĩa từ vựng mới',
                                  labelStyle: kLabelStyle,
                                  prefixIcon: const Icon(
                                    Icons.contact_support_outlined,
                                    color: AppStyles.backgroundColorDark,
                                  ),
                                  prefixText: ' ',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(),

                      SizedBox(height: 20.0,),

                      Text('Chọn từ loại cho từ vựng của bạn', style: TextStyle(
                          fontSize: 16.0, color: AppStyles.backgroundColorDark, fontWeight: FontWeight.bold),),

                      SizedBox(height: 20.0,),

                      CheckboxListTile(
                        secondary: const Icon(Icons.drive_file_rename_outline),
                        title: const Text('Danh từ'),
                        subtitle: Text('[n]'),
                        value: valuefirst,
                        onChanged: (value) {
                          setState(() {
                            valuefirst = value as bool;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: const Icon(Icons.directions_run),
                        title: const Text('Động từ'),
                        subtitle: Text('[v]'),
                        value: valuesecond,
                        onChanged: (value) {
                          valuesecond = value as bool;
                        },
                      ),

                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: const Icon(Icons.scatter_plot_outlined),
                        title: const Text('Tính từ'),
                        subtitle: Text('[adj]'),
                        value: valuesecond,
                        onChanged: (value) {
                          valuesecond = value as bool;
                        },
                      ),

                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: const Icon(Icons.account_tree_outlined),
                        title: const Text('Giới từ'),
                        subtitle: Text('[pre]'),
                        value: valuesecond,
                        onChanged: (value) {
                          valuesecond = value as bool;
                        },
                      ),

                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: const Icon(Icons.timer),
                        title: const Text('Trạng từ'),
                        subtitle: Text('[adv]'),
                        value: valuesecond,
                        onChanged: (value) {
                          valuesecond = value as bool;
                        },
                      ),

                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: const Icon(Icons.view_headline),
                        title: const Text('Loại từ khác'),
                        subtitle: Text('[...]'),
                        value: valuesecond,
                        onChanged: (value) {
                          valuesecond = value as bool;
                        },
                      ),

                      Divider(),

                      SizedBox(height: 20.0,),

                      Text('Chọn ảnh cho từ vựng của bạn', style: TextStyle(
                          fontSize: 16.0, color: AppStyles.backgroundColorDark, fontWeight: FontWeight.bold),),

                      SizedBox(height: 20.0,),

                      // Upload load Images
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        children: List.generate(
                            controller.images.length, (index) {
                          //if (images[index] is ImageUploadModel) {
                          print((controller.images[index]).runtimeType);
                          if (controller.images[index] is ImageUploadModel) {
                            ImageUploadModel uploadModel = controller
                                .images[index] as ImageUploadModel;
                            Uint8List bytesDecode = Base64Codec().decode(
                                uploadModel.imageFile);
                            return GestureDetector(
                              onTap: () {
                                print("Mở ảnh ra");
                              },
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Image.memory(
                                        bytesDecode,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 5,
                                      child: InkWell(
                                        child: Icon(
                                          Icons.remove_circle,
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                        onTap: () {
                                          controller.images.removeAt(index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Card(
                              color: AppStyles.primary,
                              child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  // _onAddImageClick(index);
                                  showMyAlertDialog(context, controller, index);
                                },
                              ),
                            );
                          }
                        }),
                      ),

                      Divider(),

                      Container(
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Get.focusScope!.unfocus();
                            }
                          },
                          child: Center(
                            child: Text(
                              'Lưu từ vựng',
                              style: TextStyle(
                                color: AppStyles.backgroundColorDark,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                              overlayColor:
                              MaterialStateProperty.all(
                                  AppStyles.backgroundColorBrow),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: AppStyles
                                          .backgroundColorDark)))),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      ),
    );
  }

  showMyAlertDialog(BuildContext context, CreateVocabularyController controller, int index) {
    // Create AlertDialog
    AlertDialog dialog = AlertDialog(
      title: Text("Tải ảnh lên"),
      content: Text("Bạn muốn chọn ảnh từ ?"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(children: [
              FloatingActionButton(
                onPressed: () {
                  controller.onAddImageClick(index, ImageSource.camera);
                },
                tooltip: "Máy ảnh",
                child: Icon(Icons.add_a_photo),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Máy ảnh")
            ]),
            Column(children: [
              FloatingActionButton(
                onPressed: () {
                  controller.onAddImageClick(index, ImageSource.gallery);
                },
                tooltip: "Thư viện ảnh",
                child: Icon(Icons.camera_alt),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Thư viện ảnh")
            ]),
          ],
        ),
      ],
    );



    void getFileImage(int index) async {
//    var dir = await path_provider.getTemporaryDirectory();

      // _imageFile.then((file) async {
      //   setState(() {
      //     ImageUploadModel imageUpload = new ImageUploadModel();
      //     imageUpload.isUploaded = false;
      //     imageUpload.uploading = false;
      //     imageUpload.imageFile = file;
      //     imageUpload.imageUrl = '';
      //     images.replaceRange(index, index + 1, [imageUpload]);
      //   });
      // });
    }

    // Call showDialog function to show dialog.
    Future<dynamic> futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
    Stream stream = futureValue.asStream();
    stream.listen((dynamic data) {
      String answerValue = data;
      this.setState(() {
        //this.answer = answerValue;
      });
    }, onDone: () {
      print("Done!");
    }, onError: (error) {
      print("Error! " + error.toString());
    });
  }

}

final kHintTextStyle = TextStyle(
  color: AppStyles.backgroundColorDark,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: AppStyles.backgroundColorDark,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: AppStyles.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

