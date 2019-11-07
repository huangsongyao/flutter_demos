import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CustomBannerWidget extends StatefulWidget {
  final List<String> images;

  CustomBannerWidget({@required this.images});

  @override
  _CustomBannerWidgetState createState() =>
      _CustomBannerWidgetState(images: images);
}

class _CustomBannerWidgetState extends State<CustomBannerWidget> {
  final List<String> images;

  _CustomBannerWidgetState({@required this.images});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Swiper(
        itemCount: this.images.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(this.images[index], fit: BoxFit.fill,);
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
