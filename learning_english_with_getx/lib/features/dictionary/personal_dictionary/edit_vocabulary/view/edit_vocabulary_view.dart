import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/edit_vocabulary/controller/edit_vocabulary_controller.dart';

class EditVocabularyView extends StatelessWidget {
  final _addExampleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditVocabularyController>();

    return Obx(() {
      return Scaffold(
        backgroundColor: AppStyles.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyles.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/profile_avatar_1.png",
                        ),
                        fit: BoxFit.fill),
                  )),
            ],
          ),
        ),
        body: buildBody(controller, context),
        // body: buildTopicList(),
      );
    });
  }

  Widget buildBody(
      EditVocabularyController controller, BuildContext context) {
    return GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: buildMenu(),
              ),

              SizedBox(height: 20,),

              Expanded(
                child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [

                        SizedBox(
                          height: 20.0,
                        ),

                        Text(
                          "Cập nhật từ vựng",
                          style: TextStyle(
                            color: AppStyles.backgroundColorDark,
                            fontFamily: 'OpenSans',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        buildWordNameTF(controller),

                        buildWordPronounceTF(controller),

                        buildWordMeanTF(controller),

                        Divider(),

                        SizedBox(
                          height: 20.0,
                        ),

                        Text(
                          'Chọn từ loại cho từ vựng của bạn',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: AppStyles.backgroundColorDark,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        buildCheckIsNoun(controller),
                        buildCheckWordIsVerb(controller),

                        buildCheckWordIsAdjective(controller),

                        buildCheckWordIsPreposition(controller),

                        buildCheckWordIsAdverb(controller),

                        buildCheckWorkIsOtherType(controller),

                        Divider(),

                        SizedBox(
                          height: 20.0,
                        ),

                        Text(
                          'Chọn ảnh cho từ vựng của bạn',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: AppStyles.backgroundColorDark,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        // Upload load Images
                        buildUploadImages(controller, context),

                        Divider(),

                        SizedBox(
                          height: 20.0,
                        ),

                        Text(
                          'Ví dụ cho từ vựng của bạn',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: AppStyles.backgroundColorDark,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.listExample.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(controller.listExample[index]);
                            }),

                        buildAddExample(controller),

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
                              print("aaaaa");
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
                                overlayColor: MaterialStateProperty.all(
                                    AppStyles.backgroundColorBrow),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0),
                                        side: BorderSide(
                                            color:
                                                AppStyles.backgroundColorDark)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
              ),
      ]
          ),
        ));
  }

  Card buildAddExample(EditVocabularyController controller) {
    return Card(
      color: AppStyles.primary,
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Get.defaultDialog(
              title: '',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _addExampleController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: InputDecoration(
                        labelText: 'Nhập ví dụ của bạn',
                        hintMaxLines: 1,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 4.0))),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_addExampleController.text.isNotEmpty) {
                        //controller.listExample.add(_addExampleController.text);
                        controller.addExample(_addExampleController.text);
                        _addExampleController.text = "";
                        Get.back();
                      } else {
                        controller.showNotification(
                            typeNoti: false,
                            message: "Bạn chưa nhập câu ví dụ!");
                      }
                    },
                    child: Text(
                      'Thêm ví dụ',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppStyles.backgroundColorDark),
                    ),
                  )
                ],
              ),
              radius: 10.0);
        },
      ),
    );
  }

  GridView buildUploadImages(
      EditVocabularyController controller, BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(controller.images.length, (index) {
        //if (images[index] is ImageUploadModel) {
        print((controller.images[index]).runtimeType);
        if (controller.images[index] is EditImageUploadModel) {
          EditImageUploadModel editImageUploadModelploadModel =
              controller.images[index] as EditImageUploadModel;
          Uint8List bytesDecode = Base64Codec().decode(editImageUploadModelploadModel.imageFile);
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
    );
  }

  CheckboxListTile buildCheckWorkIsOtherType(
      EditVocabularyController controller) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.view_headline),
      title: const Text('Loại từ khác'),
      subtitle: Text('[...]'),
      value: controller.isOtherType.value,
      // value: true,
      onChanged: (value) {
        print(value);
        controller.checkOtherType(value as bool);
      },
    );
  }

  CheckboxListTile buildCheckWordIsAdverb(
      EditVocabularyController controller) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.timer),
      title: const Text('Trạng từ'),
      subtitle: Text('[adv]'),
      value: controller.isAdverb.value,
      onChanged: (value) {
        controller.checkAdverb(value as bool);
      },
    );
  }

  CheckboxListTile buildCheckWordIsPreposition(
      EditVocabularyController controller) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.account_tree_outlined),
      title: const Text('Giới từ'),
      subtitle: Text('[pre]'),
      value: controller.isPreposition.value,
      onChanged: (value) {
        controller.checkPreposition(value as bool);
      },
    );
  }

  CheckboxListTile buildCheckWordIsAdjective(
      EditVocabularyController controller) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.scatter_plot_outlined),
      title: const Text('Tính từ'),
      subtitle: Text('[adj]'),
      value: controller.isAdjective.value,
      onChanged: (value) {
        controller.checkAdjective(value as bool);
      },
    );
  }

  CheckboxListTile buildCheckWordIsVerb(EditVocabularyController controller) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.directions_run),
      title: const Text('Động từ'),
      subtitle: Text('[v]'),
      value: controller.isVerb.value,
      onChanged: (value) {
        controller.checkVerb(value as bool);
      },
    );
  }

  CheckboxListTile buildCheckIsNoun(EditVocabularyController controller) {
    return CheckboxListTile(
      secondary: const Icon(Icons.drive_file_rename_outline),
      title: const Text('Danh từ'),
      subtitle: Text('[n]'),
      value: controller.isNoun.value,
      onChanged: (value) {
        print(value);
        controller.checkNoun(value as bool);
      },
    );
  }

  Padding buildWordMeanTF(EditVocabularyController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                controller.mean = text.obs;
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
                    borderSide: BorderSide(color: AppStyles.grey, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppStyles.backgroundColorDark)),
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
    );
  }

  Padding buildWordPronounceTF(EditVocabularyController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                controller.pronounce = text.obs;
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
                    borderSide: BorderSide(color: AppStyles.grey, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppStyles.backgroundColorDark)),
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
    );
  }

  Padding buildWordNameTF(EditVocabularyController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (text) {
                controller.word = text.obs;
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
                    borderSide: BorderSide(color: AppStyles.grey, width: 3.0)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppStyles.backgroundColorDark)),
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
    );
  }

  Container buildMenu() {
    return Container(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppStyles.kDefaultPadding),
              child: GestureDetector(
                onTap: () {},
                child: buildIconMenu(),
              ),
            ),
            Expanded(child: buildFunctionCategories()),
          ],
        ));
  }

  Container buildIconMenu() {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppStyles.primary,
      ),
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.kDefaultPadding * 0.4),
      margin: EdgeInsets.only(right: AppStyles.kDefaultPadding * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.view_quilt_rounded),
        ],
      ),
    );
  }

  Widget buildFunctionCategories() {
    return Padding(
      padding: EdgeInsets.only(top: AppStyles.kDefaultPadding),
      child: SizedBox(
        height: 35,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          GestureDetector(
            onTap: () {
              Get.toNamed("/personal_vocabulary");
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppStyles.backgroundColorDark,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding * 0.8),
              margin: EdgeInsets.only(right: AppStyles.kDefaultPadding * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.list_outlined,
                    color: AppStyles.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Danh sách từ vựng",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppStyles.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppStyles.backgroundColorDark,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding * 0.8),
              margin: EdgeInsets.only(right: AppStyles.kDefaultPadding * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.create_outlined,
                    color: AppStyles.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Tạo từ vựng",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppStyles.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppStyles.backgroundColorDark,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding * 0.8),
              margin: EdgeInsets.only(right: AppStyles.kDefaultPadding * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_outlined,
                    color: AppStyles.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Ôn từ vựng",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppStyles.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  showMyAlertDialog(
      BuildContext context, EditVocabularyController controller, int index) {
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
