import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chitr/home/model/ImageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:share/share.dart';

class ImagePage extends StatefulWidget {
  final Hits model;
  final BoxFit imageBoxFit;
  ImagePage({this.model, this.imageBoxFit});

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _isLoading = false;
  static const platform = const MethodChannel('com.divyanshu.chitr/wallpaper');

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
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
                },
                child: CachedNetworkImage(
                  imageUrl: widget.model.largeImageURL,
                  fit: widget.imageBoxFit,
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
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Visibility(
                            visible: Platform.isAndroid,
                            child: Container(
                              height: 64.0,
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FlatButton(
                                child: _isLoading
                                    ? SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text('Set as wallpaper'),
                                onPressed: _setWallpaper,
                              ),
                            ),
                          )
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
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: CircleAvatar(
                                    radius: 16.0,
                                    backgroundImage:
                                        NetworkImage(widget.model.userImageURL),
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

  void _setWallpaper() async {
    setState(() {
      _isLoading = true;
    });
    var file =
        await DefaultCacheManager().getSingleFile(widget.model.largeImageURL);
    try {
      final int result = await platform.invokeMethod('setWallpaper', file.path);
      print('Wallpaer Updated.... $result');
    } on PlatformException catch (e) {
      print("Failed to Set Wallpaer: '${e.message}'.");
    }
    setState(() {
      _isLoading = false;
    });
  }
}
