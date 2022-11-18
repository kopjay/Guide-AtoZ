import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:newsblog_prokit/component/NBAllNewsComponent.dart';
import 'package:newsblog_prokit/component/NBNewsComponent.dart';
import 'package:newsblog_prokit/main.dart';
import 'package:newsblog_prokit/model/NBModel.dart';
import 'package:newsblog_prokit/screen/NBSQuizRecord.dart';
import 'package:newsblog_prokit/utils/NBColors.dart';
import 'package:newsblog_prokit/utils/NBDataProviders.dart';
import 'package:newsblog_prokit/utils/NBImages.dart';

class NBHomeScreen extends StatefulWidget {
  static String tag = '/NBHomeScreen';

  @override
  NBHomeScreenState createState() => NBHomeScreenState();
}

class NBHomeScreenState extends State<NBHomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<NBDrawerItemModel> mDrawerList = nbGetDrawerItems();

  List<NBNewsDetailsModel> mNewsList = nbGetNewsDetails();
  List<NBNewsDetailsModel> mTechNewsList = [],
      mFashionNewsList = [],
      mSportsNewsList = [],
      mScienceNewsList = [];

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    tabController = TabController(length: 2, vsync: this);
    mNewsList.forEach((element) {
      if (element.categoryName == 'Quiz') {
        mTechNewsList.add(element);
      }
      // else if (element.categoryName == 'Fashion') {
      //   mFashionNewsList.add(element);
      // } else if (element.categoryName == 'Sports') {
      //   mSportsNewsList.add(element);
      // } else if (element.categoryName == 'Science') {
      //   mScienceNewsList.add(element);
      // }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('GUIDE AtoZ', style: boldTextStyle(size: 20)),
        backgroundColor: context.cardColor,
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: 'Home'),
            Tab(text: 'Quiz'),
            // Tab(text: 'Fashion'),
            // Tab(text: 'Sports'),
            // Tab(text: 'Science'),
          ],
          labelStyle: boldTextStyle(),
          labelColor: appStore.isDarkModeOn ? white : black,
          unselectedLabelStyle: primaryTextStyle(),
          unselectedLabelColor: grey,
          isScrollable: true,
          indicatorColor: NBPrimaryColor,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          NBAllNewsComponent(),
          QuizCard(),
          // NBNewsComponent(list: mFashionNewsList),
          // NBNewsComponent(list: mFashionNewsList),
          // NBNewsComponent(list: mSportsNewsList),
          // NBNewsComponent(list: mScienceNewsList),
        ],
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  const QuizCard({super.key});

  final String question1 =
      'Said to be the oldest city in the Netherlands, Nijmegen “makes you think you’ve gone back to Roman times”, proclaimed the local tourist office and they aren’t wrong.';
  final String question2 =
      'If you want to dive deep into the region’s history, stop at Museum De Bastei. And if you are a keen walker, consider taking part in the glorious ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Quiz 1'),
                    subtitle: Text('Quiz 1 is training to speech'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      ElevatedButton(
                        child: const Text('Start'),
                        onPressed: () {
                          NBSQuizRecord(question1).launch(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: NBPrimaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Quiz 2'),
                    subtitle: Text('Quiz 2 is training to speech 2'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      ElevatedButton(
                        child: const Text('Start'),
                        onPressed: () {
                          NBSQuizRecord(question2).launch(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: NBPrimaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
