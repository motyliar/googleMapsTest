import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/screens/sectors_page.dart';

BitmapDescriptor customidIcon = BitmapDescriptor.defaultMarker;

List<Map<String, dynamic>> markers = [
  {
    'id': '1',
    'ltg': 52.4948,
    'lng': 17.3108,
    'icon': true,
    'icon2': true,
    'infoTitle': 'Nowa Ziemia',
    'onTap': const SectorsPage(sectorName: 'NowaZiemia'),
    'boolSportVisible': false,
    'boolArenaVisible': true
  },
  {
    'id': '2',
    'ltg': 52.3608,
    'lng': 16.6846,
    'icon': false,
    'icon2': true,
    'infoTitle': 'Karpacz',
    'onTap': const SectorsPage(
      sectorName: 'Karpacz',
    ),
    'boolSportVisible': true,
    'boolArenaVisible': false
  },
  {
    'id': '3',
    'ltg': 52.2332,
    'lng': 17.0911,
    'icon': false,
    'icon2': false,
    'infoTitle': 'Wieżyca',
    'onTap': const SectorsPage(
      sectorName: 'Wiezyca',
    ),
    'boolSportVisible': true,
    'boolArenaVisible': false
  }
];

List<Marker> setMarker(BuildContext context, BitmapDescriptor customideIcon,
    BitmapDescriptor custom, bool sportVisible, bool arenaVisible) {
  List<Marker> mark = [];

  for (var i = 0; i < markers.length; i++) {
    var item = Marker(
      visible: markers[i]['boolSportVisible'] ? sportVisible : arenaVisible,
      markerId: MarkerId(markers[i]['id']),
      position: LatLng(markers[i]['ltg'], markers[i]['lng']),
      infoWindow: InfoWindow(
        title: markers[i]['infoTitle'],
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => markers[i]['onTap']),
          ),
        ),
      ),
      icon: markers[i]['icon']
          ? customideIcon
          : markers[i]['icon2']
              ? BitmapDescriptor.defaultMarker
              : custom,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => markers[i]['onTap']),
        ),
      ),
    );

    mark.add(item);
  }
  return mark;
}
