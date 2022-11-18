import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:newsblog_prokit/model/NBModel.dart';
import 'package:newsblog_prokit/screen/NBNewsDetailsScreen.dart';
import 'package:newsblog_prokit/utils/NBWidgets.dart';
import 'package:newsblog_prokit/utils/NBColors.dart';

class NBNewsImagesComponent extends StatefulWidget {
  static String tag = '/NBNewsImagesComponent';
  final List<NBNewsDetailsModel>? list;

  NBNewsImagesComponent({this.list});

  @override
  NBNewsImagesComponentState createState() => NBNewsImagesComponentState();
}

class NBNewsImagesComponentState extends State<NBNewsImagesComponent> {
  PageController? pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController =
        PageController(initialPage: pageIndex, viewportFraction: 0.9);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.height,
          Container(
            height: 200,
            child: PageView(
              controller: pageController,
              children: List.generate(
                widget.list!.length,
                (index) {
                  return commonCachedNetworkImage(
                    widget.list![index].image!,
                    fit: BoxFit.fill,
                  )
                      .cornerRadiusWithClipRRect(16)
                      .paddingRight(pageIndex < 2 ? 16 : 0)
                      .onTap(
                    () {
                      NBNewsDetailsScreen(newsDetails: widget.list![index])
                          .launch(context);
                      // NBSQuizRecord().launch(context);
                    },
                  );
                },
              ),
            ),
          ),
          8.height,
          DotIndicator(
            pageController: pageController!,
            pages: widget.list!,
            indicatorColor: NBPrimaryColor,
            unselectedIndicatorColor: gray,
          ),
        ],
      ),
    );
  }
}
