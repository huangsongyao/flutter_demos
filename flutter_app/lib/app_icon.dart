import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppIconContants {
  static const AppIconFontsFamily = "AppIconFonts";
}

class AppColors {
  static const AppTabIconActiveColor = 0xff46c11b;
  static const AppTabIconTabBackgroundColor = 0xffCACACA;
  static const AppNotifyDotColor = 0xffF02826;

  static const Color AppClearColor = Color.fromRGBO(0, 0, 0, 0);
  static const Color AppTabIconActiveColorWidget = Color(AppTabIconActiveColor);
  static const Color AppTabIconTabBackgroundColorWidget =
      Color(AppTabIconTabBackgroundColor);
  static const Color AppNotifyDotColorWidget = Color(AppNotifyDotColor);
}

class AppContainer {
  static const AppContainerNotifyDotHeight = 14.0;
}

class AppImages {
  static const String imagePath = "assets";
  static const String imageSuffix = ".png";

  static String AppAssetImages(String name) {
    return "${imagePath}/${name}${imageSuffix}";
  }
}

class AppStaticMethods {
  //利用Container的decoration属性，设置底部的横线
  static BoxDecoration line(Color color, double width) {
    BoxDecoration line = BoxDecoration(
      border: Border(bottom: BorderSide(color: color, width: width)),
    );
    return line;
  }

  static BoxDecoration radiusBox(Color color, double circular, Border border) {
    BoxDecoration raidusBox = BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular(circular));
    return raidusBox;
  }

  static BoxDecoration blackLine() {
    return AppStaticMethods.line(Colors.black12, 1.0);
  }

  //利用Container的child设置圆角
  static ClipOval clipOvalNetImage(String networkUrl) {
    return ClipOval(
      child: Image.network(
        networkUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  static Container clipOvalAssetImage(String name, Size size) {
    return Container(
      height: size.height,
      width: size.width,
      child: ClipOval(
        child: Image.asset(
          AppImages.AppAssetImages(name),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  //利用Container容器做间隔排版
  static Container marginTainer(double sizes) {
    return Container(
      height: sizes,
      width: sizes,
      color: Colors.transparent,
    );
  }

  static Container backgroundNetworkImage(
      String networkUrlString, String placeholder) {
    Container backgroundImage = Container(
      child: CachedNetworkImage(
        imageUrl: networkUrlString,
        imageBuilder: (BuildContext context, ImageProvider imageProvider) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  alignment: Alignment.center),
            ),
          );
        },
        placeholder: (BuildContext context, String url) {
          return Container(
            child: Image.asset(AppImages.AppAssetImages(placeholder),
                fit: BoxFit.cover, alignment: Alignment.center),
          );
        },
      ),
    );
    return backgroundImage;
  }

  //返回一个固定尺寸的盒子组件，如果size的宽或者高有一个 <= 0.0，则box的size由本身child的Container容器的内容所决定
  static SizedBox boxContainer(@required Size size, @required Widget container,
      Color color, double circular) {
    return SizedBox.fromSize(
        size: size,
        child: Container(
          decoration: AppStaticMethods.radiusBox((color == null ? color : Colors.white), circular, null),
          child: container,
        ));
  }

  static RadialGradient gradientColors(List<Color> colors) {
    return RadialGradient(colors: colors);
  }

  static AspectRatio ratios(Size size, Widget widget) {
    return AspectRatio(
      aspectRatio: size.width / size.height,
      child: widget,
    );
  }

  static ConstrainedBox containerBox(Size maxSize, Widget widget) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: maxSize.width, maxHeight: maxSize.height),
      child: widget,
    );
  }

}

class AppScreen {
  static double AppScreenContextWidths(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double AppScreenContextHeights(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
