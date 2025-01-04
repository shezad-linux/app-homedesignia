import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

XFile? imagePicker;


final nameProvider = StateProvider<bool>((ref)=> false);
final projDeadLineProvider = StateProvider<bool>((ref)=> false);
final currentStatusprovider = StateProvider<bool>((ref)=> false);
final packageProjectImages = StateNotifierProvider<SelectedImage, XFile?>(
    (ref) => SelectedImage(imagePicker));

final dateOfoprojStartProvider = StateNotifierProvider<DateofJoining, DateTime>(
    (ref) => DateofJoining(DateTime.now()));


final endDateProvider = StateNotifierProvider<DateofJoining, DateTime>(
    (ref) => DateofJoining(DateTime.now()));

class SelectedImage extends StateNotifier<XFile?> {
  void pickImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(
      source: imageSource,
    );
    state = pickedImage;
  }

  SelectedImage(super.state);
}

class DateofJoining extends StateNotifier<DateTime> {
  Future<DateTime> pickDate(context) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2090));
    ;
    state = pickedDate ?? DateTime.now();

    return state;
  }

  DateofJoining(super.state);
}


class EndDate extends StateNotifier<DateTime> {
  Future<DateTime> pickDate(context) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2090));
    ;
    state = pickedDate ?? DateTime.now();

    return state;
  }

  EndDate(super.state);
}
