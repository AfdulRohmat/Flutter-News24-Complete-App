import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/data/constants/constan_color.dart';
import 'package:flutter_news_app/app/data/models/news_articles_model.dart';
import 'package:flutter_news_app/app/data/services/news_api.dart';
import 'package:flutter_news_app/app/modules/home_page/widgets/category_tabbar.dart';
import 'package:flutter_news_app/app/modules/home_page/widgets/news_tile.dart';
import 'package:flutter_news_app/app/modules/widgets/appBar_title_with_logo.dart';
import 'package:flutter_news_app/app/modules/widgets/default_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitleWithLogo(),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: 16),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: cBlack,
            ),
            indicatorColor: Colors.transparent,
            labelColor: cWhite,
            unselectedLabelColor: cBlack,
            isScrollable: true,
            tabs: [
              Tab(text: 'For you'), //ok
              Tab(text: 'Health'), //ok
              Tab(text: 'Sports'), //ok
              Tab(text: 'Technology'), //ok
              Tab(text: 'Entertaiment'), //ok
              Tab(text: 'Science'), //ok
              Tab(text: 'Bussines'), //ok
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: TabBarView(
            children: [
              // ==> FOR YOU // GENERAL
              FutureBuilder<List<NewsArticlesModel>>(
                future: NewsAPI.getNewsFromAPI('general'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(cGrey),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          // print(snapshot.data!.length);
                          // HANDLE MANIPULATE TO GET BOOKMARK INFO
                          List<bool> isBookmarkedFromData = [
                            for (var i = 0; i < snapshot.data!.length; ++i)
                              false
                          ];

                          return NewsTile(
                            author: snapshot.data![index].author,
                            title: snapshot.data![index].title,
                            img: snapshot.data![index].img,
                            url: snapshot.data![index].url,
                            publishedAt: snapshot.data![index].publishedAt,
                            category: 'General',
                            detailData: snapshot.data![index].url,
                            isBookmarked: isBookmarkedFromData[index],
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16),
                        itemCount: 10,
                      );
                    }
                  }

                  return Container();
                },
              ),

              // ==> HEALTH
              FutureBuilder<List<NewsArticlesModel>>(
                future: NewsAPI.getNewsFromAPI('health'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(cGrey),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var isBookmarkedFromData = [
                            for (var i = 0; i < snapshot.data!.length; ++i)
                              false
                          ];
                          print(isBookmarkedFromData);
                          return NewsTile(
                            author: snapshot.data![index].author,
                            title: snapshot.data![index].title,
                            img: snapshot.data![index].img,
                            url: snapshot.data![index].url,
                            publishedAt: snapshot.data![index].publishedAt,
                            category: 'Health',
                            detailData: snapshot.data![index].url,
                            isBookmarked: isBookmarkedFromData[index],
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16),
                        itemCount: 10,
                      );
                    }
                  }
                  return Container();
                },
              ),

              // ==> Sports
              FutureBuilder<List<NewsArticlesModel>>(
                future: NewsAPI.getNewsFromAPI('sports'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(cGrey),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var isBookmarkedFromData = [
                            for (var i = 0; i < snapshot.data!.length; ++i)
                              false
                          ];
                          print(isBookmarkedFromData);
                          return NewsTile(
                            author: snapshot.data![index].author,
                            title: snapshot.data![index].title,
                            img: snapshot.data![index].img,
                            url: snapshot.data![index].url,
                            publishedAt: snapshot.data![index].publishedAt,
                            category: 'Sports',
                            detailData: snapshot.data![index].url,
                            isBookmarked: isBookmarkedFromData[index],
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16),
                        itemCount: 10,
                      );
                    }
                  }
                  return Container();
                },
              ),

              // ==> Technology
              FutureBuilder<List<NewsArticlesModel>>(
                future: NewsAPI.getNewsFromAPI('technology'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(cGrey),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var isBookmarkedFromData = [
                            for (var i = 0; i < snapshot.data!.length; ++i)
                              false
                          ];
                          print(isBookmarkedFromData);
                          return NewsTile(
                            author: snapshot.data![index].author,
                            title: snapshot.data![index].title,
                            img: snapshot.data![index].img,
                            url: snapshot.data![index].url,
                            publishedAt: snapshot.data![index].publishedAt,
                            category: 'Technology',
                            detailData: snapshot.data![index].url,
                            isBookmarked: isBookmarkedFromData[index],
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16),
                        itemCount: 10,
                      );
                    }
                  }
                  return Container();
                },
              ),
              // ==> ENTERTAIMENT
              FutureBuilder<List<NewsArticlesModel>>(
                future: NewsAPI.getNewsFromAPI('entertainment'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(cGrey),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var isBookmarkedFromData = [
                            for (var i = 0; i < snapshot.data!.length; ++i)
                              false
                          ];
                          print(isBookmarkedFromData);
                          return NewsTile(
                            author: snapshot.data![index].author,
                            title: snapshot.data![index].title,
                            img: snapshot.data![index].img,
                            url: snapshot.data![index].url,
                            publishedAt: snapshot.data![index].publishedAt,
                            category: 'Entertainment',
                            detailData: snapshot.data![index].url,
                            isBookmarked: isBookmarkedFromData[index],
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16),
                        itemCount: 10,
                      );
                    }
                  }
                  return Container();
                },
              ),

              // ==> SCIENCE
              FutureBuilder<List<NewsArticlesModel>>(
                future: NewsAPI.getNewsFromAPI('science'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(cGrey),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var isBookmarkedFromData = [
                            for (var i = 0; i < snapshot.data!.length; ++i)
                              false
                          ];
                          print(isBookmarkedFromData);
                          return NewsTile(
                            author: snapshot.data![index].author,
                            title: snapshot.data![index].title,
                            img: snapshot.data![index].img,
                            url: snapshot.data![index].url,
                            publishedAt: snapshot.data![index].publishedAt,
                            category: 'Science',
                            detailData: snapshot.data![index].url,
                            isBookmarked: isBookmarkedFromData[index],
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16),
                        itemCount: 10,
                      );
                    }
                  }
                  return Container();
                },
              ),

              // ==> BUSINESS
              FutureBuilder<List<NewsArticlesModel>>(
                future: NewsAPI.getNewsFromAPI('business'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(cGrey),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var isBookmarkedFromData = [
                            for (var i = 0; i < snapshot.data!.length; ++i)
                              false
                          ];
                          print(isBookmarkedFromData);
                          return NewsTile(
                            author: snapshot.data![index].author,
                            title: snapshot.data![index].title,
                            img: snapshot.data![index].img,
                            url: snapshot.data![index].url,
                            publishedAt: snapshot.data![index].publishedAt,
                            category: 'Business',
                            detailData: snapshot.data![index].url,
                            isBookmarked: isBookmarkedFromData[index],
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16),
                        itemCount: 10,
                      );
                    }
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
