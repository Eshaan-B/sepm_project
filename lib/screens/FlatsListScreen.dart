import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/FlatsList.dart';
import '../providers/flat_provider.dart';

class FlatsListScreen extends StatefulWidget {
  static const routeName = '/flatsListScreen';
  @override
  _FlatListScreenScreenState createState() => _FlatListScreenScreenState();
}

class _FlatListScreenScreenState extends State<FlatsListScreen> {
  var _flatName;
  bool isInit = true;
  List<FlatCard> _flatList;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      _flatName = ModalRoute.of(context).settings.arguments as String;
    }
    isInit = false;
    _flatList = [
      ...Provider.of<FlatProvider>(context)
          .flatList
          .where((element) => element.name == _flatName)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          print(Provider.of<FlatProvider>(context, listen: false)
              .flatNames
              .last
              .name);
        },
        child: Icon(Icons.filter),
      ),
      body: FlatsList(
        flatList: _flatList,
        name: _flatName,
      ),
    );
  }
}
