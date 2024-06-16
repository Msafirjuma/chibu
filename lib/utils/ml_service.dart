import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class MLService {
  Interpreter? interpreter;
  double threshold = 0.5;

  final List _predictedData = [];

  List get predictedData => _predictedData;

  Future initialize() async {
    try {

      final interpreterOptions = InterpreterOptions();
      if(Platform.isAndroid){
        interpreterOptions.useNnApiForAndroid = true;
      }else{
        interpreterOptions.useMetalDelegateForIOS = true;
      }

      interpreter = await Interpreter.fromAsset('assets/mobilefacenet.tflite',options: interpreterOptions);

    } catch (e) {
      debugPrint('Failed to load model.');
      debugPrint(e.toString());
    }
  }
}
