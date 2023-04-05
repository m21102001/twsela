
import 'package:flutter/material.dart';
import 'package:twsela/components/default_app_bar.dart';



class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leadingFunction: (){},
        title: 'Map',
      ),
      body: Center(child: Text('Map screen')),
    );
  }


}
