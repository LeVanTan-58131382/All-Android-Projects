import 'dart:convert';
import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/core/models/user_topic_model.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/create_vocabulary/controller/create_vocabulary_controller.dart';

class CreateVocabularyView extends StatelessWidget {
  final _addExampleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateVocabularyController>();

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
      CreateVocabularyController controller, BuildContext context) {
    return GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Container(
          height: double.infinity,
          child: Column(children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 0),
              child: buildMenu(),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController.value,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),

                        ElasticIn(
                          child: Text(
                            "T???o t??? v???ng m???i",
                            style: TextStyle(
                              color: AppStyles.backgroundColorDark,
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        ElasticInLeft(child: buildWordNameTF(controller)),

                        ElasticInRight(child: buildWordPronounceTF(controller)),

                        ElasticInLeft(child: buildWordMeanTF(controller)),

                        Divider(),

                        SizedBox(
                          height: 20.0,
                        ),

                        ElasticIn(
                          child: Text(
                            'Ch???n t??? lo???i cho t??? v???ng c???a b???n',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppStyles.backgroundColorDark,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        ZoomIn(
                          child: Card(
                            color: AppStyles.primary,
                            child: IconButton(
                              icon: Icon(Icons.open_in_new_rounded),
                              onPressed: () {
                                Get.focusScope!.unfocus();
                                Get.defaultDialog(
                                    title: 'Ch???n t??? lo???i',
                                    titlePadding: EdgeInsets.all(10),
                                    titleStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: AppStyles.backgroundColorDark),
                                    content: Obx(() {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ElasticIn(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.checkNoun(
                                                          !controller
                                                              .isNoun.value);
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        'Danh t???',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 14,
                                                          color: AppStyles
                                                              .backgroundColorDark,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty.all(
                                                                AppStyles
                                                                    .lightGreen),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    50.0),
                                                            side: BorderSide(
                                                                color: controller
                                                                            .isNoun
                                                                            .value ==
                                                                        true
                                                                    ? AppStyles
                                                                        .backgroundColorDark
                                                                    : AppStyles
                                                                        .white)))),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ElasticIn(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.checkVerb(
                                                          !controller
                                                              .isVerb.value);
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        '?????ng t???',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 14,
                                                          color: AppStyles
                                                              .backgroundColorDark,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty.all(
                                                                AppStyles
                                                                    .lightGreen),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    50.0),
                                                            side: BorderSide(
                                                                color: controller
                                                                            .isVerb
                                                                            .value ==
                                                                        true
                                                                    ? AppStyles
                                                                        .backgroundColorDark
                                                                    : AppStyles
                                                                        .white)))),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ElasticIn(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.checkAdjective(
                                                          !controller
                                                              .isAdjective
                                                              .value);
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        'T??nh t???',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 14,
                                                          color: AppStyles
                                                              .backgroundColorDark,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty.all(
                                                                AppStyles
                                                                    .lightGreen),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    50.0),
                                                            side: BorderSide(
                                                                color: controller
                                                                            .isAdjective
                                                                            .value ==
                                                                        true
                                                                    ? AppStyles
                                                                        .backgroundColorDark
                                                                    : AppStyles
                                                                        .white)))),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ElasticIn(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.checkAdverb(
                                                          !controller
                                                              .isAdverb.value);
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        'Tr???ng t???',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 14,
                                                          color: AppStyles
                                                              .backgroundColorDark,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty.all(
                                                                AppStyles
                                                                    .lightGreen),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    50.0),
                                                            side: BorderSide(
                                                                color: controller
                                                                            .isAdverb
                                                                            .value ==
                                                                        true
                                                                    ? AppStyles
                                                                        .backgroundColorDark
                                                                    : AppStyles
                                                                        .white)))),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ElasticIn(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller
                                                          .checkPreposition(
                                                              !controller
                                                                  .isPreposition
                                                                  .value);
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        'Gi???i t???',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 14,
                                                          color: AppStyles
                                                              .backgroundColorDark,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty.all(
                                                                AppStyles
                                                                    .lightGreen),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    50.0),
                                                            side: BorderSide(
                                                                color: controller
                                                                            .isPreposition
                                                                            .value ==
                                                                        true
                                                                    ? AppStyles
                                                                        .backgroundColorDark
                                                                    : AppStyles
                                                                        .white)))),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ElasticIn(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.checkOtherType(
                                                          !controller
                                                              .isOtherType
                                                              .value);
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        'Kh??c',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 14,
                                                          color: AppStyles
                                                              .backgroundColorDark,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty.all(
                                                                AppStyles
                                                                    .lightGreen),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    50.0),
                                                            side: BorderSide(
                                                                color: controller
                                                                            .isOtherType
                                                                            .value ==
                                                                        true
                                                                    ? AppStyles
                                                                        .backgroundColorDark
                                                                    : AppStyles
                                                                        .white)))),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          
                                          SizedBox(
                                            height: 30.0,
                                          ),

                                          ElasticIn(
                                            child: TextButton(
                                              onPressed: () {
                                                if (controller.isNoun.value == false &&
                                                    controller.isVerb.value ==
                                                        false &&
                                                    controller
                                                        .isAdjective.value ==
                                                        false &&
                                                    controller.isAdverb.value ==
                                                        false &&
                                                    controller.isPreposition
                                                        .value ==
                                                        false &&
                                                    controller
                                                        .isOtherType.value ==
                                                        false) {
                                                  controller.showNotification(
                                                      typeNoti: false,
                                                      message:
                                                      "B???n ch??a ch???n t??? lo???i!");
                                                } else {
                                                  Get.back();
                                                }
                                              },
                                              child: Center(
                                                child: Text(
                                                  'Ho??n t???t',
                                                  style:
                                                  GoogleFonts.nunito(
                                                    fontSize: 14,
                                                    color: AppStyles
                                                        .backgroundColorDark,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              style: ButtonStyle(
                                                  overlayColor:
                                                  MaterialStateProperty.all(
                                                      AppStyles
                                                          .lightGreen),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                      side: BorderSide(
                                                          color: AppStyles
                                                              .backgroundColorDark)))),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    radius: 10.0);
                              },
                            ),
                          ),
                        ),

                        Divider(),

                        SizedBox(
                          height: 20.0,
                        ),

                        ElasticIn(
                          child: Text(
                            'Ch???n ch??? ????? cho t??? v???ng c???a b???n',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppStyles.backgroundColorDark,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        ZoomIn(
                            child: Card(
                                color: AppStyles.primary,
                                child: IconButton(
                                    icon: Icon(Icons.open_in_new_rounded),
                                    onPressed: () {
                                      Get.focusScope!.unfocus();
                                      Get.defaultDialog(
                                          title: 'Ch???n ch??? ?????',
                                          titlePadding: EdgeInsets.all(10),
                                          titleStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: AppStyles
                                                  .backgroundColorDark),
                                          content: Obx(() {
                                            return Padding(
                                              padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  DropdownButton(
                                                  hint: Text(
                                                    'Ch???n ch??? ?????',
                                                  ),
                                                  onChanged: (newValue) {
                                                    controller
                                                        .onChangeUserTopic(newValue as UserTopic);
                                                    print(newValue.name);
                                                  },
                                                  // value: controller.selectedUserTopic.value.name,

                                                  items:
                                                  controller.userTopics.map((selectedUserTopic) {
                                                    return DropdownMenuItem(
                                                      child: new Text(
                                                        selectedUserTopic.name,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      value: selectedUserTopic,
                                                    );
                                                  }).toList(),
                                                ),

                                                  SizedBox(height: 30.0,),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,

                                                    children: [

                                                      ElasticIn(
                                                        child: TextButton(
                                                          onPressed: () {
                                                              Get.back();
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              'Ho??n t???t',
                                                              style:
                                                              GoogleFonts.nunito(
                                                                fontSize: 14,
                                                                color: AppStyles
                                                                    .backgroundColorDark,
                                                                fontWeight:
                                                                FontWeight.w700,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ButtonStyle(
                                                              overlayColor:
                                                              MaterialStateProperty.all(
                                                                  AppStyles
                                                                      .lightGreen),
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      50.0),
                                                                  side: BorderSide(
                                                                      color: AppStyles
                                                                          .backgroundColorDark)))),
                                                        ),
                                                      ),

                                                      SizedBox(width: 20.0,),

                                                      ElasticIn(
                                                      child: TextButton(
                                                        onPressed: () {

                                                          final _addTopicController = TextEditingController();

                                                          Get.defaultDialog(
                                                              title: 'Th??m ch??? ?????',
                                                              titleStyle: GoogleFonts.nunito(
                                                                fontSize: 16,
                                                                color: AppStyles
                                                                    .backgroundColorDark,
                                                                fontWeight:
                                                                FontWeight.w700,
                                                              ),
                                                              content: Padding(
                                                                padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0, bottom: 15.0),
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    TextField(
                                                                      controller: _addTopicController,
                                                                      keyboardType: TextInputType.text,
                                                                      maxLines: 1,
                                                                      decoration: InputDecoration(
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(color: AppStyles.backgroundColor_D_Cyan, width: 3.0)),
                                                                        border: OutlineInputBorder(
                                                                            borderSide:
                                                                            BorderSide(color: AppStyles.backgroundColorDark)),
                                                                        hintText: 'Nh???p t??n ch??? ?????',
                                                                        labelStyle: kLabelStyle,
                                                                        prefixText: ' ',
                                                                      ),
                                                                    ),

                                                                    SizedBox(
                                                                      height: 20.0,
                                                                    ),

                                                                    controller.isLoadingCreateTopic.value == true ? BounceInUp(child: SpinKitCircle(color: Colors.red)) : Container(),

                                                                    SizedBox(
                                                                      height: 20.0,
                                                                    ),

                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        ElasticIn(
                                                                          child: TextButton(
                                                                            onPressed: () {
                                                                              if (_addTopicController.text.isNotEmpty) {

                                                                                controller.addTopic(_addTopicController.text);
                                                                                _addTopicController.text = "";

                                                                              } else {
                                                                                controller.showNotification(
                                                                                    typeNoti: false,
                                                                                    message: "B???n ch??a nh???p t??n ch??? ?????");
                                                                              }
                                                                            },
                                                                            child: Center(
                                                                              child: Text(
                                                                                'Th??m',
                                                                                style:
                                                                                GoogleFonts.nunito(
                                                                                  fontSize: 14,
                                                                                  color: AppStyles
                                                                                      .backgroundColorDark,
                                                                                  fontWeight:
                                                                                  FontWeight.w700,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            style: ButtonStyle(
                                                                                overlayColor:
                                                                                MaterialStateProperty.all(
                                                                                    AppStyles
                                                                                        .lightGreen),
                                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                                    borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        50.0),
                                                                                    side: BorderSide(
                                                                                        color: AppStyles
                                                                                            .backgroundColorDark)))),
                                                                          ),
                                                                        ),

                                                                        SizedBox(width: 30.0,),

                                                                        ElasticIn(
                                                                          child: TextButton(
                                                                            onPressed: () {
                                                                              Get.back();
                                                                            },
                                                                            child: Center(
                                                                              child: Text(
                                                                                '????ng',
                                                                                style:
                                                                                GoogleFonts.nunito(
                                                                                  fontSize: 14,
                                                                                  color: AppStyles
                                                                                      .backgroundColorDark,
                                                                                  fontWeight:
                                                                                  FontWeight.w700,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            style: ButtonStyle(
                                                                                overlayColor:
                                                                                MaterialStateProperty.all(
                                                                                    AppStyles
                                                                                        .lightGreen),
                                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                                    borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        50.0),
                                                                                    side: BorderSide(
                                                                                        color: AppStyles
                                                                                            .backgroundColorDark)))),
                                                                          ),
                                                                        ),
                                                                      ]
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              radius: 10.0);
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            'Th??m ch??? ?????',
                                                            style:
                                                            GoogleFonts.nunito(
                                                              fontSize: 14,
                                                              color: AppStyles
                                                                  .backgroundColorDark,
                                                              fontWeight:
                                                              FontWeight.w700,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ButtonStyle(
                                                            overlayColor:
                                                            MaterialStateProperty.all(
                                                                AppStyles
                                                                    .lightGreen),
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    50.0),
                                                                side: BorderSide(
                                                                    color: AppStyles
                                                                        .backgroundColorDark)))),
                                                      ),
                                                    ),
                                                      ]
                                                  ),
                                            ]
                                              ),
                                            );
                                          }
                                          )
                                      );
                                    }
                                    )
                            )
                        ),



                        SizedBox(
                          height: 20.0,
                        ),

                        Center(
                          child: Text(
                              "??ang ch???n: ${controller.selectedUserTopic.value.name}"),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Divider(),

                        ElasticIn(
                          child: Text(
                            'Ch???n ???nh cho t??? v???ng c???a b???n',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppStyles.backgroundColorDark,
                                fontWeight: FontWeight.bold),
                          ),
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

                        ElasticIn(
                          child: Text(
                            'V?? d??? cho t??? v???ng c???a b???n',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppStyles.backgroundColorDark,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.listExample.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.listExample[index],
                                  style: GoogleFonts.nunito(
                                    fontSize: 15,
                                    color: AppStyles.backgroundColorDark,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              );
                            }),

                        buildAddExample(controller),

                        Divider(),

                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.focusScope!.unfocus();
                                controller.createVocabulary();
                                // controller.createVocabularyWithFile();
                                // controller.createVocabularyWithDio();
                              } else {
                                controller.showNotification(
                                    typeNoti: false,
                                    message: "B???n ch??a nh???p th??ng tin!");
                              }
                            },
                            child: Center(
                              child: Text(
                                'L??u t??? v???ng',
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
                                    AppStyles.backgroundColor_D_Cyan),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        side: BorderSide(
                                            color: AppStyles
                                                .backgroundColorDark)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  Card buildAddExample(CreateVocabularyController controller) {
    return Card(
      color: AppStyles.primary,
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Get.focusScope!.unfocus();
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
                        labelText: 'Nh???p v?? d??? c???a b???n',
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
                            message: "B???n ch??a nh???p c??u v?? d???!");
                      }
                    },
                    child: Text(
                      'Th??m v?? d???',
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
      CreateVocabularyController controller, BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(controller.images.length, (index) {
        if (controller.images[index] != "photo_upload_button") {
          return GestureDetector(
            onTap: () {
              print("M??? ???nh ra");
            },
            child: Bounce(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Image.memory(
                        Base64Codec().decode(controller.images[index]),
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
                          controller.listImage.removeAt(index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Card(
            color: AppStyles.primary,
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Get.focusScope!.unfocus();
                // _onAddImageClick(index);
                // showMyAlertDialog(context, controller, index);
                showUploadImageDialog(context, controller, index);
              },
            ),
          );
        }
      }),
    );
  }

  Padding buildWordMeanTF(CreateVocabularyController controller) {
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
                  return "B???n ch??a nh???p ngh??a t??? v???ng!";
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
                hintText: 'Nh???p ngh??a t??? v???ng m???i',
                labelText: 'Ngh??a t??? v???ng m???i',
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

  Padding buildWordPronounceTF(CreateVocabularyController controller) {
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
                  return "B???n ch??a nh???p c??ch ph??t ??m t??? v???ng!";
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
                hintText: 'Nh???p c??ch ph??t ??m t??? v???ng',
                labelText: 'C??ch ph??t ??m t??? v???ng',
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

  Padding buildWordNameTF(CreateVocabularyController controller) {
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
                  return "B???n ch??a nh???p t??n t??? v???ng!";
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
                hintText: 'Nh???p t??? v???ng m???i',
                labelText: 'T??n t??? v???ng m???i',
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
                    "Danh s??ch t??? v???ng",
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
                    "T???o t??? v???ng",
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
                    "??n t??? v???ng",
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

  showUploadImageDialog(
      BuildContext context, CreateVocabularyController controller, int index) {
    Get.defaultDialog(
        title: 'B???n mu???n ch???n ???nh t???',
        titlePadding: EdgeInsets.all(10),
        titleStyle:
            TextStyle(fontSize: 16.0, color: AppStyles.backgroundColorDark),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(children: [
              FloatingActionButton(
                backgroundColor: AppStyles.backgroundColorDark,
                onPressed: () {
                  controller.onAddImage(index, ImageSource.camera);
                  // controller.onAddImageClick(index, ImageSource.camera);
                },
                tooltip: "M??y ???nh",
                child: Icon(
                  Icons.add_a_photo,
                  color: AppStyles.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("M??y ???nh")
            ]),
            Column(children: [
              FloatingActionButton(
                backgroundColor: AppStyles.backgroundColorDark,
                onPressed: () {
                  controller.onAddImage(index, ImageSource.gallery);
                  // controller.onAddImageClick(index, ImageSource.gallery);
                },
                tooltip: "Th?? vi???n ???nh",
                child: Icon(
                  Icons.camera_alt,
                  color: AppStyles.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Th?? vi???n ???nh")
            ]),
          ],
        ),
        radius: 8);
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
