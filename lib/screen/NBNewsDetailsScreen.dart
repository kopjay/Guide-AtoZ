import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:newsblog_prokit/main.dart';
import 'package:newsblog_prokit/model/NBModel.dart';
import 'package:newsblog_prokit/utils/NBColors.dart';
// import 'package:newsblog_prokit/utils/NBImages.dart';
import 'package:newsblog_prokit/utils/NBWidgets.dart';

class NBNewsDetailsScreen extends StatefulWidget {
  static String tag = '/NBNewsDetailsScreen';

  final NBNewsDetailsModel? newsDetails;

  NBNewsDetailsScreen({this.newsDetails});

  @override
  NBNewsDetailsScreenState createState() => NBNewsDetailsScreenState();
}

class NBNewsDetailsScreenState extends State<NBNewsDetailsScreen> {
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: appStore.isDarkModeOn ? white : black),
          onPressed: () {
            finish(context);
          },
        ),
        elevation: 0,
        backgroundColor: context.cardColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.newsDetails!.categoryName}',
                style: boldTextStyle(color: NBPrimaryColor)),
            Row(
              children: [
                Text('${widget.newsDetails!.title}',
                        style: boldTextStyle(size: 20))
                    .expand(flex: 3),
              ],
            ),
            16.height,
            commonCachedNetworkImage(
              widget.newsDetails!.image,
              height: 200,
              width: context.width(),
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(16),
            16.height,
            // ListTile(
            //   contentPadding: EdgeInsets.all(0),
            //   title: Text('by Jones Hawkins', style: boldTextStyle()),
            //   subtitle: Text('12 jan 2021', style: secondaryTextStyle()),
            //   leading:
            //       CircleAvatar(backgroundImage: AssetImage(NBProfileImage)),
            //   trailing: AppButton(
            //     elevation: 0,
            //     text: isFollowing ? 'Following' : 'Follow',
            //     onTap: () {
            //       setState(
            //         () {
            //           isFollowing = !isFollowing;
            //         },
            //       );
            //     },
            //     color: isFollowing ? grey.withOpacity(0.2) : black,
            //     textColor: isFollowing ? grey : white,
            //   ).cornerRadiusWithClipRRect(30),
            // ),
            16.height,
            Text('${widget.newsDetails!.details}',
                style: primaryTextStyle(), textAlign: TextAlign.justify),
            16.height,
            ExpansionTile(
              title: Text("FAQ QUESTION ONE"), //header title
              children: [
                Container(
                  color: Colors.black12,
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text("Answers for Question One"),
                )
              ],
            ),
            ExpansionTile(
              title: Text("FAQ QUESTION TWO"), //header title
              children: [
                Container(
                  color: Colors.black12,
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text("Answers for Question Two"),
                )
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
