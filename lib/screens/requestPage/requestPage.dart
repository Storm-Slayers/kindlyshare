import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kindlyshare/models/request_dummy.dart';
import 'package:kindlyshare/models/requests.dart';
import 'package:kindlyshare/screens/requestDetailsPage/requestDetailsPage.dart';
import 'package:kindlyshare/screens/requests_list.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  Stream<QuerySnapshot> _requestlist;

  @override
  void initState() {
    super.initState();
    _requestlist = Firestore.instance
        .collection('request_list')
        .orderBy('requestName')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _requestlist,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return Center(child: const Text('Loading...'));
            }
            return SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 120.0),
                    child: Text(
                      'How can you help today?',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FilterTabBar(),
                  SizedBox(
                    height: 20.0,
                  ),
                  LatestRequests(
                    documents: snapshot.data.documents,
                    header: 'Latest Requests',
                  ),
                  LatestRequests(
                    header: 'Featured Requests',
                    documents: snapshot.data.documents,
                    isFeatured: true,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class FilterTabBar extends StatefulWidget {
  @override
  _FilterTabBarState createState() => _FilterTabBarState();
}

class _FilterTabBarState extends State<FilterTabBar> {
  int _selectedIconIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.dumbbell,
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.tv,
    FontAwesomeIcons.medkit
  ];

  Widget _createIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIconIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIconIndex == index
              ? Theme.of(context).accentColor
              : Colors.grey[400],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(_icons[index], size: 25.0, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _icons
          .asMap()
          .entries
          .map(
            (MapEntry map) => _createIcon(map.key),
          )
          .toList(),
    );
  }
}

class LatestRequests extends StatelessWidget {
  LatestRequests({
    @required this.header,
    this.isFeatured,
    @required this.documents,
  });

  final List<DocumentSnapshot> documents;
  final String header;
  final bool isFeatured;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                header,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListPageTest()));
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
              )
            ],
          ),
        ),
        FeaturedCarousel(
          documents: documents,
        ),
      ],
    );
  }
}

class FeaturedCarousel extends StatelessWidget {
  const FeaturedCarousel({
    Key key,
    @required this.documents,
  }) : super(key: key);

  final List<DocumentSnapshot> documents;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return LatestRequestTile(
            document: documents[index],
          );
        },
      ),
    );
  }
}

class LatestRequestTile extends StatefulWidget {
  const LatestRequestTile({
    Key key,
    @required this.document,
  }) : super(key: key);

  final DocumentSnapshot document;
  @override
  _LatestRequestTileState createState() => _LatestRequestTileState();
}

class _LatestRequestTileState extends State<LatestRequestTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RequestDetailsPage(
                  data: widget.document,
                )));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: 210.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 15.0,
              child: Container(
                height: 120.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.document['requestName'] as String,
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2)),
                      Text(widget.document['requestDesc'] as String),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      height: 180.0,
                      width: 180.0,
                      image: NetworkImage('https://picsum.photos/250?image=9'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
