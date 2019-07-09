import 'package:chitr/home/model/ImageModel.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ImagePage extends StatefulWidget {
  final Hits model;
  ImagePage({this.model});

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            print(_controller.value);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        _controller.reverse();
                      } else {
                        _controller.forward();
                      }
                      print('onclick');
                    },
                    child: Image.network(
                      widget.model.webformatURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0, -_controller.value * 64),
                        child: Container(
                          height: 64.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: () {},
                                ),
                              ),
                              //Todo: Add functionality to set wallpaper
//                              Container(
//                                height: 64.0,
//                                padding: const EdgeInsets.only(right: 8.0),
//                                child: FlatButton(
//                                  child: Text('Set as wallpaper'),
//                                  onPressed: () {
//                                  },
//                                ),
//                              )
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, _controller.value * 64),
                        child: Container(
                          height: 64.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: CircleAvatar(
                                        radius: 16.0,
                                        backgroundImage: NetworkImage(
                                            widget.model.userImageURL),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(widget.model.user),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.share),
                                      onPressed: () {
                                        Share.share(widget.model.pageURL);
                                        print('share');
                                      },
                                    ),
                                    Visibility(
                                      visible: false,
                                      child: IconButton(
                                        icon: Icon(Icons.file_download),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
