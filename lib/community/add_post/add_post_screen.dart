import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../conts/app_height_width.dart';
import '../../app_colors.dart';
import '../../app_widgets/action_button_widget.dart';
import '../../app_widgets/app_text_widget.dart';
import '../../app_widgets/circle_button_widget.dart';
import '../../app_widgets/display_image_widget.dart';
import '../../app_widgets/icon_text_button_widget.dart';
import 'AddPostController.dart';
import 'package:fyp/community/community_screen.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPostController());
    return Scaffold(
      backgroundColor: Colors.pinkAccent.withOpacity(0.9),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     //TODO: Add your navigation Go back to Community Screen
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => CommunityScreen()),
      //     );
      //   },
      //   backgroundColor: accentColor,
      //   mini: true,
      //  // child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [


                // Screen Title => Slip Exit
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthX*.04),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                          child: AppTextWidget(
                              title: 'Add New Post',
                              fontSize: heightX*.03,
                              textColor: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [

                            // Captions
                            Card(
                              elevation: 15,
                              color: Colors.white,
                              shadowColor: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    AppTextWidget(title: 'Caption',
                                      fontSize: heightX*.0195,
                                      textColor: secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    SizedBox(height: heightX*.015,),

                                    // Text Paragraph=>
                                    TextFormField(
                                      maxLines: 3,
                                      validator: (value){
                                        if (kDebugMode) {
                                          print('Value empty: \$value');
                                        }
                                        if (value!.isEmpty) {
                                          return 'Add Captions';
                                        }
                                        return null;
                                      },
                                      controller: controller.captionController,
                                      keyboardType: TextInputType.multiline, // Enables multi-line input from keyboard
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: const BorderSide(color: secondaryColor,
                                                width: 2
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: const BorderSide(color: secondaryColor,
                                                width: 2
                                            )
                                        ),
                                        alignLabelWithHint: false,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      SizedBox(height: heightX*.03,),

                      //Upload Image
                      Card(
                        elevation: 15,
                        color: Colors.white,
                        shadowColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              // Text=> Upload Image
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: AppTextWidget(title: 'Upload Image',
                                    fontSize: heightX*.02,
                                    textColor: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              SizedBox(height: heightX*.03,),

                              Obx((){
                                if(controller.fileX.value != null){
                                  // Image: Selected Image
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        DisplayImageWidget(
                                          radius: .4,
                                          pickedImage: controller.croppedFile.value == null?
                                          controller.fileX.value!.path.toString()
                                              : controller.croppedFile.value!.path.toString(),
                                        ),

                                        SizedBox(height: heightX*.03,),

                                        IconTextButtonWidget(
                                          onTap: (){
                                            controller.cancelImage();
                                          },
                                          text: 'Cancel Image',
                                          icon: Icons.cancel_outlined,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                else{
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleButtonWidget(
                                        onTap: () {
                                          controller.cameraCapture();
                                        },
                                        title: 'Click Fresh Photo',
                                        icon: Icons.camera_alt_outlined,
                                      ),

                                      SizedBox(height: heightX*.04,),

                                      CircleButtonWidget(
                                        onTap: () {
                                          controller.galleryImage();
                                        },
                                        title: 'Pick From Gallery',
                                        icon: Icons.image_outlined,
                                      ),
                                    ],
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                      ),


                      SizedBox(height: heightX*.20,),

                      ActionButtonWidget(label: 'Post',
                          onTap: (){
                            controller.createPost();
                          }),


                      SizedBox(height: heightX*.03,),

                    ],
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}