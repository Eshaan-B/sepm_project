import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/flat_provider.dart';
import '../screens/ViewFlat.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';


class FlatsList extends StatelessWidget {
  final List<FlatCard> flatList;
  final String name;

  FlatsList({this.flatList, this.name});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          pinned: true,
          title: Text('Flats List'),
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/tower.jpg'),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return (index < flatList.length)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        margin: EdgeInsets.only(bottom: 20, top: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              height: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    flatList[index].name,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '${flatList[index].bhk}BHK',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '${flatList[index].sharing}S',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    child: Text('View'),
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          ViewFlat.routeName,
                                          arguments: flatList[index]);
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 125,
                              width: 125,

                              child: AssetThumb(
                                asset: flatList[index].images[0],
                                width: 300,
                                height: 300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : null;
            },
          ),
        )
      ],
    );
  }
}
