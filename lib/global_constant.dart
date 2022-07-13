// Theme Colors
import 'dart:io';

const int primaryColor = 0XFF3669C9;
const int secondaryColor = 0XFFFFFFFF;
const int backgroundColor = 0XFFEDEDED;
const int errorColor = 0XFFC93545;
const int successColor = 0XFF3A9B7A;
// Font Colors
const int primaryFontColor = 0XFF13181F;
const int secondaryFontColor = 0XFF838589;

// Screen Padding
const double horizontalPadding = 20;
const double verticalPadding = 15;

// Border Radius
const double radius = 15;

// Product Card Height
const double productCardHeight = 260;

// Password Length
const int passwordLength = 6;

Future<bool> checkUserConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
