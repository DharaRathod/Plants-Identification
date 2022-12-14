import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantidentification/constants/constants.dart';
import 'package:plantidentification/pages/plant_profile.dart';
import 'package:plantidentification/provider/fav_status.dart';

import 'package:provider/provider.dart';

class Activity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ActivityState();
  }
}

class ActivityState extends State<Activity> {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('plants')
        .orderBy('key', descending: false)
        .getDocuments();
    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
    Fav provideFav = Provider.of<Fav>(context, listen: false);
    provideFav.populateIsFav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.home,
          color: Colors.greenAccent,
          size: 28.0,
        ),
        title: Text(
          'Home',
          style: kPagetitle,
        ),
        backgroundColor: Colors.white70,
        elevation: 0,
      ),
      body: SafeArea(child: Consumer<Fav>(builder: (context, favValues, _) {
        return Stack(children: <Widget>[
          FutureBuilder(
              future: getPosts(),
              builder: (_, snapshot) {
                if (snapshot.error == true) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          navigatDetail(snapshot.data[index]);
                        },
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Stack(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    child: Image.network(
                                      snapshot.data[index].data['avatar'],
                                      height: 100,
                                      width: MediaQuery.of(context).size.width /
                                          2.4,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.local_florist,
                                            color: Colors.greenAccent,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            snapshot.data[index].data['name'],
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.class_,
                                            color: Colors.greenAccent,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            snapshot.data[index].data['family'],
                                            style: TextStyle(fontSize: 17.0),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 10,
                                top: 25,
                                child: IconButton(
                                    onPressed: () {
                                      if (favValues.isFav[index]) {
                                        Provider.of<Fav>(context, listen: false)
                                            .deleteFavStatus(snapshot
                                                .data[index].documentID);
                                      } else {
                                        Provider.of<Fav>(context, listen: false)
                                            .getUserandPost(snapshot
                                                .data[index].documentID);
                                      }

                                      // print(isFav);
                                    },
                                    icon: Icon(
                                        favValues.isFav[index]
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.greenAccent,
                                        size: 28)),
                              )
                            ],
                          ), //
                        ),
                      ),
                    );
                  },
                );
              })
        ]);
      })),
    );
  }

  navigatDetail(DocumentSnapshot post) {
    //print(post.data);
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => Profile(
          post: post,
        ),
      ),
    );
  }
}
