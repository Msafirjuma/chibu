import 'package:flutter/cupertino.dart';

import 'appconstants.dart';

BoxDecoration backgroundDecoration(){
 return BoxDecoration(
     gradient: RadialGradient(colors: [appThemeColor,appAlternateColor]),
      image: const DecorationImage(image: AssetImage(backgroundImage),fit: BoxFit.cover)
  );

}