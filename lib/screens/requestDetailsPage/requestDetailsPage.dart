import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kindlyshare/models/request_dummy.dart';
import 'package:kindlyshare/components/colors.dart';

class RequestDetailsPage extends StatefulWidget {
  final DocumentSnapshot data;
  RequestDetailsPage({this.data});
  @override
  _RequestDetailsPageState createState() => _RequestDetailsPageState();
}

class _RequestDetailsPageState extends State<RequestDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          HeaderImage(
            headingText: widget.data['requestName'] as String,
          ),
          SizedBox(
            height: 15.0,
          ),
          RequestInformation(
            description: widget.data['requestDesc'] as String,
            date: widget.data['requestDate'] as String,
          ),
          Expanded(
            
              
              child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 2.5,
                  colors: <Color>[AppColors.button_gradient1, AppColors.button_gradient2],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10.0),
              color: Theme.of(context).accentColor,
              width: double.infinity,
              child: Text(
                'ACCEPT REQUEST',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  HeaderImage({this.headingText});
  final String headingText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0)
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            child: Image(
              image: NetworkImage('https://picsum.photos/250?image=9'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          bottom: 10.0,
          child: Text(
            headingText,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        )
      ],
    );
  }
}

class RequestInformation extends StatelessWidget {
  RequestInformation({@required this.description, @required this.date});

  final String description;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
          height: 170.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                description,
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                date,
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        )
      ],
    );
  }
}
