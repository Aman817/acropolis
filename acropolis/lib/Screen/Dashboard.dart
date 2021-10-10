import 'package:acropolis/GetXHelper/FirebaseController.dart';
import 'package:acropolis/helper/api.dart';
import 'package:acropolis/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardActivity extends StatefulWidget {
  const DashboardActivity({Key key}) : super(key: key);

  @override
  _DashboardActivityState createState() => _DashboardActivityState();
}

class _DashboardActivityState extends State<DashboardActivity> {
  FirebaseController _p = FirebaseController();
  ApiServices _apiServices = new ApiServices();
  String datapage, button;
  Color but;

  @override
  void initState() {
    // TODO: implement initState
    datapage = "Book";
    button = "not";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _p.signout();
              },
              icon: Icon(Icons.power_settings_new))
        ],
        title: Text("Home"),
        backgroundColor: ui,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HeightBox(20),
            list(),
            HeightBox(20),
            Container(
                height: MediaQuery.of(context).size.height, child: datashow())
          ],
        ),
      )),
    );
  }

  Widget list() {
    return Container(
      height: 40,
      child: ListView(
        // This next line does the trick.
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                datapage = "Book";
                datashow();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: ui1, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 160.0,
              child: Center(child: Text("Book")),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                datapage = "App";
                datashow();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: ui1, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 160.0,
              child: Center(child: Text("App")),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                datapage = "Entertainment";
                datashow();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: ui1, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 160.0,
              child: Center(child: Text("Entertainment")),
            ),
          ),
        ],
      ),
    );
  }

  datashow() {
    if (datapage == "Book") {
      return book();
    } else if ("Entertainment" == datapage) {
      return movie();
    } else {
      return app();
    }
  }

  Widget book() {
    return FutureBuilder(
      future: _apiServices.question(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.book.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                snapshot.data.book[index].imageurl),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)),
                        ),
                        height: 100,
                        width: 100,
                        // child: ,
                      ),
                      Text(
                        snapshot.data.book[index].name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            snapshot.data.book[index].complete =
                                !snapshot.data.book[index].complete;
                            setState(() {});
                          },
                          icon: snapshot.data.book[index].complete
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border))
                    ],
                  ),
                );
              });
        }
        return Container();
      },
    );
  }

  Widget movie() {
    return FutureBuilder(
      future: _apiServices.question(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.movie.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                snapshot.data.movie[index].imageurl),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)),
                        ),
                        height: 100,
                        width: 100,
                        // child: ,
                      ),
                      Text(
                        snapshot.data.movie[index].name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            snapshot.data.movie[index].complete =
                                !snapshot.data.movie[index].complete;
                            setState(() {});
                          },
                          icon: snapshot.data.movie[index].complete
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border))
                    ],
                  ),
                );
              });
        }
        return Container();
      },
    );
  }

  Widget app() {
    return FutureBuilder(
      future: _apiServices.question(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.app.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(snapshot.data.app[index].imageurl),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)),
                        ),
                        height: 50,
                        width: 50,
                        // child: ,
                      ),
                      Text(
                        snapshot.data.app[index].name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            snapshot.data.app[index].complete =
                                !snapshot.data.app[index].complete;
                            setState(() {});
                          },
                          icon: snapshot.data.app[index].complete
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border))
                    ],
                  ),
                );
              });
        }
        return Container();
      },
    );
  }
}
