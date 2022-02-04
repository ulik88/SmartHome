import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smart_home/resources/resources.dart';
import 'package:smart_home/theme/app_colors.dart';

class AppliancesListFireBase extends StatefulWidget {
  @override
  State<AppliancesListFireBase> createState() => _AppliancesListFireBaseState();
}

class _AppliancesListFireBaseState extends State<AppliancesListFireBase> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final Map<String, dynamic> _updateUser = <String, dynamic>{};

  void _updateCurrentUser() {}
  Color _c = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('aplliences').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) Text('Error: ${snapshot.error}');

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:

            default:
              return Container(
                margin: EdgeInsets.all(10),
                child: StaggeredGridView.countBuilder(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 1,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: GridView.count(
                        shrinkWrap: false,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 13,
                        crossAxisCount: 2,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return Dismissible(
                            onDismissed: (direction) {
                              setState(() {
                                FirebaseFirestore.instance
                                    .collection("aplliences")
                                    .doc(document.id)
                                    .delete();
                              });
                              setState(() {
                                FirebaseFirestore.instance
                                    .collection("aplliences")
                                    .doc(document.id)
                                    .update(_updateUser);
                              });
                            },
                            //background: Container(color: AppColors.splashColor),
                            key: ObjectKey(document),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.5)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white.withOpacity(0.8),
                                        blurRadius: 0,
                                        offset: Offset(0, 0))
                                  ]),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text('Status',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                        '' + document['title'].toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          FirebaseFirestore.instance
                                              .collection("aplliences")
                                              .doc(document.id)
                                              .update(_updateUser);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                          child: Icon(Icons.storm_rounded,
                                              color: _c),
                                        ),
                                      ),
                                      onTap: () {
                                        showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white
                                                    .withOpacity(0.9),
                                                insetPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 259),
                                                actionsAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                title: Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 0),
                                                  child: Center(
                                                      child: Text(
                                                          "Status of devices",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                ),
                                                content: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    TextField(
                                                      enabled: false,
                                                      textAlign:
                                                          TextAlign.start,
                                                      controller:
                                                          titleController,
                                                      decoration:
                                                          InputDecoration(
                                                        prefixIcon: Icon(
                                                          Icons.power,
                                                          color: _c,
                                                        ),
                                                        labelText:
                                                            " is current Status!",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                actions: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.all(0),
                                                    child: FlatButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        /*Navigator.of(context)
                                                              .userGestureInProgressNotifier
                                                              .addListener(() {
                                                            //AppliancesListFireBase();
                                                          });*/
                                                      },
                                                      child: Text(
                                                        "Undo",
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: FlatButton(
                                                        child: Text(
                                                          'Switch',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        onPressed:
                                                            () => setState(() {
                                                                  _c == AppColors.splashColor
                                                                      ? _c = Colors
                                                                          .black
                                                                      : _c = AppColors
                                                                          .splashColor;
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                })),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    //padding: const EdgeInsets.symmetric(vertical: 0),
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                          image: ResizeImage(
                                              AssetImage(AppImages.microvelle),
                                              width: 120,
                                              height: 105)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                  staggeredTileBuilder: (int index) {
                    return StaggeredTile.count(1, index.isEven ? 1.0 : 1.0);
                  },
                ),
              );
          }
        });
  }
}
