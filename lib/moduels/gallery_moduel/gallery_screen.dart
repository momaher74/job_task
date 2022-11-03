import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_task/component/shared_component/constant.dart';
import 'package:job_task/component/widgets/gallery_widgets/galler_background.dart';
import 'package:job_task/component/widgets/gallery_widgets/gallery_button.dart';
import 'package:job_task/component/widgets/gallery_widgets/gallery_item.dart';
import 'package:job_task/component/widgets/gallery_widgets/shared_text.dart';
import 'package:job_task/moduels/gallery_moduel/cubit/gallery_cubit.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                      physics: const BouncingScrollPhysics(),
                      child: Stack(
                        children: [
                          GalleryBackGround(
                            height: height,
                            width: width,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SharedText(
                                  txt: 'Welcome\nMina',
                                  color: Colors.black,
                                  txtSize: 32,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GalleryButton(txt: 'log out', width: 145 , function: (){}, color: const Color(0xffC83B3B), icon: Icons.arrow_back,),
                                  GalleryButton(txt: 'upload', width: 145 ,function: (){
                                   if(cubit.img==null){
                                     cubit.pickFile() ;
                                   }else{
                                     cubit.uploadImg() ;
                                   }
                                  },
                                  color: const Color(0xffF2A219),
                                    icon: Icons.upload,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              GridView.builder(
                                padding: const EdgeInsets.all(10),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    cubit.galleryModel!.data!.images.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 1 / 1,
                                ),
                                itemBuilder: (context, index) {
                                  String img = cubit.galleryModel!.data!.images[index];
                                  return GalleryItem(img: img);
                                },
                              )
                            ],
                          )
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

// Column column = ;
