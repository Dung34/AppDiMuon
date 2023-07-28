import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../../../data/resources/colors.dart';
import '../../../view/base/bloc/get_image/get_image_bloc.dart';
import '../container/primary_container.dart';
import '../shimmer/container_shimmer.dart';
import '../shimmer/primary_shimmer.dart';
import 'primary_image.dart';

class PrimaryReorderGridImage extends StatelessWidget {
  final int maxQuantity;
  final int crossAxisCount;
  final double childAspectRatio;
  final List<String> initialData;
  final GetImageBloc getImageBloc;
  final bool isAdd;
  final BoxFit? fit;
  final Function(List<ImageDataWrapper> imageData)? onDataChanged;

  const PrimaryReorderGridImage({
    Key? key,
    this.maxQuantity = 5,
    required this.initialData,
    this.childAspectRatio = 1,
    this.isAdd = true,
    required this.getImageBloc,
    this.crossAxisCount = 3,
    this.fit = BoxFit.contain,
    this.onDataChanged,
  }) : super(key: key);

  Map<String, dynamic> updateBusinessDetail() {
    return {
      "bannerList": getImageBloc.imageData,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getImageBloc
        ..add(GetImageInitialEvent(
            maxQuantity: maxQuantity,
            isAdd: isAdd,
            initialData: List<ImageDataWrapper>.from(initialData.map(
              (e) => ImageDataWrapper(type: ImageDataType.uri, data: e),
            )).toList())),
      child: BlocBuilder<GetImageBloc, GetImageState>(
        buildWhen: (pre, current) => current is GetImageSuccessState,
        builder: (context, state) {
          if (state is GetImageSuccessState) {
            onDataChanged?.call(state.imageData);
            return ReorderableGridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                onReorder: (oldIndex, newIndex) {
                  getImageBloc.add(GetImageReorderEvent(
                      oldIndex: oldIndex, newIndex: newIndex));
                },
                itemCount: state.imageData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) => state.imageData[index].type ==
                        ImageDataType.addNew
                    ? InkWell(
                        key: ValueKey(index),
                        onTap: () {
                          getImageBloc.add(GetImageMultiPickerEvent(
                              maxQuantity: maxQuantity));
                        },
                        child: DottedBorder(
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text('Tải ảnh lên'),
                              ],
                            ),
                          ),
                        ),
                      )
                    : PrimaryContainer(
                        key: ValueKey(index),
                        padding: const EdgeInsets.all(2),
                        borderColor: AppColor.gray09,
                        backgroundColor: AppColor.white,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            state.imageData[index].type ==
                                    ImageDataType.localPath
                                ? Image(
                                    image: FileImage(
                                        File(state.imageData[index].data)),
                                    fit: BoxFit.cover,
                                  )
                                : PrimaryNetworkImage(
                                    fit: fit,
                                    imageUrl: state.imageData[index].data ?? '',
                                  ),
                            if (isAdd == true)
                              Positioned(
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    getImageBloc.add(
                                        GetImageRemoveSingleImageEvent(
                                            imagePathIndex: index));
                                  },
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor:
                                        AppColor.black.withOpacity(0.5),
                                    child: const Icon(
                                      Icons.clear_sharp,
                                      size: 12,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ));
          } else {
            return const PrimaryShimmer(
                child: ContainerShimmer(
              height: 100,
            ));
          }
        },
      ),
    );
  }
}
