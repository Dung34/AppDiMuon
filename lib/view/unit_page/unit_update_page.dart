import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constant/enum.dart';
import '../../data/resources/resources.dart';
import '../../domain/entity/okr/unit/unit.dart';
import '../../shared/utils/validation_utils.dart';
import '../../shared/widgets/button/primary_button.dart';
import '../../shared/widgets/something/primary_app_bar.dart';
import '../../shared/widgets/text_field/primary_text_field.dart';
import '../base/bloc/get_image/get_image_bloc.dart';
import 'cubit/unit_cubit.dart';

// ignore: must_be_immutable
class UnitUpdatePage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final titleFormKey = GlobalKey<FormState>();
  final descriptionFormKey = GlobalKey<FormState>();
  final Unit unit;
  final UnitCubit cubit;
  final GetImageBloc getImageBloc = GetImageBloc();

  UnitUpdatePage({super.key, required this.cubit, required this.unit});

  onUpdate() {
    getImageBloc.add(GetImageGetSingleImageUrlEvent(
        imagePath: getImageBloc.singleImagePath, imageType: ImageType.cover));
  }

  onGetImage() {
    getImageBloc
        .add(GetImagePickerEvent(shouldCrop: false, type: ImageType.cover));
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = unit.name ?? '';
    descriptionController.text = unit.description ?? '';

    return BlocProvider.value(
      value: getImageBloc,
      child: BlocConsumer<GetImageBloc, GetImageState>(
        listener: (context, state) {
          unit.name = titleController.text;
          unit.description = descriptionController.text;
          if (state is GetImageGetSingleImageUrlSuccessState) {
            unit.coverImage = state.imageUrl;
            cubit.updateUnit(unit);
            Navigator.pop(context);
          }
          if (state is GetImageGetSingleImageUrlErrorState) {
            unit.coverImage = null;
            cubit.updateUnit(unit);
            Navigator.pop(context);
          }
        },
        builder: (context, state) => Scaffold(
          backgroundColor: AppColor.primaryBackgroundColor,
          appBar: PrimaryAppBar(
            canPop: true,
            title: " Thêm Unit",
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tiêu đề'),
                PrimaryTextField(
                  borderColor: Colors.black,
                  maxLines: 20,
                  controller: titleController,
                  border: InputBorder.none,
                  hintText: "Thêm tiêu đề",
                  inputTextStyle: AppTextTheme.robotoMedium18,
                  maxLength: 100,
                  hintTextStyle: AppTextTheme.robotoLight18
                      .copyWith(color: AppColor.fourth700),
                  isRequired: true,
                  validator: ValidationUtils.textEmptyValidator,
                ),
                const Text('Nội dung'),
                PrimaryTextField(
                  controller: descriptionController,
                  border: InputBorder.none,
                  hintText: "Thêm nội dung",
                  inputTextStyle: AppTextTheme.robotoMedium18,
                  maxLength: 1000,
                  hintTextStyle: AppTextTheme.robotoLight18
                      .copyWith(color: AppColor.fourth700),
                  isRequired: true,
                  validator: ValidationUtils.textEmptyValidator,
                ),
                const Text('Ảnh'),
                state is GetImagePickImageSuccessState
                    ? Image(
                        image: FileImage(File(state.imagePath)),
                      )
                    : Container(),
                PrimaryButton(
                  context: context,
                  onPressed: () {
                    onGetImage();
                  },
                  label: 'Thêm ảnh',
                ),
                const SizedBox(height: 16.0),
                PrimaryButton(
                  context: context,
                  onPressed: () {
                    onUpdate();
                  },
                  label: 'Xác nhận',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
