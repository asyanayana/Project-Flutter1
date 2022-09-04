import 'dart:convert';
import 'dart:io';

import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_1/model/banner_request.dart';
import 'package:project_1/model/banner_response.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  List<BannerResponseData> banner = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {

    IdentityBanner identity = IdentityBanner(reqDateTime: DateTime.now(), token: "");

    BannerRequest request = BannerRequest(identity: identity, service: "");

    try {
      var response = await Dio().post("https://sapp-api.asyst.co.id/ticket-ext/v1/banner/retrieve",
        data: bannerRequestToJson(request),
        options: Options(headers: {HttpHeaders.authorizationHeader: "Bearer e03d553d-61e4-3859-8279-2dfea7d1c7fe"}),
      );
      print("REPONSE HEADER : ${response.statusCode}");
      BannerResponse resp = BannerResponse.fromJson(response.data);

      setState(() {
        banner = resp.data!;
        isLoading = false;
      });

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return banner.isNotEmpty ? imageSlide(banner) : Container(height: 230);
  }

  Widget imageSlide(List<BannerResponseData> slider) {
    return Container(
      height: 230,
      child: Carousel(
        images: [
          for(var data in slider)
            Image.memory(Base64Decoder().convert(data.imageCode!)),
        ],
        autoplay: false,
        dotSize: 5,
        dotSpacing: 10,
        dotColor: Colors.black26,
        dotIncreasedColor: Colors.blue,
        showIndicator: true,
        indicatorBgPadding: 5,
        dotBgColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 100),
      ),
    );
  }
}
