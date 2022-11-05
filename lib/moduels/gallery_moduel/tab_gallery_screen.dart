import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_task/component/widgets/gallery_widgets/gallery_button.dart';
import 'package:job_task/component/widgets/gallery_widgets/gallery_item.dart';
import 'package:job_task/component/widgets/gallery_widgets/shared_text.dart';
import 'package:job_task/moduels/gallery_moduel/cubit/gallery_cubit.dart';

import '../../component/shared_component/constant.dart';
import '../../component/widgets/gallery_widgets/option_widgets.dart';

class TabGalleryScreen extends StatelessWidget {
  const TabGalleryScreen({
    required this.name,
    Key? key,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider<GalleryCubit>(
      create: (context) => GalleryCubit()..getImages(),
      child: BlocConsumer<GalleryCubit, GalleryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GalleryCubit.get(context);

          return Scaffold(
            body: cubit.galleryModel != null
                ? SafeArea(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            width: width,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/gallerybg.png',
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 80,
                                ),
                                WelcomeText(
                                  name: name,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                ButtonsWidget(
                                  width: width,
                                  function: () {
                                    if (cubit.img != null) {
                                      cubit.uploadImg();
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => DialogWidget(
                                          width: width,
                                          cameraFunction: () {
                                            cubit.pickCameraImage();
                                          },
                                          galleryFunction: () {
                                            cubit.pickGalleryImage();
                                          },
                                        ),
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  width: width * .8,
                                  height: 400,
                                  child: ImagesWidget(
                                    count:
                                        cubit.galleryModel!.data!.images.length,
                                    images: cubit.galleryModel!.data!.images,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 2,
                            top: 20,
                            child: Container(
                              width: 60,
                              height: 80,
                              margin: const EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(imgUrl),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SharedText(
        txt: 'Welcome\n$name',
        color: Colors.black,
        txtSize: 32,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({Key? key, required this.function, required this.width})
      : super(key: key);
  final Function function;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GalleryButton(
          txt: 'log out',
          width: width * .4,
          function: () {},
          color: const Color(0xffC83B3B),
          icon: Icons.arrow_back,
        ),
        GalleryButton(
          txt: 'upload',
          width: width * .4,
          function: () {
            function();
          },
          color: const Color(0xffF2A219),
          icon: Icons.upload,
        ),
      ],
    );
  }
}

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({
    Key? key,
    required this.count,
    required this.images,
  }) : super(key: key);
  final int count;
  final List images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      itemCount: count,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1 / 1,
      ),
      itemBuilder: (context, index) {
        String img = images[index];
        return GalleryItem(img: img);
      },
    );
  }
}

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {Key? key,
      required this.cameraFunction,
      required this.galleryFunction,
      required this.width})
      : super(key: key);
  final Function galleryFunction;

  final Function cameraFunction;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          32,
        ),
      ),
      backgroundColor: Colors.white.withOpacity(.1),
      child: BlurryContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionWidget(
              width: width * .55,
              color: const Color(
                0xffEFD8F9,
              ),
              img: 'assets/images/icon3.png',
              txt: 'Gallery',
              function: () {
                galleryFunction();
              },
            ),
            const SizedBox(
              height: 60,
            ),
            OptionWidget(
              width: width * .55,
              color: const Color(
                0xffEBF6FF,
              ),
              img: 'assets/images/icon4.png',
              txt: 'Camera',
              function: () {
                cameraFunction();
              },
            ),
          ],
        ),
        width: width * 65,
        height: 300,
        elevation: 0,
        color: Colors.white.withOpacity(.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            30,
          ),
        ),
      ),
    );
  }
}

// Column column = ;
