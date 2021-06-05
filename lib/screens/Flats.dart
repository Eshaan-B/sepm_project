import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../providers/flat_provider.dart';
import 'FlatsListScreen.dart';

class Flats extends StatefulWidget {
  static const routeName = '/flats';

  @override
  _FlatsState createState() => _FlatsState();
}

class _FlatsState extends State<Flats> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;
  GoogleMapController _controller;
  void _onMapCreated(GoogleMapController controller) {
    if( _controller == null )
      _controller = controller;
  }
  @override
  Widget build(BuildContext context) {
    List<FlatName> flatNames = Provider.of<FlatProvider>(context).flatNames;
    return Scaffold(
      appBar: AppBar(
        title: Text('Find your flats'),
      ),
      body: ChangeNotifierProvider.value(
        value: FlatProvider(),
        child: flatNames.isEmpty
            ? Center(child: Text('No Flats to show!'))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: GoogleMap(
                        myLocationEnabled: true,
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(target: LatLng(11.127123, 78.656891), zoom: 11.0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: flatNames.length,
                        itemBuilder: (ctx, index) {
                          return Card(
                            elevation: 4,
                            child: ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(flatNames[index].name),
                              trailing: IconButton(
                                icon: Icon(Icons.keyboard_arrow_right),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      FlatsListScreen.routeName,
                                      arguments: flatNames[index].name);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
